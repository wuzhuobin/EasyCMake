<!DOCTYPE HTML>
<html>
<head><title>vtk itk cmake</title></head>
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
        <li>If need other package, add packages in 'DEPENDENCY' module.</li>
        <li>If need resource, add resources in 'DEPENDENCY' module.</li>
        <li>If need other libraries and headers, add them in <code>SYSTEM_LIBRARIES</code> and <code>SYSTEM_INCLUDE</code> in 'LIBRARIES' module. </li>
    </ul>
    <h1>What happen</h1>
    <ul>
        <li>CMake will find all '*.c*' '*.h*' files for building. </li>
        <li>This template can only build static library. </li>
        <li>If 'main/main.cpp' exists, the project will create both static library files and executable files. </li>
        <li>This CMakeLists is for project with OpenCV dependency only.</li>
    </ul>
</body>  
</html>
