# @file	    TargetInstall.cmake
# @brief	CMake script for configurating cmake install target and 
#			exporting cmake configuration, static libraries, shared libraries and header files.
#			This is very useful in building cmake package, which could be re-used by 
#			other cmake project. Other cmake project could re-use this package by "find_package()". 
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

# # # # # # # # # # # # # # # # # EXPORT # # # # # # # # # # # # # # # # # # # # # 
# installation to be continue.
# comment following for normal source project
if(TARGET ${PROJECT_NAME})
	install(
		TARGETS ${PROJECT_NAME}
		EXPORT ${PROJECT_NAME} 
		RUNTIME DESTINATION bin
		LIBRARY DESTINATION lib
		ARCHIVE DESTINATION lib
		INCLUDES DESTINATION include
	)
	export(
		EXPORT
		${PROJECT_NAME}
		FILE
		${CMAKE_BINARY_DIR}/lib/cmake/${PROJECT_NAME}.cmake
	)
	install(
		FILES 
		${PROJECT_BINARY_DIR}/${PROJECT_NAME}_export.h
		${PROJECT_INC}
		DESTINATION
		include
	)
	install(
		EXPORT ${PROJECT_NAME}
		DESTINATION lib/cmake
	)
endif()