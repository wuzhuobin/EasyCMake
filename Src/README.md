# EasyCMake

-- A template for creatint cmake project rapidly.

## Manual

1.  Creating a well named folder.
    *   Folder name will be used as project name.
    *   The folder name must be unique, since it will be used as library name or executable name.
2.  Placing codes in the folder, header files and source files.

*   The folder will be scan when doing cmake configure.

4.  Creating a cmake folder and selecting needed find cmake scripts and place them in it.

*   The CMakeLists.txt will scan the folder cmake.
*   Find*.cmake cmake scripts are include for finding external dependency. They are include before creating the library or executable target. They will request package and do library linkage and seting include path. e.g. If FindVTK.cmake is placed, the include header and library linkage of vtk will be automatically figured out.
*   Target*.cmake cmake scripts are include for adding other target instead of library and executable. They are include after library or executable targete are created. e.g. iF TargetOtherResource.cmake is placed, the library and executable targe will depend on it and build after the resources are copied to the right place.

6.  After that, the project could be configured as common cmake project.

Following is the file structure:  

* * *

_ProjectName  
|   |--*.c  
|   |--*.cpp  
|   |--*.cxx  
|   |--*.h  
|   |--*.hpp  
|   |--_cmake  
|       |--Find*.cmake  
|       |--Target*.cmake  

* * *

## Models implemented

*   FindCTK.cmake
*   FindVTK.cmake
*   FindITK.cmake
*   FindQtCoreQtWidget.cmake
*   FindQtXml.cmake
*   FindQtOpenGL.cmake