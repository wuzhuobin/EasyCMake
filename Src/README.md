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
7.  This CMake script is also possible to build a hierarchy project.
    *   Placing other cmake project under this folder.
    *   Creating TargetSubDirectory.cmake and place it in cmake folder. Adding line: `add_subdirectory(SubFolderName)` in it. Then, the subproject could be added to the current cmake project.
    *   This way could be applied to its subproject as well.

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

<dl>

<dt>·FindCTK.cmake</dt>

<dd>Using CTK in the project.</dd>

<dt>·FindVTK.cmake</dt>

<dd>Using VTK in the project.</dd>

<dt>·FindITK.cmake</dt>

<dd>Using ITK in the project.</dd>

<dt>·FindQtCoreQtWidget.cmake</dt>

<dd>Using QtCore QtWidgets in the project. And it will also enable Meta Object Compiler(MOC), User Interface Compiler(UIC), Qt Resource Compiler(QRC) function. Header files, source files, ui files, qrc files will be processed accordingly.</dd>

<dt>·FindQtXml.cmake</dt>

<dd>Using QtXml in the project. But FindQtCoreQtWidget.cmake should be used as well.</dd>

<dt>·FindQtOpenGL.cmake</dt>

<dd>Using QtOpenGL in the project. But FindQtCoreQtWidget.cmake should be used as well.</dd>

</dl>