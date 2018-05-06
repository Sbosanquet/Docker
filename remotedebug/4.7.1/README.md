# .NET framework 4.7.1 with VS2017 (x64) Remote Debugging

## **Building the image**

To build the image execute the following command:

    docker build --rm -t sbosanquet/dotnet-framework-debug:4.7.1 .

## **Running the image**

To run the image execute the following command:

    docker run --interactive --rm -t sbosanquet/dotnet-framework-debug:4.7.1