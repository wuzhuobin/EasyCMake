# @file	    TargetConfigureFile.cmake
# @brief	CMake script for configurating the *Config.cmake file. *Config.cmake.in must
#			be provided. This module is usually needed with TargetInstall.cmake  
#
# @author	WUZHUOBIN
# @version	1.0
# @since	Oct.24.2018
# @date 	Oct.24.2018
# @log
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