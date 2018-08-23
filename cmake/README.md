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

    This module are used for find CTK and link its library.
2.  #### FindITK.cmake

    This module are used for find ITK and link its library.
3.  #### FindQtCoreQtWidget.cmake

4.  #### FindQtOpenGl.cmake

5.  #### FindQtPrintSupport.cmake

## Target Modules

These moudles would be mainly used for creating new target whether it dependens on others. Thery are included in he CMakeLists.txt after the creation of the default CMake's targets.

1.  #### TargetConfigureFile.cmake

2.  #### TargetInstall.cmake

3.  #### TargetOtherResource.cmake

4.  #### TargetQtLinguistTools.cmake

5.  #### TargetQtTest.cmake