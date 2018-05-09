#
# This custom image takes a windows server core image with .NET framework 4.7.1, installs the VS2017 x64 
# remote debugging tools and then runs the remote debugger.  A powershell command prompt is left open
# incase it is needed for further debugging.
#
#
# NOTE: This should not be used on a production system due to the debugger security!!
#

# Define Arguments.  These are overridden in the docker-compose.yml
ARG DEBUG_PORT_1
ARG DEBUG_PORT_2

# Get Base image
FROM microsoft/dotnet-framework:4.7.1-windowsservercore-1709

# Set image label information
LABEL author="Simon Bosanquet" \
      version="1.0" \
      description="This is a .NET 4.7.1 image built on top of windows server core and has VS2017 x64 msvsmon.exe built in."

 # Use powershell rather than cmd.exe as the shell
SHELL [ "powershell", "-NoProfile" ]

# Set the working directory for the download
WORKDIR /temp

# Download the Remote Debugger tools from the microsoft website
#
# Note: use this link for the x86 download: https://aka.ms/vs/15/release/RemoteTools.x86ret.enu.exe
RUN Invoke-WebRequest -OutFile setup_x64.exe -Uri https://aka.ms/vs/15/release/RemoteTools.amd64ret.enu.exe;

# Install the downloaded setup
RUN & .\setup_x64.exe /install /quiet

# Clean up
RUN Remove-Item .\setup_x64.exe

# Update powershell help to provide offline help.  
# Clear the error afterwards as there is usually one or more missing help files and
# it will break the image build.
RUN Update-Help -Force -ErrorAction SilentlyContinue; $error.clear();

# Set the working directory back to the root
WORKDIR /

# Open network ports for Visual Studio (See: https://docs.microsoft.com/en-us/visualstudio/debugger/remote-debugger-port-assignments)
#  - private only
EXPOSE $DEBUG_PORT_1 $DEBUG_PORT_2

# run the visual studio remote debugger and then set the command prompt back to the root
#
# Note: the debugger security is open
CMD """"& {Push-Location '/Program Files/Microsoft Visual Studio 15.0/Common7/IDE/Remote Debugger/x64';\
            & '.\msvsmon.exe' /nostatus /silent /nosecuritywarn /nofirewallwarn /noclrwarn /timeout:2147483646 /noauth /anyuser;\
            Pop-Location;\
            }"""" 
ENTRYPOINT [ "powershell.exe", "-NoProfile", "-NoLogo", "-NoExit", "-Command" ]
