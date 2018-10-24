# Components

--Providing loose coupling ways to extend EasyCMake functions. Just doing simple copy and paste files can add new dependency to the CMake build projects

## SubDirectory

1.  #### Subdirectory.cmake

    This module is used in build hierarchical cmake project. It will be include in the beginning of CMakeList.txt. It should be made of only `add_subdirectory(...)`. Adding all sub modules by adding a new line of `add_subdirectory(...)` inside. e.g. `add_subdirectory(QvtkUtil)  
    add_subdirectory(Filter)  
    add_subdirectory(Widget)  
    `

## Find Modules

These modules would be mainly used for finding dependency and linking library. They are included in the CMakeLists.txt before creation of the default CMake's targets.

1.  #### FindCTK.cmake

    This module is used for finding CTK and link its library.
2.  #### FindITK.cmake

    This module is used for finding ITK and link its library.
3.  #### FindQtCoreQtWidget.cmake

    This module is used for finding Qt5Core and Qt5Widget and link its library. The AUTOMOC function of cmake will be enabled, the cmake will automatically find and moc. All *.ui files of qt will be wrapped to generate qt's ui header. All *.qrc files of qt will be wrapped to generate qt resource source file.
4.  #### FindQtOpenGl.cmake

    This module is used for finding Qt5OpenGl and link its library. And FindQtCoreQtWidget is the prerequisite.
5.  #### FindQtPrintSupport.cmake

    This module is used for finding Qt5PrintSupport and link its library. And FindQtCoreQtWidget is the prerequisite.
6.  #### FindQtSql.cmake

    This module is used for finding Qt5Sql and link its library. And FindQtCoreQtWidget is the prerequisite.
7.  #### FindQtXml.cmake

    This module is used for finding Qt5Xml and link its library. And FindQtCoreQtWidget is the prerequisite.
8.  #### FindQtConcurrent.cmake

    This module is used for finding Qt5Concurrent and link its library. And FindQtCoreQtWidget is the prerequisite.
9.  #### FindVTK.cmake

    This module is used for finding VTK and its library.

## Target Modules

These moudles would be mainly used for creating a new target whether it dependens on others. Thery are included in he CMakeLists.txt after the creation of the default CMake's targets.

1.  #### TargetConfigureFile.cmake

    This module is used for configurating cmake's configure file when doing exporting. This is usually needed with TargetInstall.cmake
2.  #### TargetDoxygen.cmake

    This module is used for creating a new target using doxygen to build documentation while Doxyfile.in must be provided.
3.  #### TargetInstall.cmake

    This module is used for configurating cmake install target. The install target could export cmake configuration, shared libraries, static libraries and header files, which is needed to re-use this cmake package.
4.  #### TargetOtherResource.cmake

    This module is used for creating a new target which it copys some necessary resources (such as some STLs, some example images..) to the folder where exectuables are placed. The PATH set in `PROJECT_RESOURCE` must be a folder path. So it can be copied recursively.
5.  #### TargetQtLinguistTools.cmake

    This module is used for creating a new target which handles qt's *.ts files (Qt translation). This target will try to find QtLinguistTools. The module could generate correct *.qm file for the exectuable and copy it to the executable path.
6.  #### TargetQtTest.cmake

    This module is used for creating a new target about doing qtest and ctest. It will scan through the path `${PROJECT_SOURCE_DIR>/Testing/*.c*` and create exectuable for each file. Each executable will be added to ctest as well. Each *.c* file is suggested to written in qtest format but it is not compulsory. Since qtest need qobject, this target will append Qt5Core dependency.