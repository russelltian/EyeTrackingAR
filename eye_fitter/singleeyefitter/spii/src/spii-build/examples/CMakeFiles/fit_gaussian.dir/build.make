# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.16.3/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.16.3/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build

# Include any dependencies generated for this target.
include examples/CMakeFiles/fit_gaussian.dir/depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/fit_gaussian.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/fit_gaussian.dir/flags.make

examples/CMakeFiles/fit_gaussian.dir/fit_gaussian.cpp.o: examples/CMakeFiles/fit_gaussian.dir/flags.make
examples/CMakeFiles/fit_gaussian.dir/fit_gaussian.cpp.o: /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/examples/fit_gaussian.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/CMakeFiles/fit_gaussian.dir/fit_gaussian.cpp.o"
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/examples && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/fit_gaussian.dir/fit_gaussian.cpp.o -c /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/examples/fit_gaussian.cpp

examples/CMakeFiles/fit_gaussian.dir/fit_gaussian.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/fit_gaussian.dir/fit_gaussian.cpp.i"
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/examples && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/examples/fit_gaussian.cpp > CMakeFiles/fit_gaussian.dir/fit_gaussian.cpp.i

examples/CMakeFiles/fit_gaussian.dir/fit_gaussian.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/fit_gaussian.dir/fit_gaussian.cpp.s"
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/examples && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/examples/fit_gaussian.cpp -o CMakeFiles/fit_gaussian.dir/fit_gaussian.cpp.s

# Object files for target fit_gaussian
fit_gaussian_OBJECTS = \
"CMakeFiles/fit_gaussian.dir/fit_gaussian.cpp.o"

# External object files for target fit_gaussian
fit_gaussian_EXTERNAL_OBJECTS =

bin/fit_gaussian: examples/CMakeFiles/fit_gaussian.dir/fit_gaussian.cpp.o
bin/fit_gaussian: examples/CMakeFiles/fit_gaussian.dir/build.make
bin/fit_gaussian: lib/libspii.dylib
bin/fit_gaussian: lib/libmeschach.a
bin/fit_gaussian: examples/CMakeFiles/fit_gaussian.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/fit_gaussian"
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fit_gaussian.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/fit_gaussian.dir/build: bin/fit_gaussian

.PHONY : examples/CMakeFiles/fit_gaussian.dir/build

examples/CMakeFiles/fit_gaussian.dir/clean:
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/examples && $(CMAKE_COMMAND) -P CMakeFiles/fit_gaussian.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/fit_gaussian.dir/clean

examples/CMakeFiles/fit_gaussian.dir/depend:
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/examples /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/examples /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/examples/CMakeFiles/fit_gaussian.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/CMakeFiles/fit_gaussian.dir/depend

