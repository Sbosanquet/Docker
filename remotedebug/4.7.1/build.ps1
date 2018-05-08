#
# Script used to build and optionally publish to Dockerhub
#
# 2018/05/08 : V1.0 - Initial Release
#
Write-Host "Building Docker Image - sbosanquet/dotnet-framework-debug:4.7.1"

Write-Host "Publish to Dockerhub after build? [Y]/[N]" -ForeGroundColor Yellow
$publishRequired = Read-Host 

try {
    & docker-compose build

    if ($? -eq $false) {
        throw [System.Exception] "docker-compose build failed"
    }

    Write-host "Build Complete" -ForegroundColor Green

    if ($publishRequired.ToUpper().CompareTo("Y") -eq 0) {
        .\publish.ps1
    }
    else {
        Write-Host "Publish Skipped!!"
    }
}
catch {
    $ErrorMessage = $_.Exception.Message
    Write-Host "Exception occured during build process: $ErrorMessage" -ForeGroundColor Red
}