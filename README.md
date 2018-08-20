<html>
<body>
  <h1>EasyCMake</h1>
  <p>-- A template for creatint cmake project rapidly.</p>
  <p>
    <h2 style="text-align: center">Manual</h2>
    <ol>
    <li>Creating a well named folder.
      <ul>
        <li>Folder name will be used as project name. </li>
        <li>The folder name must be unique, since it will be used as library name or executable name.
          Creating ${PROJECT_NAME}.lib, ${PROJECT_NAME}.so, ${PROJECT_NAME}.a, ${PROJECT_NAME}.exe, etc.
        </li>
      </ul>
    </li>
    <li>Placing codes in the folder, header files and source files.</li>
        <ul>
          <li>The folder will be scan when doing cmake configure.</li>
          <li>*.c* and *.h* will be treated properly as c++ source files and header files and creating library target.</li>
          <li>If main/main.cpp or main/main.cxx exists, they will be treated as the main function and program 
            entry point. An executable target will be created as well.
          </li>
        </ul>
    <li>After that, the project could be configured as common cmake project. </li>
    <hr><h3>Advance</h3><hr>
    <li>Creating a cmake folder and selecting needed find cmake scripts and place them in it.
        <ul>
          <li>This step is for finding external CMake packages, external libraries or other dependencies.
            The CMakeLists.txt will scan the folder cmake and include them.</li>
          <li>Find*.cmake cmake scripts are include for finding external dependencies before creating 
            target process. They are include before creating the library or executable target. 
            They will request packages, do libraries linkage and seting include path.
            e.g. If FindVTK.cmake is placed, the include header and library linkage of vtk will 
            be automatically figured out.
          </li>
          <li>However, the Find*.cmake script in EasyCmake cannot include all packages and libraries.
            It is suggest user to write their own Find*.cmake to fulfill the dependencies. 
          </li>
          <li>Target*.cmake cmake scripts are include for adding other target instead of library
              and executable. They are include after library or executable targete are created. 
              e.g. iF TargetOtherResource.cmake is placed, the library and executable targe will 
              depend on it and build after the resources are copied to the right place. 
          </li>
        </ul>
        <li>This CMake script is also possible to build a hierarchy project. 
          <ul>
            <li>Placing other cmake project under this folder. </li>
            <li>Creating SubDirectory.cmake and place it in cmake folder. 
              Adding line: <code>add_subdirectory(SubFolderName)</code> in it.
              Then, the subproject could be added to the current cmake project. 
            </li>
              <li>This way could be applied to its subproject as well. </li>
          </ul>
        </li>
    </ol>
    Following is the file structure: <br>
    <hr>
    _ProjectName <br>
    |&nbsp;&nbsp;&nbsp;|--*.c* (c, cc, cpp, cxx...)<br>
    |&nbsp;&nbsp;&nbsp;|--*.h* (h, hpp, hxx...)<br>
    |&nbsp;&nbsp;&nbsp;|--_main<br>
    |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|--main.c* (c, cc, cpp, cxx...)<br>
    |&nbsp;&nbsp;&nbsp;|--_cmake<br>
    |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|--Find*.cmake<br>
    |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|--Target*.cmake<br>
    |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|--SubDirectory.cmake<br>
    <hr>
    <h2 style="text-align: center">Models implemented</h2> 
    <dl>
      <dt>&middot;FindCTK.cmake</dt>
        <dd>Using CTK in the project. </dd>
      <dt>&middot;FindVTK.cmake</dt>
        <dd>Using VTK in the project. </dd>
      <dt>&middot;FindITK.cmake</dt>
        <dd>Using ITK in the project. </dd>
      <dt>&middot;FindQtCoreQtWidget.cmake</dt>
        <dd>Using QtCore QtWidgets in the project. And it will also enable 
          Meta Object Compiler(MOC), User Interface Compiler(UIC), Qt Resource Compiler(QRC)
          function. Header files, source files, ui files, qrc files will be processed accordingly.
        </dd>
      <dt>&middot;FindQtXml.cmake</dt>
        <dd>Using QtXml in the project. But FindQtCoreQtWidget.cmake should be used as well. </dd>
      <dt>&middot;FindQtOpenGL.cmake</dt>
        <dd>Using QtOpenGL in the project. But FindQtCoreQtWidget.cmake should be used as well. </dd>
    </dl>
  </p>
  <hr>
  <h2>Components</h2>
  <dl>
    <dt>LegacyV1.0</dt>
      <dd>The legacy EasyCMake
        <ul>
          <li>Using many TemplateCMakeLists.txt to provide different functions to
              fufill project requirements.</li>
          <li>While coming to the requirement that need multiple different
              functions in one project, it is inevasible to change the
              TemplateCMakelist.txt.</li>
          <li>The TemplateCMakeLists.txt is always needed to be changed a lot, need
              to read CMakeLists.txt codes. Users didn't read manual and modifying
              randomly.</li>
          <li>Modulizing the functions and lose coupling.</li>
        </ul>
      <dt>CMakeLists.txt
        <dd>EasyCMake V2.0 CMakeLists.txt. The base of the EasyCmakeV2. Basically user does not nedd 
          to modify this file. User may focus more on cmake script in cmake folder. 
        </dd>
      </dt>
      <dt>cmake
        <dd>Folder contains many cmake scripts providing different functions. User should select some of them to copy to the project's 
          cmake folder.
        </dd>
      </dt>
      </dd>
  </dl>
  </h2>
</body>
</html>