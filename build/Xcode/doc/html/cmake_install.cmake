# Install script for directory: /Users/yoshinaka/projects/buffalo/rakureco/flac/doc/html

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/FLAC/html" TYPE FILE FILES
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/doc/html/changelog.html"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/doc/html/developers.html"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/doc/html/documentation.html"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/doc/html/documentation_bugs.html"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/doc/html/documentation_example_code.html"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/doc/html/documentation_format_overview.html"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/doc/html/documentation_tools.html"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/doc/html/documentation_tools_flac.html"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/doc/html/documentation_tools_metaflac.html"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/doc/html/faq.html"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/doc/html/favicon.ico"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/doc/html/features.html"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/doc/html/flac.css"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/doc/html/format.html"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/doc/html/id.html"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/doc/html/index.html"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/doc/html/license.html"
    "/Users/yoshinaka/projects/buffalo/rakureco/flac/doc/html/ogg_mapping.html"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/yoshinaka/projects/buffalo/rakureco/flac/build/Xcode/doc/html/images/cmake_install.cmake")

endif()

