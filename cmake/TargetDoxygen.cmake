# @file	    TargetDoxygen.cmake
# @brief	CMake script for finding doxygen and creating target to build documentation by 
#           using doxygen. This script could configure the file "doxyfile.in" in 
#           ${PROJECT_SOURCE_DIR}/doxygen/Doxyfile.in and use this configuration to 
#           build documentaiton.
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
if(BUILD_DOCUMENTATION)
    configure_file(
        ${PROJECT_SOURCE_DIR}/doxygen/Doxyfile.in
        ${PROJECT_BINARY_DIR}/doc/Doxyfile
        @ONLY
    )
    find_package(Doxygen REQUIRED)
    file(
        MAKE_DIRECTORY
        ${CMAKE_BINARY_DIR}/bin/doc/${PROJECT_NAME}
    )
    add_custom_target(
        ${PROJECT_NAME}_doc
        COMMAND
        Doxygen::doxygen
        ${PROJECT_BINARY_DIR}/doc/Doxyfile
        WORKING_DIRECTORY
        ${PROJECT_SOURCE_DIR}
    )
endif()
