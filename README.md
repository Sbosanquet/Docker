# Docker Files

This repository contains a number of docker build scripts used to create various development images.

## **Remote Debug**

This section contains a number of remote debugging images used for .NET Framework.

1. ### 4.7.1

    *Contains a .NET framework 4.7.1 image built on Windows Server core.  Running inside the image is VS2017 x64 Remote Debugging with a powershell console*

## **General Commands**

Here are some reminders for general docker commands:

1. **Remove "None" images:**

    docker rmi $(docker images -f “dangling=true” -q)