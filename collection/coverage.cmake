include(CodeCoverage)

# The original setup_target_for_coverage_lcov bug which cannot recongnize the
# BASE_DIRECTORY argument.
function(setup_target_for_coverage_lcov)

  set(options NO_DEMANGLE)
  set(oneValueArgs BASE_DIRECTORY NAME INPUT_DIRECTORY OUTPUT_DIRECTORY)
  set(multiValueArgs EXCLUDE EXECUTABLE EXECUTABLE_ARGS DEPENDENCIES LCOV_ARGS
                     GENHTML_ARGS)
  cmake_parse_arguments(Coverage "${options}" "${oneValueArgs}"
                        "${multiValueArgs}" ${ARGN})

  if(NOT LCOV_PATH)
    message(FATAL_ERROR "lcov not found! Aborting...")
  endif() # NOT LCOV_PATH

  if(NOT GENHTML_PATH)
    message(FATAL_ERROR "genhtml not found! Aborting...")
  endif() # NOT GENHTML_PATH

  # Set base directory (as absolute path), or default to PROJECT_SOURCE_DIR
  if(Coverage_BASE_DIRECTORY)
    get_filename_component(BASEDIR ${Coverage_BASE_DIRECTORY} ABSOLUTE)
  else()
    set(BASEDIR ${PROJECT_SOURCE_DIR})
  endif()

  # Collect excludes (CMake 3.4+: Also compute absolute paths)
  set(LCOV_EXCLUDES "")
  foreach(EXCLUDE ${Coverage_EXCLUDE} ${COVERAGE_EXCLUDES}
                  ${COVERAGE_LCOV_EXCLUDES})
    if(CMAKE_VERSION VERSION_GREATER 3.4)
      get_filename_component(EXCLUDE ${EXCLUDE} ABSOLUTE BASE_DIR ${BASEDIR})
    endif()
    list(APPEND LCOV_EXCLUDES "${EXCLUDE}")
  endforeach()
  list(REMOVE_DUPLICATES LCOV_EXCLUDES)

  # Conditional arguments
  if(CPPFILT_PATH AND NOT ${Coverage_NO_DEMANGLE})
    set(GENHTML_EXTRA_ARGS "--demangle-cpp")
  endif()

  add_custom_target(
    ${Coverage_NAME}_MKDIR
    COMMAND ${CMAKE_COMMAND} -E remove_directory ${Coverage_OUTPUT_DIRECTORY}
    COMMAND ${CMAKE_COMMAND} -E make_directory ${Coverage_OUTPUT_DIRECTORY}
    COMMENT
      "${CMAKE_COMMAND} -E remove_directory ${Coverage_OUTPUT_DIRECTORY} /n ${CMAKE_COMMAND} -E make_directory ${Coverage_OUTPUT_DIRECTORY}"
    WORKING_DIRECTORY ${Coverage_INPUT_DIRECTORY}
    VERBATIM
    DEPENDS ${Coverage_DEPENDENCIES})
  # Cleanup lcov
  add_custom_target(
    ${Coverage_NAME}_CleanUp
    COMMAND
      ${LCOV_PATH} ${Coverage_LCOV_ARGS} --zerocounters --gcov-tool ${GCOV_PATH}
      --directory ${Coverage_INPUT_DIRECTORY} --base-directory ${BASEDIR}
    COMMENT
      "${LCOV_PATH} ${Coverage_LCOV_ARGS} --zerocounters --gcov-tool ${GCOV_PATH} --directory ${Coverage_INPUT_DIRECTORY} --base-directory ${BASEDIR}"
    WORKING_DIRECTORY ${Coverage_INPUT_DIRECTORY}
    VERBATIM
    DEPENDS ${Coverage_NAME}_MKDIR)
  # Create baseline to make sure untouched files show up in the report
  set(${Coverage_NAME}_BASE ${Coverage_OUTPUT_DIRECTORY}/${Coverage_NAME}.base)
  add_custom_command(
    OUTPUT ${${Coverage_NAME}_BASE}
    COMMAND
      ${LCOV_PATH} ${Coverage_LCOV_ARGS} --capture --initial --gcov-tool
      ${GCOV_PATH} --directory ${Coverage_INPUT_DIRECTORY} --base-directory
      ${BASEDIR} --output-file ${${Coverage_NAME}_BASE}
    COMMENT
      "${LCOV_PATH} ${Coverage_LCOV_ARGS} --capture --initial --gcov-tool ${GCOV_PATH} --directory ${Coverage_INPUT_DIRECTORY} --base-directory ${BASEDIR} --output-file ${${Coverage_NAME}_BASE}"
    WORKING_DIRECTORY ${Coverage_INPUT_DIRECTORY}
    VERBATIM
    DEPENDS ${Coverage_NAME}_CleanUp)
  # Run tests
  add_custom_target(
    ${Coverage_NAME}_RunTests
    COMMAND ${Coverage_EXECUTABLE} ${Coverage_EXECUTABLE_ARGS}
    COMMENT "${Coverage_EXECUTABLE} ${Coverage_EXECUTABLE_ARGS}"
    WORKING_DIRECTORY ${Coverage_INPUT_DIRECTORY}
    VERBATIM
    DEPENDS ${${Coverage_NAME}_BASE})
  # Capturing lcov counters and generating report
  set(${Coverage_NAME}_CAPTURE
      ${Coverage_OUTPUT_DIRECTORY}/${Coverage_NAME}.capture)
  add_custom_command(
    OUTPUT ${${Coverage_NAME}_CAPTURE}
    COMMAND
      ${LCOV_PATH} ${Coverage_LCOV_ARGS} --capture --gcov-tool ${GCOV_PATH}
      --directory ${Coverage_INPUT_DIRECTORY} --base-directory ${BASEDIR}
      --output-file ${${Coverage_NAME}_CAPTURE}
    COMMENT
      "${LCOV_PATH} ${Coverage_LCOV_ARGS} --capture --gcov-tool ${GCOV_PATH} --directory ${Coverage_INPUT_DIRECTORY} --base-directory ${BASEDIR} --output-file ${${Coverage_NAME}_CAPTURE}"
    WORKING_DIRECTORY ${Coverage_INPUT_DIRECTORY}
    VERBATIM
    DEPENDS ${Coverage_NAME}_RunTests)
  # add baseline counters and combine
  set(${Coverage_NAME}_TOTAL
      ${Coverage_OUTPUT_DIRECTORY}/${Coverage_NAME}.total)
  add_custom_command(
    OUTPUT ${${Coverage_NAME}_TOTAL}
    COMMAND
      ${LCOV_PATH} ${Coverage_LCOV_ARGS} --gcov-tool ${GCOV_PATH}
      --add-tracefile ${${Coverage_NAME}_CAPTURE} --add-tracefile
      ${${Coverage_NAME}_CAPTURE} --output-file ${${Coverage_NAME}_TOTAL}
    COMMENT
      "${LCOV_PATH} ${Coverage_LCOV_ARGS} --gcov-tool ${GCOV_PATH} --add-tracefile ${${Coverage_NAME}_CAPTURE} --add-tracefile ${${Coverage_NAME}_CAPTURE} --output-file ${${Coverage_NAME}_TOTAL}"
    WORKING_DIRECTORY ${Coverage_INPUT_DIRECTORY}
    VERBATIM
    DEPENDS ${${Coverage_NAME}_BASE} ${${Coverage_NAME}_CAPTURE})
  # filter collected data to final coverage report
  set(${Coverage_NAME}_INFO ${Coverage_OUTPUT_DIRECTORY}/${Coverage_NAME}.info)
  add_custom_command(
    OUTPUT ${${Coverage_NAME}_INFO}
    COMMAND
      ${LCOV_PATH} ${Coverage_LCOV_ARGS} --gcov-tool ${GCOV_PATH} --remove
      ${${Coverage_NAME}_TOTAL} ${LCOV_EXCLUDES} --output-file
      ${${Coverage_NAME}_INFO}
    COMMENT
      "${LCOV_PATH} ${Coverage_LCOV_ARGS} --gcov-tool ${GCOV_PATH} --remove ${${Coverage_NAME}_TOTAL} ${LCOV_EXCLUDES} --output-file ${${Coverage_NAME}_INFO}"
    WORKING_DIRECTORY ${Coverage_INPUT_DIRECTORY}
    VERBATIM
    DEPENDS ${${Coverage_NAME}_TOTAL})
  # Generate HTML output
  add_custom_target(
    ${Coverage_NAME}_HTML
    COMMAND
      ${GENHTML_PATH} ${GENHTML_EXTRA_ARGS} ${Coverage_GENHTML_ARGS}
      --output-directory ${Coverage_OUTPUT_DIRECTORY}/html
      ${${Coverage_NAME}_INFO}
    COMMENT
      "${GENHTML_PATH} ${GENHTML_EXTRA_ARGS} ${Coverage_GENHTML_ARGS} --output-directory ${Coverage_OUTPUT_DIRECTORY}/html ${${Coverage_NAME}_INFO}"
    WORKING_DIRECTORY ${Coverage_INPUT_DIRECTORY}
    VERBATIM
    DEPENDS ${${Coverage_NAME}_INFO})
  # Generate gcov output
  add_custom_target(
    ${Coverage_NAME}_GCOV
    COMMAND find ${Coverage_INPUT_DIRECTORY} -iname *.c*.o -type f -exec
            ${GCOV_PATH} {} +
    COMMENT
      "find ${Coverage_INPUT_DIRECTORY} -iname *.c*.o -type f -exec ${GCOV_PATH} {} +"
    WORKING_DIRECTORY ${Coverage_OUTPUT_DIRECTORY}
    VERBATIM
    DEPENDS ${${Coverage_NAME}_INFO})

  # Setup target
  add_custom_target(
    ${Coverage_NAME}
    DEPENDS ${Coverage_NAME}_CleanUp
            ${${Coverage_NAME}_BASE}
            ${Coverage_NAME}_RunTests
            ${${Coverage_NAME}_CAPTURE}
            ${${Coverage_NAME}_TOTAL}
            ${${Coverage_NAME}_INFO}
            ${Coverage_NAME}_HTML
            ${Coverage_NAME}_GCOV
    COMMENT
      "Resetting code coverage counters to zero.\nProcessing code coverage counters and generating report."
    WORKING_DIRECTORY ${Coverage_INPUT_DIRECTORY}
    VERBATIM # Protect arguments to commands
  )

  # Show where to find the lcov info report
  add_custom_command(
    TARGET ${Coverage_NAME}
    POST_BUILD
    COMMAND ;
    COMMENT "Lcov code coverage info report saved in ${Coverage_NAME}.info.")

  # Show info where to find the report
  add_custom_command(
    TARGET ${Coverage_NAME}
    POST_BUILD
    COMMAND ;
    COMMENT
      "Open ./${Coverage_NAME}/index.html in your browser to view the coverage report."
  )

endfunction() # setup_target_for_coverage_lcov
