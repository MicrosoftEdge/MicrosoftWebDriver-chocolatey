$osVersion = [System.Environment]::OSVersion.Version
$major = $osVersion.Major
$build = $osVersion.Build

if ($major -ne 10) {
  throw 'Unsupported Windows version.'
}

# Binaries are x86, we need to uninstall them from the right path depending on the OS architecture
if ([Environment]::Is64BitProcess) {
  $childpath = 'SysWOW64'
} else {
  $childpath = 'system32'
}

$destination = Join-Path -path (get-item env:\windir).value -ChildPath $childpath

Remove-Item -path $destination\MSEdgeDriver.exe
