# Download and unpack googletest at configure time
configure_file(${CMAKE_SOURCE_DIR}/cmake/googletest-download-CMakeLists.in
               ${CMAKE_BINARY_DIR}/googletest-download/CMakeLists.txt @ONLY)
execute_process(
  COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" .
  RESULT_VARIABLE result
  WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/googletest-download)
if(result)
  message(FATAL_ERROR "CMake step for googletest failed: ${result}")
endif()

if(WIN32)
  execute_process(
    COMMAND ${CMAKE_COMMAND} --build . --config Release
    RESULT_VARIABLE result
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/googletest-download)
  execute_process(
    COMMAND ${CMAKE_COMMAND} --build . --config Debug
    RESULT_VARIABLE result
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/googletest-download)
else()
  execute_process(
    COMMAND ${CMAKE_COMMAND} --build .
    RESULT_VARIABLE result
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/googletest-download)
endif()

# Requirement for GoogleTest.cmake Policy CMP0054 is not set: Only interpret
# if() arguments as variables or keywords when unquoted.  Run "cmake
# --help-policy CMP0054" for policy details.  Use the cmake_policy command to
# set the policy and suppress this warning Policy CMP0057 is not set: Support
# new IN_LIST if() operator.  Run "cmake --help-policy CMP0057" for policy
# details.  Use the cmake_policy command to set the policy and suppress this
# warning.
cmake_policy(SET CMP0054 NEW)
cmake_policy(SET CMP0057 NEW)

# The path is needed for find_package(Gtest)
set(GTEST_ROOT
    ${CMAKE_BINARY_DIR}/googletest-install
    CACHE PATH GTEST_ROOT)
# this script import following targets: GTest::gtest GTest::gtest_main
# GTest::gmock GTest::gmock_main use them instead of find_package, GTest::GTest
# and GTest::Main
include(
  ${CMAKE_BINARY_DIR}/googletest-install/lib/cmake/GTest/GTestConfig.cmake)
# find_package for gtest cmake scripts
find_package(GTest REQUIRED)
