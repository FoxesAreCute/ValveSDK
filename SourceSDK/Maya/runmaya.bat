@ECHO OFF
REM
REM Valve Source SDK - runmaya.bat
REM
REM This is an example .bat file that can be used to launch Maya with
REM appropriate paths set.  Call with the version of Maya to run.
REM
REM e.g. runmaya.bat 2012
REM
REM It relies on the environment variable SOURCESDK pointing to the root
REM directory of the Valve SourceSDK installation
REM
REM NOTE: It also assumes Maya is installed in the default location
REM       Adjust as required
REM
REM %SOURCESDK%\maya\scripts should be in your MAYA_SCRIPT_PATH
REM %SOURCESDK%\maya\icons should be in your XBMLANGPATH
REM %SOURCESDK%\maya\<MAYAVER>\plug-ins should be in your MAYA_PLUG_IN_PATH
REM
REM Where <MAYAVER> is the appropriate version of Maya you are running
REM

IF DEFINED SOURCESDK GOTO SOURCESDK_OK

REM
REM If SOURCESDK isn't defined, then guess where it is based on the location of this
REM BAT file, the SOURCESDK should be one level up
REM

SET SOURCESDK=%~dp0\..

:SOURCESDK_OK

SET MAYAVER=%1

REM
REM vsMaster.mll looks for other Valve DLLs relative to the directory specified by %VPROJECT%.
REM Specifically, it looks in %VPROJECT%\..\bin for other Valve DLLs.  Valve uses an internal
REM runtime linker and normally it looks relative to the path of the EXE running to find Valve DLLs.
REM In the case of Maya, maya.exe is running from an arbitrary unrelated location so
REM %VPROJECT% is used to locate the DLLs in the manner specified.
REM

SET VPROJECT=%SOURCESDK%\bin\orangebox\bin

IF NOT EXIST "%VPROJECT%" GOTO ERROR_NO_VPROJECT

REM
REM Valve's filesystem needs to find the gameinfo.txt to setup search paths
REM in SourceSDK's case, the binaries aren't siblings of the directory where
REM gameinfo.txt is, so we need to hint Maya for similar reasons to above
REM

SET MAYA_GAMEINFO_DIR=%SOURCESDK%\..\team fortress 2\tf

IF NOT EXIST "%MAYA_GAMEINFO_DIR%" GOTO ERROR_NO_MAYA_GAMEINFO_DIR

REM
REM Workaround for maya installed in (x86) directory.
REM

IF EXIST "%ProgramFiles(x86)%" GOTO x86
SET PATH=%ProgramFiles%\Autodesk\Maya%MAYAVER%\bin;%VPROJECT%\..\bin;%PATH%
GOTO END

:x86
SET PATH=%ProgramFiles(x86)%\Autodesk\Maya%MAYAVER%\bin;%VPROJECT%\..\bin;%PATH%

:END

set MAYA_SCRIPT_PATH=%SOURCESDK%\maya\scripts;%MAYA_SCRIPT_PATH%
set XBMLANGPATH=%SOURCESDK%\maya\icons;%XBMLANGPATH%
set MAYA_PLUG_IN_PATH=%SOURCESDK%\maya\%MAYAVER%\plug-ins;%MAYA_PLUG_IN_PATH%

maya

goto END

:ERROR_NO_VPROJECT
echo ERROR! VPROJECT directory "%VPROJECT%" doesn't exist
goto END

:ERROR_NO_MAYA_GAMEINFO_DIR
echo ERROR! MAYA_GAMEINFO_DIR directory "%MAYA_GAMEINFO_DIR%" doesn't exist
goto END

:END
