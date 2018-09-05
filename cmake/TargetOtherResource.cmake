# @file	    TargetOtherResource.cmake
# @brief	CMake script for copying other resources to a right place.
# @author	WUZHUOBIN
# @version	1.0
# @since	Aug.23.2018
# @date 	Aug.23.2018
# @log
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#			Copyright (c) WUZHUOBIN 											    #
#			All rights reserved.												    #
#			See Copyright.txt													    #
#			This software is distributed WITHOUT ANY WARRANTY; without even		    #
#			the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR	    #
#			PURPOSE.  See the above copyright notice for more information.		    #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# OTHER RESOURCES
# Seting folders' paths in PROJECT_RESOURCE, paths must be folders.
# e.g. 
# set(
# 	PROJECT_RESOURCE
#	#PATH
# 	${PROJECT_SOURCE_DIR}/ResourceFolder1
# 	${PROJECT_SOURCE_DIR}/ResourceFolder2
# )
# # # # # # # # # # # # # # # # # CHANGE BELOW  # # # # # # # # # # # # # # # # 
set(
    PROJECT_RESOURCE
#    PATH
)
# Create target
add_custom_target(
    ${PROJECT_NAME}_resource
	ALL
	DEPENDS
	${PROJECT_RESOURCE}
)
foreach(ONE ${PROJECT_RESOURCE})
	get_filename_component(
		FOLDER_NAME 
		${ONE}
		NAME
	)
	if(${MSVC})
		add_custom_command(
			TARGET
			${PROJECT_NAME}_resource
			POST_BUILD
			COMMAND
			${CMAKE_COMMAND} -E make_directory ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/Release/${FOLDER_NAME} 
			COMMENT "Make a directory ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/Release/${FOLDER_NAME} "
		)
		add_custom_command(
			TARGET
			${PROJECT_NAME}_resource
			POST_BUILD
			COMMAND
			${CMAKE_COMMAND} -E copy_directory ${ONE} ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/Release/${FOLDER_NAME} 
			COMMENT "Copy ${ONE} to ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/Release/${FOLDER_NAME} "
		)
		add_custom_command(
			TARGET
			${PROJECT_NAME}_resource
			POST_BUILD
			COMMAND
			${CMAKE_COMMAND} -E make_directory ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/Debug/${FOLDER_NAME} 
			COMMENT "Make a directory ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/Debug/${FOLDER_NAME} "
		)
		add_custom_command(
			TARGET
			${PROJECT_NAME}_resource
			POST_BUILD
			COMMAND
			${CMAKE_COMMAND} -E copy_directory ${ONE} ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/Debug/${FOLDER_NAME} 
			COMMENT "Copy ${ONE} to ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/Debug/${FOLDER_NAME} "
		)
	else()
		add_custom_command(
			TARGET
			${PROJECT_NAME}_resource
			POST_BUILD
			COMMAND
			${CMAKE_COMMAND} -E make_directory ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${FOLDER_NAME} 
			COMMENT "Make a directory ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${FOLDER_NAME} "
		)
		add_custom_command(
			TARGET
			${PROJECT_NAME}_resource
			POST_BUILD
			COMMAND
			${CMAKE_COMMAND} -E copy_directory ${ONE} ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${FOLDER_NAME} 
			COMMENT "Copy ${ONE} to ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${FOLDER_NAME} "
		)
	endif()
endforeach()
install(
	DIRECTORY
	${PROJECT_RESOURCE}
	DESTINATION
	bin
)
if(TARGET ${PROJECT_NAME})
    add_dependencies(
        ${PROJECT_NAME}
        ${PROJECT_NAME}_resource
    )
elseif(TARGET ${PROJECT_NAME}_main)
    add_dependencies(
        ${PROJECT_NAME}_main
        ${PROJECT_NAME}_resource
    )
endif()