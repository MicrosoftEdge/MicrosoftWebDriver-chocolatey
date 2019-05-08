$osVersion = [System.Environment]::OSVersion.Version
$major = $osVersion.Major

if ($major -ne 10) {
    throw 'Unsupported Windows version.'
}

# Binaries are x86, we need to install them in the right path depending on the OS architecture
if ([Environment]::Is64BitProcess) {
    $childpath = 'SysWOW64'
    $url = 'https://az813057.vo.msecnd.net/webdriver/msedgedriver_x64/msedgedriver.exe'
} else {
    $childpath = 'system32'
    $url = 'https://az813057.vo.msecnd.net/webdriver/msedgedriver_x86/msedgedriver.exe'
}

$destination = Join-Path -path (get-item env:\windir).value -ChildPath $childpath

Get-ChocolateyWebFile -PackageName 'MSEdgeDriver' -FileFullPath "$destination\msedgedriver.exe" -Url $url
