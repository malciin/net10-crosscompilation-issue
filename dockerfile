FROM mcr.microsoft.com/dotnet/sdk:10.0 AS sdk

ADD . /source
WORKDIR /source
RUN dotnet publish /source/dotnet-crosscompilation.csproj -o /server
