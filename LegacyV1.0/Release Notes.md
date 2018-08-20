<!DOCTYPE html>
<html>
<head>
<title>Release Notes</title>
</head>
<body>

<h1 style="text-align:center">Something Release Notes</h1>
<h2>Version</h2>
<p>
  SOMETHING V0.1.0 ALPHA<br/>
  Release Date: 20180310<br/>
  <b>FOR INTERNAL USAGE ONLY</b>
</p>
<br/>
<h2>Overviewe</h2>
<h4><small>&nbsp;&nbsp;&nbsp;&nbsp;--An overview and description of the product.</small></h4>
<hr>
<p>
  Automatc medical image guidance surgical robotic system for dental implant.
</p>
<br/>
<h2>Purpose</h2>
<h4><small>&nbsp;&nbsp;&nbsp;&nbsp;--The purpose of the release note, bug fixes and new features.</small></h4>
<hr>
<p>
  <ul>
    <li><b>New features</b><br/>
      <ol>
          <li>Using the newest UI pipeline. Planning pipeline, AddImplantWidget, Implant library, etc.</li>
          <li>Using public inheritance in *.ui files. </li>
          <li>Moving <code>SCBWelcomeWizard</code> from <code>SCBDentalHub</code> to <code>SCBDentalMainWindow</code>. Changing logo of WelcomeWizard.  </li>
          <li>Removing redundency UI. Removing a lot of redundency, such as admin mode, menu bar, dock viewers, etc</li>
          <li>Removing DentalDocumentViewer &amp; using general document viewer.</li>
          <li>Big updating in project structure. The whole 'Sucabot Project' was split to 3 sub modules for different scenarios: dental, orthopedic, neural.They shared the same librarys but for different UI representations. </li>
          <li>Updating TS files. </li>
          <li>Updating style sheets. </li>
          <li>Using AbstractRobot instead of old URApi and AuboApi. </li>
          <li><code>AddNewImplant()</code> function in planning pipeline has been implemented. </li>
          <li>Registration pipeline can do tool , tracker-image and tracker robot registrations. </li>
          <li><code>MoveToImplant()</code> in Navigation pipeline has been implemented.</li>
      </ol>
    </li>
    <li><b>Bug fixed</b>
      <ol>
        <li>Some potential bugs or known bugs needed to be fixed.       
      </ol>
    </li>
  </ul>
  <ol>

  </ol>
</p>
<br/>
<h2>Issue Summary</h2>
<h4><small>&nbsp;&nbsp;&nbsp;&nbsp;--A description of the bug or the enhancement in the release</small></h4>
<hr>
<p>
  <ol>
    <li>TS files current are not completed. Not everything is well translated. </li>
    <li>Style sheets current are not completed. </li>
    <li>The UR's part in AbstractRobot are now working in multi-thread. But it leads to a few potential bugs. e.g. It will throw exception: <code>std::bad_alloc</code> in <code>get_real_time_data()</code> &amp; <code>get_secondary_data()</code></li>
    <li>
      Actually many UI and function have not been settled down or implemented yet. So The following table only mentions what has been done. 
      <table>
        <caption>Pipelines</caption>
        <tr>
          <th>Description</th>
          <th>Planning</th>
          <th>Registration</th>
          <th>Navigation</th>
          <th>Validation</th>
        </tr>
        <tr>
          <th>UI design</th>
          <td>In progress</td>
          <td>In progress</td>
          <td>In progress</td>
          <td>In progress</td>
        </tr>
        <tr>
          <th>Style sheets</th>
          <td>No</td>
          <td>No</td>
          <td>No</td>
          <td>No</td>
        </tr>
        <tr>
          <th>Translation</th>
          <td>No</td>
          <td>No</td>
          <td>No</td>
          <td>No</td>
        </tr>
        <tr>
          <th>Function implementation</th>
          <td><code>AddNewImplant()</code> &amp; <code>AddNewTooth()</code></td>
          <td>Tool registration, tracker-image registration &amp; tracker-robot registration. Able to enable tracking. </td>
          <td><code>MoveToImplant()</code></td>
          <td>Manual registration.</td>
        </tr>
      </table>
    </li>
  </ol>
</p>
<br/>
<h2>Resolution</h2>
<h4><small>&nbsp;&nbsp;&nbsp;&nbsp;--A description of the modification/enhancement that was made to fix the bug.</small></h4>
<hr>
<p>
  <ol>
    <li>For keeping developing concern, developer made up some ugly UI for developer usage only. </li>
    <li>Befor finalizing UI, TS is on hold. </li>
    <li>Using <code>try{}catch(...){} </code> to catch the exception instead of letting program crashing. But that's an temporary fixation. </li>
    <li>Continuing developing and updaing pipeline widget. </li>
  </ol>
</p>
<br/>
<h2>Steps to Reproduce</h2>
<h4><small>&nbsp;&nbsp;&nbsp;&nbsp;--A short description of the modification/enhancement that was made to fix the bug.</small></h4>
<hr>
<p>
  <ol>
    <li>N/A</li>
    <li>N/A</li>
    <li>Since the <code>URDashThread</code> in <code>AbstractRobot</code>will throw exception, let the program run in Debug mode, the <code>std::bad_alloc</code> exception will be catched by the IDE. 
    <li>N/A</li>
  </ol>
</p>
<br/>
<h2>End-User Impact</h2>
<h4><small>&nbsp;&nbsp;&nbsp;&nbsp;--What different actions are needed by the end-users of the application. This should include whether other functionality is impacted by these changes.</small></h4>
<hr>
<p>
  <ol>
    <li>No complete EN or CHS support.</li>
    <li>Urgly UI and not user-friendly.</li>
    <li>Program crashes often not sometime. Basically program cannot run last for 10 minutes. </li>
    <li>Fake buttons, fake widget, many GUI do not have any functions inside, just for visbile. Only a few key functions and UI have been implemented. Please refer to issues to find out what have been implemented. Except for those, others are useless. </li>
  </ol>
</p>
<br/>
<h2>Support Impact</h2>
<h4><small>&nbsp;&nbsp;&nbsp;&nbsp;--Changes required in the daily process of administering the software.</small></h4>
<hr>
<p>N/A</p>
<br>
<h2>Notes</h2>
<h4><small>&nbsp;&nbsp;&nbsp;&nbsp;--Notes about software or hardware installation, upgrades and product documentation (including documentation updates)</small></h4>
<hr>
<p>
 <dl>
   <dt>Binray file</dt>
   <dd>--Decompress the *.zip file, and double click 'Dental_main.exe' file inside. If the software askes for license, require a license from software department with the key generated from the software. 
   </dd>
   <dt>Source</dt>
   <dd>--Follow the description of <a href="https://www.google.com">Something Readme.md</a> &amp; <a href="https://www.baidu.com">Something Readme.md</a></dd>
 </dl>
</p>
<br/>
<h2>Disclaimers</h2>
<h4><small>&nbsp;&nbsp;&nbsp;&nbsp;--Company and standard product related messages. e.g.; freeware, anti-piracy, duplication etc</small></h4>
<hr>
<p>
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *<br/>
 *This program is distributed in the hope that it will be useful, but*<br/>
 *WITHOUT ANY WARRANTY; without even the implied warranty of*<br/> 
 *MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.*<br/> 
 *See the LICENSE for more detail.*<br/> 
 *Copyright (c) Wuzhuobin&copy;. All rights reserved.*<br/> 
 *See COPYRIGHT for more detail.*<br/> 
 *This software is distributed WITHOUT ANY WARRANTY; without even*<br/> 
 *the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR*<br/> 
 *PURPOSE.  See the above copyright notice for more information.*<br/>
 *Internal usage only, without the permission of the author, please DO*<br/>
 *NOT publish and distribute without the author's permission.*<br/>
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *<br/>
</p>
<br/>
<h2>Contact</h2>
<h4><small>&nbsp;&nbsp;&nbsp;&nbsp;--Support contact information.</small></h4>
<hr>
<p>
 <ul>
   <li>Wuzhuobin</li>
 </ul>
</p>
</body>
</html>