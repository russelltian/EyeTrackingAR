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
include examples/CMakeFiles/lennard_jones.dir/depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/lennard_jones.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/lennard_jones.dir/flags.make

examples/CMakeFiles/lennard_jones.dir/lennard_jones.cpp.o: examples/CMakeFiles/lennard_jones.dir/flags.make
examples/CMakeFiles/lennard_jones.dir/lennard_jones.cpp.o: /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/examples/lennard_jones.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/CMakeFiles/lennard_jones.dir/lennard_jones.cpp.o"
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/examples && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lennard_jones.dir/lennard_jones.cpp.o -c /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/examples/lennard_jones.cpp

examples/CMakeFiles/lennard_jones.dir/lennard_jones.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lennard_jones.dir/lennard_jones.cpp.i"
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/examples && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/examples/lennard_jones.cpp > CMakeFiles/lennard_jones.dir/lennard_jones.cpp.i

examples/CMakeFiles/lennard_jones.dir/lennard_jones.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lennard_jones.dir/lennard_jones.cpp.s"
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/examples && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/examples/lennard_jones.cpp -o CMakeFiles/lennard_jones.dir/lennard_jones.cpp.s

# Object files for target lennard_jones
lennard_jones_OBJECTS = \
"CMakeFiles/lennard_jones.dir/lennard_jones.cpp.o"

# External object files for target lennard_jones
lennard_jones_EXTERNAL_OBJECTS =

bin/lennard_jones: examples/CMakeFiles/lennard_jones.dir/lennard_jones.cpp.o
bin/lennard_jones: examples/CMakeFiles/lennard_jones.dir/build.make
bin/lennard_jones: lib/libspii.dylib
bin/lennard_jones: lib/libmeschach.a
bin/lennard_jones: examples/CMakeFiles/lennard_jones.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/lennard_jones"
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lennard_jones.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/lennard_jones.dir/build: bin/lennard_jones

.PHONY : examples/CMakeFiles/lennard_jones.dir/build

examples/CMakeFiles/lennard_jones.dir/clean:
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/examples && $(CMAKE_COMMAND) -P CMakeFiles/lennard_jones.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/lennard_jones.dir/clean

examples/CMakeFiles/lennard_jones.dir/depend:
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/examples /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/examples /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/examples/CMakeFiles/lennard_jones.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/CMakeFiles/lennard_jones.dir/depend

