# @file	    FindOpenCV.cmake
# @brief	CMake script for find OpenCV.
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
# OpenCV 
find_package(OpenCV REQUIRED)
list(
    APPEND
    PROJECT_LIBRARY
    ${OpenCV_LIBS}
)

list(
    APPEND
    PROJECT_INCLUDE
    ${OpenCV_INCLUDE_DIRS}
)