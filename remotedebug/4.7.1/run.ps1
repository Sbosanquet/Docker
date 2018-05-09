#
# Script to run the image
#
# 2018/05/09 : V1.0 - Initial Release
#

$imagename = "sbosanquet/dotnet-framework-debug:4.7.1"
$remainText = ""

clear-host

Write-Host "Docker container to remain after exit? [Y]/[N]" -ForegroundColor Yello
$remain = Read-Host 

Write-Host "Running docker image $imagename.  Please wait..."

try
 {
    if ($remain.ToUpper().CompareTo("N") -eq 0) {
        $remainText = "--rm"
    }

    & docker run --interactive $remainText -p 4022:4022/tcp -p 4023:4023/tcp -t $imagename

    if ($? -eq $false) {
        throw [System.Exception] "docker push failed"
    }

    Write-Host "Docker Image Exited!" -ForegroundColor Green
}
catch {
    $ErrorMessage = $_.Exception.Message
    Write-Host "Exception occured whilst running image: $ErrorMessage" -ForegroundColor Red
}