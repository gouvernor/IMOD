# IMOD
IMOD GUI Build for Docker


For Windows 10:

1.Run Powershell as administrator

2.Install Chocolatey.
  Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

3.Install VxcvServer using Chocolatey
  choco install vcxsrv

https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde   (for reference)

4. Run XLaunch from the start menu
   Settings: Multiple Windows, Start No Client, Clipboard, Primary Selection, Disable Access Control   (turn off Native opengl or IMOD will not work)
   Save Configuration for later use in your userprofile or desktop  e.g. C:\Users\Username\Desktop

5. Enter this command in Powershell: set-variable -name DISPLAY -value host.docker.internal

6. Log into Docker within Powershell: docker login (if the desktop app is installed and logged in) otherwise log in using: docker login --username=yourhubusername --email=youremail@company.com

7. Enter this command in Powershell: docker run -it --mount source=imod_vol1,target=/root/IMODWork/ -e DISPLAY=host.docker.internal:0 imod_desk
   This command runs the container in -i interactive -t tags it --mount adds the Volume for persistent data and the -e adds the environmental variable for the X Windows server to provide the GUI aspects to the command line interface.
