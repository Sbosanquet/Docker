# .NET framework 4.7.1 with VS2017 (x64) Remote Debugging

## **Building the image**

To build the image execute the following command:

    docker build --rm -t dotnet-framework-debug:4.7.1 .

## **Running the image**

To run the image execute the following command:

    docker run --interactive --rm -t dotnet-framework-debug:4.7.1

## **Committing the image**

To commit the image execute the following command:

    1. docker run --interactive -t dotnet-framework-debug:4.7.1
    2. docker ps
    3. docker stop 4890439dc854
    4. docker commit -m ".NET 4.7.1 Framework with VS2017 x64 Remote Debugging" -a "Simon Bosanquet" 4890439dc854 sbosanquet/dotnet-framework-debug:4.7.1 

Note: In this example, the container ID found by "docker ps" is 4890439dc854.  The container also has to be run without the --rm parameter otherwise it is removed and cannot then be committed or pushed.

## **Pushing the image**

To push the image to dockerhib execute the following command:

    docker push sbosanquet/dotnet-framework-debug:4.7.1