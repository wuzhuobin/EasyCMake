# EasyCMake

-- A template for creatint cmake project rapidly.

## Manual

1.  Creating a well named folder.
    *   Folder name will be used as project name.
    *   The folder name must be unique, since it will be used as library name or executable name. Creating ${PROJECT_NAME}.lib, ${PROJECT_NAME}.so, ${PROJECT_NAME}.a, ${PROJECT_NAME}.exe, etc.
2.  Placing codes in the folder, header files and source files.

*   The folder will be scan when doing cmake configure.
*   *.c* and *.h* will be treated properly as c++ source files and header files and creating library target.
*   If main/main.cpp or main/main.cxx exists, they will be treated as the main function and program entry point. An executable target will be created as well.

4.  After that, the project could be configured as common cmake project.

* * *

### Advance

* * *

8.  Creating a cmake folder and selecting needed find cmake scripts and place them in it.
    *   This step is for finding external CMake packages, external libraries or other dependencies. The CMakeLists.txt will scan the folder cmake and include them.
    *   Find*.cmake cmake scripts are include for finding external dependencies before creating target process. They are include before creating the library or executable target. They will request packages, do libraries linkage and seting include path. e.g. If FindVTK.cmake is placed, the include header and library linkage of vtk will be automatically figured out.
    *   However, the Find*.cmake script in EasyCmake cannot include all packages and libraries. It is suggest user to write their own Find*.cmake to fulfill the dependencies.
    *   Target*.cmake cmake scripts are include for adding other target instead of library and executable. They are include after library or executable targete are created. e.g. iF TargetOtherResource.cmake is placed, the library and executable targe will depend on it and build after the resources are copied to the right place.
9.  This CMake script is also possible to build a hierarchy project.
    *   Placing other cmake project under this folder.
    *   Creating SubDirectory.cmake and place it in cmake folder. Adding line: `add_subdirectory(SubFolderName)` in it. Then, the subproject could be added to the current cmake project.
    *   This way could be applied to its subproject as well.

Following is the file structure:  

* * *

_ProjectName  
|   |--*.c* (c, cc, cpp, cxx...)  
|   |--*.h* (h, hpp, hxx...)  
|   |--_main  
|       |--main.c* (c, cc, cpp, cxx...)  
|   |--_cmake  
|       |--Find*.cmake  
|       |--Target*.cmake  
|       |--SubDirectory.cmake  

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

* * *

## Components

<dl>

<dt>LegacyV1.0</dt>

<dd>The legacy EasyCMake

*   Using many TemplateCMakeLists.txt to provide different functions to fufill project requirements.
*   While coming to the requirement that need multiple different functions in one project, it is inevasible to change the TemplateCMakelist.txt.
*   The TemplateCMakeLists.txt is always needed to be changed a lot, need to read CMakeLists.txt codes. Users didn't read manual and modifying randomly.
*   Modulizing the functions and lose coupling.

</dd>

<dt>CMakeLists.txt</dt>

<dd>EasyCMake V2.0 CMakeLists.txt. The base of the EasyCmakeV2\. Basically user does not nedd to modify this file. User may focus more on cmake script in cmake folder.</dd>

<dt>cmake</dt>

<dd>Folder contains many cmake scripts providing different functions. User should select some of them to copy to the project's cmake folder.</dd>

</dl>

* * *

## Release notes.

### V2.2 08/20/2018

1.  Moving the previous legacy EasyCMake to LegacyV1.0 folder.
2.  Removing CMake related install things. Install related script was extracted to cmake/TargetInstall.cmake and only export things when it is needed. User can copy it if needed.
3.  Removing dependency of FindQtCoreQtWidget.cmake from TargetQtTest.cmake. Now TargetQtTest.cmake can find its own QtCore instead.
4.  Using another syntax of target_link_libraries, with possible to define `PUBLIC INTERFACE PRIVATE` of Target and Dependents.
