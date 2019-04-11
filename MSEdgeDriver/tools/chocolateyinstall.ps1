$osVersion = [System.Environment]::OSVersion.Version
$major = $osVersion.Major
$build = $osVersion.Build

if ($major -ne 10) {
    throw 'Unsupported Windows version.'
}

$checksum = '8210b744879b865f9c0e0d09f6a09689a156cf67c3dfaccf8d56cf2bdc8b97181d544e5a83d8eafa67113f3aa68ca7870df98f9fa0f16ee628b40b411ddef985'
$url = 'https://download.microsoft.com/download/F/8/A/F8AF50AB-3C3A-4BC4-8773-DC27B32988DD/MicrosoftWebDriver.exe'

# Binaries are x86, we need to install them in the right path depending on the OS architecture
if ([Environment]::Is64BitProcess) {
    $childpath = 'SysWOW64'
} else {
    $childpath = 'system32'
}

$destination = Join-Path -path (get-item env:\windir).value -ChildPath $childpath

Get-ChocolateyWebFile -PackageName 'MSEdgeDriver' -FileFullPath "$destination\MSEdgeDriver.exe" -Url $url -checksum $checksum -checksumType 'sha512'
