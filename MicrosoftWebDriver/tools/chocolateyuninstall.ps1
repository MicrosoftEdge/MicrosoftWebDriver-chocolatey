$osVersion = [System.Environment]::OSVersion.Version
$major = $osVersion.Major
$build = $osVersion.Build

if ($major -ne 10) {
  throw 'Unsupported Windows version.'
}

if ($build -gt 17600) {
  # Starting on RS5, webdriver is a Windows capability
  Write-Host 'Uninstalling WebDriver capability.'
  DISM.exe /Online /Remove-Capability /CapabilityName:Microsoft.WebDriver~~~~0.0.1.0

  exit
}

# Binaries are x86, we need to uninstall them from the right path depending on the OS architecture
if ([Environment]::Is64BitProcess) {
  $childpath = 'SysWOW64'
} else {
  $childpath = 'system32'
}

$destination = Join-Path -path (get-item env:\windir).value -ChildPath $childpath

Remove-Item -path $destination
