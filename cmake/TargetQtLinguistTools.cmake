# @file	    TargetQtLinguistTools.cmake
# @brief	CMake script for finding QtLinguistTools and creating target for doing 
#           Qt linguist related things. The target could generate and update qt's *.ts
#           from the source code and/or generate qt's *.qm from the qt's *.ts files and 
#           copy them to ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}.
# @author	WUZHUOBIN
# @version	1.0
# @since	Aug.23.2018
# @date 	Aug.28.2018
# @log
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#			Copyright (c) WUZHUOBIN 											    #
#			All rights reserved.												    #
#			See Copyright.txt													    #
#			This software is distributed WITHOUT ANY WARRANTY; without even		    #
#			the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR	    #
#			PURPOSE.  See the above copyright notice for more information.		    #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Qt5LinguistTools 
find_package(Qt5LinguistTools REQUIRED)
# Manually set the *.ts files. 
list(
    APPEND
    PROJECT_TS
    ${PROJECT_TS}
    ${CMAKE_PROJECT_TS}
)
option(UPDATE_TS_FILES "Update Qt *.ts files. " OFF)
if(${UPDATE_TS_FILES})
    qt5_create_translation(
        PROJECT_QM
        ${CMAKE_SOURCE_DIR}
        ${CMAKE_BUILD_DIR}
        ${PROJECT_TS}
        OPTION
        -recursive
    )
elseif()
    qt5_add_translation(
        PROJECT_QM
        ${PROJECT_TS}
    )
endif()
list(
    APPEND
    PROJECT_SRC
    ${PROJECT_TS}
    ${PROJECT_QM}
)
add_custom_target(
	${PROJECT_NAME}_translator
	DEPENDS
	${PROJECT_QM}
	SOURCES
	${PROJECT_TS}
)
if(${MSVC})
	add_custom_command(
		TARGET
		${PROJECT_NAME}_translator
		POST_BUILD
		COMMAND
		${CMAKE_COMMAND} -E copy ${PROJECT_QM} ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/Release
		COMMENT "Copy ${PROJECT_QM} to ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/Release"
	)
	add_custom_command(
		TARGET
		${PROJECT_NAME}_translator
		POST_BUILD
		COMMAND
		${CMAKE_COMMAND} -E copy ${PROJECT_QM} ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/Debug
		COMMENT "Copy ${PROJECT_QM} to ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/Debug"
	)
else()
	add_custom_command(
		TARGET
		${PROJECT_NAME}_translator
		POST_BUILD
		COMMAND
		${CMAKE_COMMAND} -E copy ${PROJECT_QM} ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
		COMMENT "Copy ${PROJECT_QM} to ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}"
	)
endif()
install(
    FILES
    ${PROJECT_QM}
    DESTINATION
    bin
)
if(TARGET ${PROJECT_NAME})
    add_dependencies(
        ${PROJECT_NAME}
        ${PROJECT_NAME}_translator
    )
elseif(TARGET ${PROJECT_NAME}_main)
    add_dependencies(
        ${PROJECT_NAME}_main
        ${PROJECT_NAME}_translator
    )
endif()