:: Taskbar Script by vrishank6

:: Changeable Variables (Edit the part after the =) 

:: Note: %cd% means the folder that this file is in

:: Enable / Disable the Classic Shell Start Menu (Opens Settings Every Launch)
set useClassicShellStartMenu=false
:: true / false

:: Enable / Disable Switcheroo
set useSwitcheroo=true
:: true / false

:: Enable / Disable Shortcuts

::Note: You need to copy the example shortcut in the shortcuts folder and modify the Path, Target and Icon for the app bar to work
set useShortcuts=true
:: true / false
set shortcutsPath="%cd%\Shortcuts"

:: Set The Path To The Wallpaper to use
set wallpaperPath="%cd%\Default Wallpapers\win10classic.jpg"
:: Warning: At the moment, jpg is only supported
:: To see how to use other file formats such as .png, see my video


:: End of Variables, Start of Script

:: It is Reccomended you don't modify the following code



if "%useShortcuts%"=="true" (
    del "C:\Users\kiosk\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\*.lnk"
    xcopy /s %shortcutsPath% "C:\Users\kiosk\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch"
)

if "%useSwitcheroo%"=="true" (
    start "" "%cd%\bin\switcheroo\switcheroo.exe"
)

copy %wallpaperPath% "%cd%\bin\shell\wallpaper.jpg"
start "" "%cd%\bin\shell\explorer.exe"
taskkill /f /im gfndesktop.exe

if "%useClassicShellStartMenu%"=="true" (
    start "" "%cd%\bin\startmenu\ClassicStartMenu.exe"
    start "" "%cd%\bin\startmenu\ClassicStartMenu.exe" -settings
)

exit

