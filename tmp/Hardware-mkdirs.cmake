# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "W:/Firmware/Hardware"
  "W:/Firmware/Hardware"
  "W:/Firmware/Hardware"
  "W:/Firmware/tmp"
  "W:/Firmware/src/Hardware-stamp"
  "W:/Firmware/src"
  "W:/Firmware/src/Hardware-stamp"
)

set(configSubDirs Debug;Release;MinSizeRel;RelWithDebInfo)
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "W:/Firmware/src/Hardware-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "W:/Firmware/src/Hardware-stamp${cfgdir}") # cfgdir has leading slash
endif()
