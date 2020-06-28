# Install script for directory: /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii")
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
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/spii" TYPE FILE FILES
    "/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/include/spii/auto_diff_change_of_variables.h"
    "/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/include/spii/auto_diff_term.h"
    "/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/include/spii/change_of_variables.h"
    "/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/include/spii/color.h"
    "/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/include/spii/constrained_function.h"
    "/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/include/spii/dynamic_auto_diff_term.h"
    "/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/include/spii/error_utils.h"
    "/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/include/spii/function.h"
    "/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/include/spii/function_serializer.h"
    "/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/include/spii/google_test_compatibility.h"
    "/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/include/spii/interval.h"
    "/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/include/spii/interval_term.h"
    "/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/include/spii/solver-callbacks.h"
    "/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/include/spii/solver.h"
    "/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/include/spii/spii.h"
    "/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/include/spii/string_utils.h"
    "/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/include/spii/sym-ildl-conversions.h"
    "/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/include/spii/term.h"
    "/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/include/spii/term_factory.h"
    "/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/include/spii/transformations.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/spii-thirdparty" TYPE FILE FILES
    "/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/include/spii-thirdparty/badiff.h"
    "/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/include/spii-thirdparty/fadbad.h"
    "/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/include/spii-thirdparty/fadiff.h"
    "/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/include/spii-thirdparty/tadiff.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/thirdparty/meschach/cmake_install.cmake")
  include("/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/data/cmake_install.cmake")
  include("/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/benchmarks/cmake_install.cmake")
  include("/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/examples/cmake_install.cmake")
  include("/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/large_tests/cmake_install.cmake")
  include("/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/source/cmake_install.cmake")
  include("/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/tests/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
