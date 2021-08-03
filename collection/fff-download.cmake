# Download and unpack fff at configure time
configure_file(fff-download-CMakeLists.in
               ${CMAKE_BINARY_DIR}/fff-download/CMakeLists.txt @ONLY)
execute_process(
  COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" .
  RESULT_VARIABLE result
  WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/fff-download)
if(result)
  message(FATAL_ERROR "CMake step for fff failed: ${result}")
endif()
execute_process(
  COMMAND ${CMAKE_COMMAND} --build .
  RESULT_VARIABLE result
  WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/fff-download)
if(result)
  message(FATAL_ERROR "Build step for fff failed: ${result}")
endif()

# The path is needed for find_package(Gtest)
set(FFF_INCLUDE
    ${CMAKE_BINARY_DIR}/fff-install/include
    CACHE PATH FFF_INCLUDE)
set(FFF_FOUND
    TRUE
    PARENT_SCOPE)
