@ECHO OFF
SETLOCAL EnableExtensions
SETLOCAL EnableDelayedExpansion
CD %~dp0
goto main

:getScriptInfo
	REM -- Get the USB drive's letter --
	SET py_launcher_drive=%~d0
	SET py_launcher_folder=%~dp0
EXIT /B 0

:retrieveCachedVars
	REM Find previously cached Environment settings
	REM and read them into the script's local
	IF NOT EXIST "%py_launcher_folder%\vars\vars.bat". (
		ECHO "vars\vars.bat: Missing!"
	) ELSE (
		ECHO "vars\vars.bat: OK!"
	)
	ECHO "Retrieving cached vars"
	CALL %py_launcher_folder%\vars\vars.bat
EXIT /B 0

:main  -MainFunction
SETLOCAL
	REM variable declarations
	CALL :retrieveCachedVars
	
	REM verifying variables
	IF NOT DEFINED !pylaunch_anaconda_folder! (
		ECHO Anaconda Folder:!pylaunch_anaconda_folder!
	) ELSE (
		REM Find Anaconda
		CALL :findAnaconda
		
		REM Cache the value of the anaconda folder
		ECHO [x] TODO: cashe anaconda folder
	IF DEFINED !firstencounteredpy! (
		ECHO MyVar IS defined
		IF NOT DEFINED !pylaunch_anaconda_folder! (
			ECHO Anaconda Folder:!pylaunch_anaconda_folder!
		) ELSE (
			CALL :findA
		)
	) ELSE (
		ECHO MyVar is NOT defined
	)
	
ENDLOCAL
GOTO :eof



REM =============================================
REM Function Definitions
REM =============================================





