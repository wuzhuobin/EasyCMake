<!DOCTYPE html>
<html>
<head>
    <title>Windows lib and dll TemplateCMakeLists</title>
</head>
<body>
    <h1>How to use</h1>
    <ul>
        <li>Create a folder to place all header files, implementation files and the 'TemplateCMakeLists.txt'.</li>
        <li>Rename the folder as the project name. Since the folder name will become the project name.</li>
        <li>Rename 'TemplateCMakeLists.txt' to 'CMakeLists.txt'.</li>
        <li>Configure with CMake and follow normal cmake pipeline.</li>
        <li>If build executable, create 'main/main.cpp' as the program entry point.</li>
        <li>If build library, no need to do the previous procedure.</li>
        <li>DO NOT modify things not in 'CHANGE BELOW'. </li>
        <li>If need other Qt module, add modules in 'DEPENDENCY' module.</li>
        <li>If need other package, add packages in 'DEPENDENCY' module.</li>
        <li>If need Qt qrc, add the path in <code>PROJECT_QRC</code> in 'DEPENDENCY' module. </li>
        <li>If need resource, add resources in 'DEPENDENCY' module.</li>
        <li>If need windows dll, add the folder path which contains all dlls in <code>SYSTEM_DLL</code> in 'DEPENDENCY' moduel. </li>
        <li>If need other libraries and headers, add them in <code>SYSTEM_LIBRARIES</code> and <code>SYSTEM_INCLUDE</code> in 'LIBRARIES' module. </li>
    </ul>
    <h1>What happen</h1>
    <ul>
        <li>CMake will find all '*.c*' '*.h*' files for building. </li>
        <li>CMake will find all '*.ui' as Qt UI form. </li>
        <li>This template can only build static library. </li>
        <li>If 'main/main.cpp' exists, the project will create both static library files and executable files. </li>
        <li>Windows dlls will be copyed to '<code>CMAKE_BUILD_PATH</code>/bin', windows libs will be copyed to '<code>CMAKE_BUILD_PATH</code>/lib'. </li>
    </ul>
</body>
</html>