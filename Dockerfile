FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
USER $APP_UID
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copy project file and restore dependencies
COPY ["AlecSiteBackend.csproj", "./"]
RUN dotnet restore "AlecSiteBackend.csproj"

# Copy the rest of the source code and build
COPY . .
RUN dotnet build "AlecSiteBackend.csproj" -o /app/build

# Final runtime image using build output
FROM base AS final
WORKDIR /app
COPY --from=build /app/build .

ENTRYPOINT ["dotnet", "AlecSiteBackend.dll"]