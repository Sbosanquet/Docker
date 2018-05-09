#
# Script to publish image to Dockerhub
#
# 2018/05/08 : V1.0 - Initial Release
#

Write-Host "Publish to Dockerhub"

try
{
    & docker push sbosanquet/dotnet-framework-debug:4.7.1

    if ($? -eq $false) {
        throw [System.Exception] "docker push failed"
    }

    Write-Host "Publish Complete"  -ForegroundColor Green
}
catch {
    $ErrorMessage = $_.Exception.Message
    Write-Host "Exception occured whilst publishing: $ErrorMessage" -ForegroundColor Red
}