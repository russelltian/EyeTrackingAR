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
include tests/CMakeFiles/test_suite_pattern_search.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/test_suite_pattern_search.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/test_suite_pattern_search.dir/flags.make

tests/CMakeFiles/test_suite_pattern_search.dir/test_suite_pattern_search.cpp.o: tests/CMakeFiles/test_suite_pattern_search.dir/flags.make
tests/CMakeFiles/test_suite_pattern_search.dir/test_suite_pattern_search.cpp.o: /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/tests/test_suite_pattern_search.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/test_suite_pattern_search.dir/test_suite_pattern_search.cpp.o"
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_suite_pattern_search.dir/test_suite_pattern_search.cpp.o -c /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/tests/test_suite_pattern_search.cpp

tests/CMakeFiles/test_suite_pattern_search.dir/test_suite_pattern_search.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_suite_pattern_search.dir/test_suite_pattern_search.cpp.i"
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/tests/test_suite_pattern_search.cpp > CMakeFiles/test_suite_pattern_search.dir/test_suite_pattern_search.cpp.i

tests/CMakeFiles/test_suite_pattern_search.dir/test_suite_pattern_search.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_suite_pattern_search.dir/test_suite_pattern_search.cpp.s"
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/tests/test_suite_pattern_search.cpp -o CMakeFiles/test_suite_pattern_search.dir/test_suite_pattern_search.cpp.s

# Object files for target test_suite_pattern_search
test_suite_pattern_search_OBJECTS = \
"CMakeFiles/test_suite_pattern_search.dir/test_suite_pattern_search.cpp.o"

# External object files for target test_suite_pattern_search
test_suite_pattern_search_EXTERNAL_OBJECTS =

bin/test_suite_pattern_search: tests/CMakeFiles/test_suite_pattern_search.dir/test_suite_pattern_search.cpp.o
bin/test_suite_pattern_search: tests/CMakeFiles/test_suite_pattern_search.dir/build.make
bin/test_suite_pattern_search: lib/libspii.dylib
bin/test_suite_pattern_search: lib/libmeschach.a
bin/test_suite_pattern_search: tests/CMakeFiles/test_suite_pattern_search.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/test_suite_pattern_search"
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_suite_pattern_search.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/test_suite_pattern_search.dir/build: bin/test_suite_pattern_search

.PHONY : tests/CMakeFiles/test_suite_pattern_search.dir/build

tests/CMakeFiles/test_suite_pattern_search.dir/clean:
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/tests && $(CMAKE_COMMAND) -P CMakeFiles/test_suite_pattern_search.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/test_suite_pattern_search.dir/clean

tests/CMakeFiles/test_suite_pattern_search.dir/depend:
	cd /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii/tests /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/tests /Users/daweishi/Desktop/2019FALL/Capstone/AR/EyeTrackingAR/eye_fitter/singleeyefitter/spii/src/spii-build/tests/CMakeFiles/test_suite_pattern_search.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/test_suite_pattern_search.dir/depend

