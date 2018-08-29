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

These moudles would be mainly used for creating new target whether it dependens on others. Thery are included in he CMakeLists.txt after the creation of the default CMake's targets.

1.  #### TargetConfigureFile.cmake

    TBA
2.  #### TargetInstall.cmake

    TBA
3.  #### TargetOtherResource.cmake

    TBA
4.  #### TargetQtLinguistTools.cmake

    TBA
5.  #### TargetQtTest.cmake

    TBA