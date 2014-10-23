; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{C1D8DE54-2EC9-48F7-A1FA-01E7A4B8CE63}
AppName=GSE_Shell
AppVerName=GSE_Shell 1.06
AppPublisher=GSECARS
AppPublisherURL=http://cars9.uchicago.edu/gsecars/GSEmain.html
AppSupportURL=http://cars9.uchicago.edu/gsecars/GSEmain.html
AppUpdatesURL=http://cars9.uchicago.edu/gsecars/GSEmain.html
DefaultDirName=C:\GSE_Shell
DefaultGroupName=GSE_Shell
AllowNoIcons=yes
OutputBaseFilename=GSE_shell_1.06_setup
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Documents and Settings\dera\My Documents\Dropbox\software\fit2d_shell\GSE_shell\GSE_Shell 1.05 distribution\GSE_shell.sav"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Documents and Settings\dera\My Documents\Dropbox\software\fit2d_shell\GSE_shell\GSE_Shell 1.05 distribution\users.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Documents and Settings\dera\My Documents\Dropbox\software\fit2d_shell\GSE_shell\GSE_Shell 1.05 distribution\acknowledgements.jpg"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Documents and Settings\dera\My Documents\Dropbox\software\fit2d_shell\GSE_shell\GSE_Shell 1.05 distribution\cake.mac"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Documents and Settings\dera\My Documents\Dropbox\software\fit2d_shell\GSE_shell\GSE_Shell 1.05 distribution\calibrate.mac"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Documents and Settings\dera\My Documents\Dropbox\software\fit2d_shell\GSE_shell\GSE_Shell 1.05 distribution\existing_mask.mac"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Documents and Settings\dera\My Documents\Dropbox\software\fit2d_shell\GSE_shell\GSE_Shell 1.05 distribution\final_gsehead 1.5.jpg"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Documents and Settings\dera\My Documents\Dropbox\software\fit2d_shell\GSE_shell\GSE_Shell 1.05 distribution\fit2d.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Documents and Settings\dera\My Documents\Dropbox\software\fit2d_shell\GSE_shell\GSE_Shell 1.05 distribution\fit2d.mac"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Documents and Settings\dera\My Documents\Dropbox\software\fit2d_shell\GSE_shell\GSE_Shell 1.05 distribution\fit2d_shell_setup.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Documents and Settings\dera\My Documents\Dropbox\software\fit2d_shell\GSE_shell\GSE_Shell 1.05 distribution\fit2d_shell_setup_000.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Documents and Settings\dera\My Documents\Dropbox\software\fit2d_shell\GSE_shell\GSE_Shell 1.05 distribution\GSE_shell.sav"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Documents and Settings\dera\My Documents\Dropbox\software\fit2d_shell\GSE_shell\GSE_Shell 1.05 distribution\manual ver 1.01.doc"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Documents and Settings\dera\My Documents\Dropbox\software\fit2d_shell\GSE_shell\GSE_Shell 1.05 distribution\mask.mac"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Documents and Settings\dera\My Documents\Dropbox\software\fit2d_shell\GSE_shell\GSE_Shell 1.05 distribution\open_with_cal.mac"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Documents and Settings\dera\My Documents\Dropbox\software\fit2d_shell\GSE_shell\GSE_Shell 1.05 distribution\jcpds\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\GSE_Shell"; Filename: "{app}\GSE_shell.sav"
Name: "{group}\{cm:UninstallProgram,GSE_Shell}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\GSE_Shell"; Filename: "{app}\GSE_shell.sav"; Tasks: desktopicon

[Run]
Filename: "{app}\GSE_shell.sav"; Description: "{cm:LaunchProgram,GSE_Shell}"; Flags: shellexec postinstall skipifsilent
