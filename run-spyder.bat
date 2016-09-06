@ECHO OFF
SETLOCAL
SETLOCAL EnableExtensions
SETLOCAL EnableDelayedExpansion

:: ========================================================================
:: ==========                GLOBAL VARIABLE DECLARATIONS             =====
:: ========================================================================


::SET anaconda_folderpath="\Anaconda"
CALL launcherconfig.bat

:: !!!!!!!!!!!!!! Don't change anything below this line !!!!!!!!!!!!!!!!!!!


:: ============  Get the location of this batch script
:: '%~d0' says to give me the drive of the 0'th script argument (i.e. this file)
:: '%~dp0' says to give me the drive and folder path 
:: '%~f0' says to give me the full path
:: '%~s0' says to give me the short path

SET this_script_drive=%~d0
SET this_script_directory=%~dp0
SET this_script_full_path=%~f0
SET this_script_short_path=%~s0



:: Strip off the quotes from path you provided and set the drive 
:: letter to the correct name for the USB drive on the computer 
:: you're using when you run the script 

CALL :stripQuotes %anaconda_folderpath%
SET anaconda_folderpath=%_stripQuotesResult%
SET anaconda_full_folder=%this_script_drive%%anaconda_folderpath%


:: Activate the conda enviroment

ECHO Changing to anaconda folder: !anaconda_full_folder!...
CD !anaconda_full_folder!

ECHO Adding anaconda directory to path...
SET PATH=%PATH%;!CD!\Scripts

ECHO Activating anaconda
CALL activate.bat
:: Call .\Scripts\activate.bat

ECHO Launching Spyder
START spyder

:: Exit the script
GOTO :EOF



:: ======================================================================
:: =============             PSEUDO-Functions           =================
:: ======================================================================


:: ======================================================================
:: FUNCTION NAME: stripQuotes
:: Pseudo-Function that strips the quotes off of it's supplied argument
:: [Ex usage]
:: 	SET somearg="foo"
:: 	CALL :stripQuotes %somearg%
:: 	SET somearg=%_stripQuotesResult%

:stripQuotes
SET _stripQuotesResult=%~1
EXIT /B 0


:: ======================================================================
:: FUNCTION NAME: DEBUG
:: Dump a bunch of variables that are defined in my script
:: So I can use 'CALL :Debug' at any point in my script to
:: See whats going on

:DEBUG

ECHO ===================================================
ECHO anaconda_folderpath   = %anaconda_folderpath%
ECHO anaconda_full_folder  = %anaconda_full_folder% 
ECHO ===================================================
ECHO this_script_drive     = %this_script_drive%
ECHO this_script_directory = %this_script_directory%
ECHO this_script_full_path = %this_script_full_path%
ECHO this_script_short_path= %this_script_short_path%
ECHO ===================================================

ECHO ON
set
pause

EXIT /B 0

