find_program(
  CMAKE_FORMAT
  NAMES cmake-format
  DOC "Program to format the cmake scripts. Using \"pip install cmakelang\" to install. If still haven't, restart computer."
)

if(CMAKE_FORMAT)
  file(
    GLOB_RECURSE
    CMAKE_FILES
    src/CMakeLists.txt
    test/CMakeLists.txt
    test_package/CMakeLists.txt
    example/CMakeLists.txt
    cmake/**.cmake)
  list(APPEND CMAKE_FILES CMakeLists.txt)
  add_custom_target(
    CMakeFormat
    COMMAND cmake-format -i ${CMAKE_FILES}
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "cmake-format -i ${CMAKE_FILES}")

  add_custom_target(
    CMakeLint
    COMMAND cmake-lint ${CMAKE_FILES}
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "cmake-lint"
    ${CMAKE_FILES})
endif()

find_program(
  CLANG_FORMAT
  NAMES clang-format-10
  DOC "Program to format the cpp codes. Uing \"apt install clang-format-10\" to install. If still haven't, restart computer."
)

if(CLANG_FORMAT)
  file(
    GLOB_RECURSE
    CPP_FILES
    src/*.c*
    src/*.h*
    test/*.c*
    test/*.h*
    include/*.h*
    example/*.c*
    example/*.h*)
  add_custom_target(
    clang-format
    COMMAND clang-format-10 -i ${CPP_FILES}
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "clang-format-10 -i ${CPP_FILES}")

  add_custom_target(
    clang-format-check
    COMMAND clang-format-10 --dry-run -Werror --ferror-limit=100 ${CPP_FILES}
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "clang-format-10 --dry-run -Werror ${CPP_FILES}")

endif()

find_program(
  CLANG_TIDY
  NAMES clang-tidy-10
  DOC "Program to tidy the cpp codes. Uing \"pip install clang-tidy-10\" to install. If still haven't, restart computer."
)

if(CLANG_TIDY)
  file(
    GLOB_RECURSE
    CPP_FILES
    src/*.c*
    src/*.h*
    test/*.c*
    test/*.h*
    include/*.h*
    example/*.c*
    example/*.h*)

  add_custom_target(
    clang-tidy
    COMMAND clang-tidy-10 --fix ${CPP_FILES} -p
            ${CMAKE_BINARY_DIR}/compile_commands.json
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT
      "clang-tidy-10 --fix ${CPP_FILES} -p ${CMAKE_BINARY_DIR}/compile_commands.json"
  )

  add_custom_target(
    clang-tidy-check
    COMMAND clang-tidy-10 ${CPP_FILES} -p
            ${CMAKE_BINARY_DIR}/compile_commands.json
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT
      "clang-tidy-10 ${CPP_FILES} -p ${CMAKE_BINARY_DIR}/compile_commands.json")

endif()
