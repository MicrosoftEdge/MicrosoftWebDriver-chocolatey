# Microsoft Edge Web Driver

This project contains the files that are part of the Microsoft Edge Web Driver
cholatey package.

While the Microsoft Edge Web Driver downloads are available in https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/,
it's very common to end up using a wrong version. Even more, starting with
the Windows 10 18H2 update Web Driver will be an optional capability of the OS.
The cholatey package automatically installs the right version for Web Driver based
on the Windows 10 build number.
Only stable versions of Windows 10 are supported prior build 17134.

## Test the package locally

To test this package locally you will need to:

1. Install [Chocolatey](https://chocolatey.org/install)
1. Open an elevated PowerShell window
1. From the root of the project, execute `choco pack`
1. Then run `choco install packageName -dv -s .`

For more information you can check the [Chocolatey documentation](https://chocolatey.org/docs/create-packages)

# Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.microsoft.com.

When you submit a pull request, a CLA-bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., label, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
