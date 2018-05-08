# .NET framework 4.7.1 with VS2017 (x64) Remote Debugging

## **Building the image**

The preferred way of building the image is using the docker compose file. Execute the following command:

    docker-compose build

A manual build can be performed using:

    docker build --rm -t sbosanquet/dotnet-framework-debug:4.7.1 .

## **Running the image**

To run the image execute the following command:

    docker run --interactive --rm -p 4022:4022/tcp -p 4023:4023/tcp -t sbosanquet/dotnet-framework-debug:4.7.1

## **Pushing the image**

To push the image to dockerhub execute the following command:

    docker push sbosanquet/dotnet-framework-debug:4.7.1

## **Other Commands**

### **1. Committing the image**

To commit the image execute the following command:

    1. docker run --interactive -t sbosanquet/dotnet-framework-debug:4.7.1
    2. docker ps
    3. docker stop 4890439dc854
    4. docker commit -m ".NET 4.7.1 Framework with VS2017 x64 Remote Debugging" -a "Simon Bosanquet" 4890439dc854 sbosanquet/dotnet-framework-debug:4.7.1

Note: In this example, the container ID found by "docker ps" is 4890439dc854.  The container also has to be run without the --rm parameter otherwise it is removed and cannot then be committed or pushed.