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
include examples/CMakeFiles/linear_programming_constrained_function.dir/depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/linear_programming_constrained_function.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/linear_programming_constrained_function.dir/flags.make

examples/CMakeFiles/linear_programming_constrained_function.dir/linear_programming_constrained_function.cpp.o: examples/CMakeFiles/linear_programming_constrained_function.dir/flags.make
examples/CMakeFiles/linear_programming_constrained_function.dir/linear_programming_constrained_function.cpp.o: /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/examples/linear_programming_constrained_function.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/CMakeFiles/linear_programming_constrained_function.dir/linear_programming_constrained_function.cpp.o"
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/examples && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/linear_programming_constrained_function.dir/linear_programming_constrained_function.cpp.o -c /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/examples/linear_programming_constrained_function.cpp

examples/CMakeFiles/linear_programming_constrained_function.dir/linear_programming_constrained_function.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/linear_programming_constrained_function.dir/linear_programming_constrained_function.cpp.i"
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/examples && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/examples/linear_programming_constrained_function.cpp > CMakeFiles/linear_programming_constrained_function.dir/linear_programming_constrained_function.cpp.i

examples/CMakeFiles/linear_programming_constrained_function.dir/linear_programming_constrained_function.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/linear_programming_constrained_function.dir/linear_programming_constrained_function.cpp.s"
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/examples && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/examples/linear_programming_constrained_function.cpp -o CMakeFiles/linear_programming_constrained_function.dir/linear_programming_constrained_function.cpp.s

# Object files for target linear_programming_constrained_function
linear_programming_constrained_function_OBJECTS = \
"CMakeFiles/linear_programming_constrained_function.dir/linear_programming_constrained_function.cpp.o"

# External object files for target linear_programming_constrained_function
linear_programming_constrained_function_EXTERNAL_OBJECTS =

bin/linear_programming_constrained_function: examples/CMakeFiles/linear_programming_constrained_function.dir/linear_programming_constrained_function.cpp.o
bin/linear_programming_constrained_function: examples/CMakeFiles/linear_programming_constrained_function.dir/build.make
bin/linear_programming_constrained_function: lib/libspii.dylib
bin/linear_programming_constrained_function: lib/libmeschach.a
bin/linear_programming_constrained_function: examples/CMakeFiles/linear_programming_constrained_function.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/linear_programming_constrained_function"
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/linear_programming_constrained_function.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/linear_programming_constrained_function.dir/build: bin/linear_programming_constrained_function

.PHONY : examples/CMakeFiles/linear_programming_constrained_function.dir/build

examples/CMakeFiles/linear_programming_constrained_function.dir/clean:
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/examples && $(CMAKE_COMMAND) -P CMakeFiles/linear_programming_constrained_function.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/linear_programming_constrained_function.dir/clean

examples/CMakeFiles/linear_programming_constrained_function.dir/depend:
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/examples /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/examples /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/examples/CMakeFiles/linear_programming_constrained_function.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/CMakeFiles/linear_programming_constrained_function.dir/depend

