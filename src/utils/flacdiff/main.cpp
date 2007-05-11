/* flacdiff - Displays where two FLAC streams differ
 * Copyright (C) 2007  Josh Coalson
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */

#if HAVE_CONFIG_H
#  include <config.h>
#endif

#include <stdio.h>
#include <string.h>
#include "FLAC++/decoder.h"

class AutoFILE {
protected:
	::FILE *f_;
public:
	inline AutoFILE(const char *path, const char *mode): f_(::fopen(path, mode)) { }
	inline virtual ~AutoFILE() { if (f_) (void)::fclose(f_); }

	inline operator bool() const { return 0 != f_; }
	inline operator const ::FILE *() const { return f_; }
	inline operator ::FILE *() { return f_; }
private:
	AutoFILE();
	AutoFILE(const AutoFILE &);
	void operator=(const AutoFILE &);
};

class Decoder: public FLAC::Decoder::Stream {
public:
	Decoder(AutoFILE &f, off_t tgt): tgtpos_((FLAC__uint64)tgt), curpos_(0), go_(true), err_(false), frame_(), f_(f) { memset(&frame_, 0, sizeof(::FLAC__Frame)); }
	FLAC__uint64 tgtpos_, curpos_;
	bool go_, err_;
	::FLAC__Frame frame_;
protected:
	AutoFILE &f_;
	// from FLAC::Decoder::Stream
	virtual ::FLAC__StreamDecoderReadStatus read_callback(FLAC__byte buffer[], size_t *bytes)
	{
		*bytes = fread(buffer, 1, *bytes, f_);
		if(ferror(f_))
			return ::FLAC__STREAM_DECODER_READ_STATUS_ABORT;
		else if(*bytes == 0 && feof(f_))
			return ::FLAC__STREAM_DECODER_READ_STATUS_END_OF_STREAM;
		else
			return ::FLAC__STREAM_DECODER_READ_STATUS_CONTINUE;
	}

	virtual ::FLAC__StreamDecoderTellStatus tell_callback(FLAC__uint64 *absolute_byte_offset)
	{
		off_t off = ftello(f_);
		if(off < 0)
			return ::FLAC__STREAM_DECODER_TELL_STATUS_ERROR;
		*absolute_byte_offset = off;
		return ::FLAC__STREAM_DECODER_TELL_STATUS_OK;
	}

	virtual bool eof_callback()
	{
		return feof(f_);
	}

	virtual ::FLAC__StreamDecoderWriteStatus write_callback(const ::FLAC__Frame *frame, const FLAC__int32 * const /*buffer*/[])
	{
		FLAC__uint64 pos;
		if(!get_decode_position(&pos)) {
			go_ = false;
			err_ = true;
			return ::FLAC__STREAM_DECODER_WRITE_STATUS_ABORT;
		}
		if(pos > tgtpos_) {
			go_ = false;
			frame_ = *frame;
		}
		else
			curpos_ = pos;
		return ::FLAC__STREAM_DECODER_WRITE_STATUS_CONTINUE;
	}

	virtual void error_callback(::FLAC__StreamDecoderErrorStatus status)
	{
		fprintf(stderr, "get error %d:%s\n", status, ::FLAC__StreamDecoderErrorStatusString[status]);
		go_ = false;
		err_ = true;
	}
};

static bool show_diff(AutoFILE &f1, AutoFILE &f2, off_t off)
{
	Decoder d1(f1, off), d2(f2, off);
	if(!d1) {
		fprintf(stderr, "ERROR: setting up decoder1, state=%s\n", d1.get_state().resolved_as_cstring(d1));
		return false;
	}
	if(!d2) {
		fprintf(stderr, "ERROR: setting up decoder2, state=%s\n", d2.get_state().resolved_as_cstring(d2));
		return false;
	}
	::FLAC__StreamDecoderInitStatus is;
	if((is = d1.init()) != FLAC__STREAM_DECODER_INIT_STATUS_OK) {
		fprintf(stderr, "ERROR: initializing decoder1, status=%s state=%s\n", FLAC__StreamDecoderInitStatusString[is], d1.get_state().resolved_as_cstring(d1));
		return false;
	}
	if((is = d2.init()) != FLAC__STREAM_DECODER_INIT_STATUS_OK) {
		fprintf(stderr, "ERROR: initializing decoder2, status=%s state=%s\n", FLAC__StreamDecoderInitStatusString[is], d2.get_state().resolved_as_cstring(d2));
		return false;
	}
	if(!d1.process_until_end_of_metadata()) {
		fprintf(stderr, "ERROR: skipping metadata in decoder1, state=%s\n", d1.get_state().resolved_as_cstring(d1));
		return false;
	}
	if(!d2.process_until_end_of_metadata()) {
		fprintf(stderr, "ERROR: skipping metadata in decoder2, state=%s\n", d2.get_state().resolved_as_cstring(d2));
		return false;
	}
	while(d1.go_ && d2.go_) {
		if(!d1.process_single()) {
			fprintf(stderr, "ERROR: decoding frame in decoder1, state=%s\n", d1.get_state().resolved_as_cstring(d1));
			return false;
		}
		if(!d2.process_single()) {
			fprintf(stderr, "ERROR: decoding frame in decoder2, state=%s\n", d2.get_state().resolved_as_cstring(d2));
			return false;
		}
	}
	if(d1.err_) {
		fprintf(stderr, "ERROR: got err_ in decoder1, state=%s\n", d1.get_state().resolved_as_cstring(d1));
		return false;
	}
	if(d2.err_) {
		fprintf(stderr, "ERROR: got err_ in decoder2, state=%s\n", d2.get_state().resolved_as_cstring(d2));
		return false;
	}
	if(d1.go_ != d2.go_) {
		fprintf(stderr, "ERROR: d1.go_(%s) != d2.go_(%s)\n", d1.go_?"true":"false", d2.go_?"true":"false");
		return false;
	}
	fprintf(stdout, "pos1 = %llu  blocksize=%u sample#%llu frame#%llu\n", d1.curpos_, d1.frame_.header.blocksize, d1.frame_.header.number.sample_number, d1.frame_.header.number.sample_number / d1.frame_.header.blocksize);
	fprintf(stdout, "pos2 = %llu  blocksize=%u sample#%llu frame#%llu\n", d2.curpos_, d2.frame_.header.blocksize, d2.frame_.header.number.sample_number, d2.frame_.header.number.sample_number / d2.frame_.header.blocksize);

	return true;
}

static off_t get_diff_offset(AutoFILE &f1, AutoFILE &f2)
{
	off_t off = 0;
	while(1) {
		if(feof((FILE*)f1) && feof((FILE*)f1)) {
			fprintf(stderr, "ERROR: files are identical\n");
			return -1;
		}
		if(feof((FILE*)f1)) {
			fprintf(stderr, "ERROR: file1 EOF\n");
			return -1;
		}
		if(feof((FILE*)f2)) {
			fprintf(stderr, "ERROR: file2 EOF\n");
			return -1;
		}
		if(fgetc(f1) != fgetc(f2))
			return off;
		off++;
	}
}

static bool run(const char *fn1, const char *fn2)
{
	off_t off;
	AutoFILE f1(fn1, "rb"), f2(fn2, "rb");

	if(!f1) {
		fprintf(stderr, "ERROR: opening %s for reading\n", fn1);
		return false;
	}
	if(!f2) {
		fprintf(stderr, "ERROR: opening %s for reading\n", fn2);
		return false;
	}

	if((off = get_diff_offset(f1, f2)) < 0)
		return false;

	fprintf(stdout, "got diff offset = %u\n", (unsigned)off); //@@@ 4G limit (what is % modifier for off_t?)

	return show_diff(f1, f2, off);
}

int main(int argc, char *argv[])
{
	const char *usage = "usage: flacdiff flacfile1 flacfile2\n";

	if(argc > 1 && 0 == strcmp(argv[1], "-h")) {
		printf(usage);
		return 0;
	}
	else if(argc != 3) {
		fprintf(stderr, usage);
		return 255;
	}

	return run(argv[1], argv[2])? 0 : 1;
}