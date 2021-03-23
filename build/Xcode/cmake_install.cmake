# Install script for directory: /Users/yoshinaka/projects/buffalo/rakureco/flac

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/objdump")
endif()

set(CMAKE_BINARY_DIR "/Users/yoshinaka/projects/buffalo/rakureco/flac/build/Xcode")

if(NOT PLATFORM_NAME)
  if(NOT "$ENV{PLATFORM_NAME}" STREQUAL "")
    set(PLATFORM_NAME "$ENV{PLATFORM_NAME}")
  endif()
  if(NOT PLATFORM_NAME)
    set(PLATFORM_NAME iphoneos)
  endif()
endif()

if(NOT EFFECTIVE_PLATFORM_NAME)
  if(NOT "$ENV{EFFECTIVE_PLATFORM_NAME}" STREQUAL "")
    set(EFFECTIVE_PLATFORM_NAME "$ENV{EFFECTIVE_PLATFORM_NAME}")
  endif()
  if(NOT EFFECTIVE_PLATFORM_NAME)
    set(EFFECTIVE_PLATFORM_NAME -iphoneos)
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/FLAC/cmake/targets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/FLAC/cmake/targets.cmake"
         "/Users/yoshinaka/projects/buffalo/rakureco/flac/build/Xcode/CMakeFiles/Export/share/FLAC/cmake/targets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/FLAC/cmake/targets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/FLAC/cmake/targets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/FLAC/cmake" TYPE FILE FILES "/Users/yoshinaka/projects/buffalo/rakureco/flac/build/Xcode/CMakeFiles/Export/share/FLAC/cmake/targets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/FLAC/cmake" TYPE FILE FILES "/Users/yoshinaka/projects/buffalo/rakureco/flac/build/Xcode/CMakeFiles/Export/share/FLAC/cmake/targets-debug.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/FLAC/cmake" TYPE FILE FILES "/Users/yoshinaka/projects/buffalo/rakureco/flac/build/Xcode/CMakeFiles/Export/share/FLAC/cmake/targets-minsizerel.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/FLAC/cmake" TYPE FILE FILES "/Users/yoshinaka/projects/buffalo/rakureco/flac/build/Xcode/CMakeFiles/Export/share/FLAC/cmake/targets-relwithdebinfo.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/FLAC/cmake" TYPE FILE FILES "/Users/yoshinaka/projects/buffalo/rakureco/flac/build/Xcode/CMakeFiles/Export/share/FLAC/cmake/targets-release.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/FLAC/cmake" TYPE FILE FILES
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/build/Xcode/flac-config.cmake"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/build/Xcode/flac-config-version.cmake"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/cmake/FindOGG.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/FLAC" TYPE FILE FILES
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/include/FLAC/all.h"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/include/FLAC/assert.h"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/include/FLAC/callback.h"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/include/FLAC/export.h"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/include/FLAC/format.h"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/include/FLAC/metadata.h"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/include/FLAC/ordinals.h"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/include/FLAC/stream_decoder.h"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/include/FLAC/stream_encoder.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/FLAC++" TYPE FILE FILES
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/include/FLAC++/all.h"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/include/FLAC++/decoder.h"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/include/FLAC++/encoder.h"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/include/FLAC++/export.h"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/include/FLAC++/metadata.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/man" TYPE FILE FILES
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/man/flac.1"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/man/metaflac.1"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/yoshinaka/projects/buffalo/rakureco/flac/build/Xcode/doc/cmake_install.cmake")
  include("/Users/yoshinaka/projects/buffalo/rakureco/flac/build/Xcode/src/cmake_install.cmake")
  include("/Users/yoshinaka/projects/buffalo/rakureco/flac/build/Xcode/microbench/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/Users/yoshinaka/projects/buffalo/rakureco/flac/build/Xcode/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
