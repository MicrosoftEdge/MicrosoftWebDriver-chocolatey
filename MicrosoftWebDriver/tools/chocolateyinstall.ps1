$osVersion = [System.Environment]::OSVersion.Version
$major = $osVersion.Major
$build = $osVersion.Build

if ($major -ne 10) {
    throw 'Unsupported Windows version.'
}

if ($build -gt 17600) {
    # Starting on RS5, webdriver is a Windows capability
    Write-Host 'Installing WebDriver capability.'
    DISM.exe /Online /Add-Capability /CapabilityName:Microsoft.WebDriver~~~~0.0.1.0

    exit
}

if ($build -eq 17682) {
    $checksum = '8210b744879b865f9c0e0d09f6a09689a156cf67c3dfaccf8d56cf2bdc8b97181d544e5a83d8eafa67113f3aa68ca7870df98f9fa0f16ee628b40b411ddef985'
    $url = 'https://download.microsoft.com/download/F/8/A/F8AF50AB-3C3A-4BC4-8773-DC27B32988DD/MicrosoftWebDriver.exe'
} elseif ($build -eq 16299) {
    $checksum = '11eff15b47d417f3831ee1ef78f5d0907f1a29fc5d3fc4dd6fde28bc94369fdf98434e03489398d02fa616c4246e171ba1667f5b164a86df695fea854a852857'
    $url = 'https://download.microsoft.com/download/D/4/1/D417998A-58EE-4EFE-A7CC-39EF9E020768/MicrosoftWebDriver.exe'
} elseif ($build -eq 15063) {
    $checksum = '6bed0966d722fa8b15f14e3b2131de3bc3c07f681b9817d7765eb2fd50e8e22fc024d063aba5e701671f735a121cba833c2b5843f037c65dca1d009bff2462a2'
    $url = 'https://download.microsoft.com/download/3/4/2/342316D7-EBE0-4F10-ABA2-AE8E0CDF36DD/MicrosoftWebDriver.exe'
} elseif ($build -eq 14393) {
    $checksum = 'af81564e0c1d4fc4494a7164fd9cdcd1da925a5b4b26495517b5eef03f5f6708ff4d2decbe6fab2040ebabe5c5d084ca46dbfc4ae1731cc855f19332e6d7c2b8'
    $url = 'https://download.microsoft.com/download/3/2/D/32D3E464-F2EF-490F-841B-05D53C848D15/MicrosoftWebDriver.exe'
} elseif ($build -eq 10586) {
    $checksum = 'a02b9daed04ca254a103071069f4380acdecab50632b7f59e9af5a6372a94a952605dd489e991d20caffce3089ad9c5591edd48a364c69ac11f0d026ad31b72f'
    $url = 'https://download.microsoft.com/download/C/0/7/C07EBF21-5305-4EC8-83B1-A6FCC8F93F45/MicrosoftWebDriver.exe'
} elseif ($build -eq 10240) {
    $checksum = 'f0ad26abef51a571c663a14cc08d0421c3f50b783913c092de883cbe65880a45e061a9f3d200f6c0b301190042414a087e8b917900d7aa8c4e0a824afba46f7c'
    $url = 'https://download.microsoft.com/download/8/D/0/8D0D08CF-790D-4586-B726-C6469A9ED49C/MicrosoftWebDriver.exe'
} else {
  throw "Your Windows 10 build ($build) is not supported by this installer."
}

# Binaries are x86, we need to install them in the right path depending on the OS architecture
if ([Environment]::Is64BitProcess) {
    $childpath = 'SysWOW64'
} else {
    $childpath = 'system32'
}

$destination = Join-Path -path (get-item env:\windir).value -ChildPath $childpath

Get-ChocolateyWebFile -PackageName 'MicrosoftWebDriver' -FileFullPath "$destination\MicrosoftWebDriver.exe" -Url $url -checksum $checksum -checksumType 'sha512'
