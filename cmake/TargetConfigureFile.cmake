# @file	    TargetConfigureFile.cmake
# @brief	CMake script for configurating the *Config.cmake file. *Config.cmake.in must
#			be provided. This module is usually needed with TargetInstall.cmake  
#
# @author	WUZHUOBIN
# @version	1.1
# @since	Oct.24.2018
# @date 	Nov.28.2018
# @log
# Nov.28.2018:
# Ubuntu cannot create ${CMAKE_BINARY_DIR}/lib/cmake correctly. Adding creating 
# directory command.
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#			Copyright (c) WUZHUOBIN 											    #
#			All rights reserved.												    #
#			See Copyright.txt													    #
#			This software is distributed WITHOUT ANY WARRANTY; without even		    #
#			the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR	    #
#			PURPOSE.  See the above copyright notice for more information.		    #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


file(
	GLOB
	PROJECT_CONFIGURE_CMAKE
	${PROJECT_SOURCE_DIR}/cmake/*Config.cmake.in
)
foreach(ONE ${PROJECT_FIND_CMAKE})
	configure_file(
		${ONE}
		${CMAKE_BINARY_DIR}/lib/cmake
		@ONLY
	)
endforeach()
file(
	MAKE_DIRECTORY
	${CMAKE_BINARY_DIR}/lib/cmake
)
configure_file(
	${PROJECT_CONFIGURE_CMAKE}
	${CMAKE_BINARY_DIR}/lib/cmake/${PROJECT_NAME}Config.cmake
	@ONLY
)
install(
	FILES
	${CMAKE_BINARY_DIR}/lib/cmake/${PROJECT_NAME}Config.cmake
	${PROJECT_FIND_CMAKE}
	DESTINATION
	lib/cmake
)