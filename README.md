# launchers-for-python-on-usb
Batch scripts so that people with Anaconda installed on USB Drives can launch IDEs from file browser (explorer) on Windows

# Process

## USER

- [ ] Install Anaconda
- [ ] Download Scripts
- [ ] DoubleClick settup.bat
- [ ] Use launchers found at the root of the USB drive

## Script

* On initial run of settup.bat
    - **STEP 1: FIND PYTHON EXECUTABLE AND ANACONDA DIRECTORY**
    - Search the usb drive containing the script to find
      ANY python executable
        - Check Root Directories of USB to see if any of them contain
           a python executable. 
          + If one is found
            + Use python to launch tkinter and use the filedialog
              to select the directory containing Anaconda
          + Fallback to a slower depth first search
    - **STEP 2: CACHE THE VALUE IN A BAT FILE**
        - Cache the value in <settup directory>/vars/vars.bat
    - **STEP 3: PUSHD ANACONDA DIRECTORY**
        + TODO: Get a list of enviroments
        + Use .\Scripts\activate.bat to activate default conda enviroment
    - **STEP 4: Download the packages not installed in the initial install**
    - **STEP 5: Generate Batch Scripts For Launcher**
        + Scripts are generated based upon the .lnk shortcuts that would
          normally be added in the window's start menu. However, we still
          need to use batch files since .lnk shortcuts must contain
          the absolute path to their targets.
        + We will use three files to generate this
            + The first is a header file that enables delayed variable
              expansion and turns off echo. (.\profiles\header.bat)
            + The second is dynamically generated and defines an enviromental
              variable stating where the anaconda directory is relative to the
              root of the USB drive
            + The third contains the call to launch the IDE
        + Files are concatenated (1)(2)(3) a temporary file in %TEMPDIR%
        + The combined file is then moved to the base of the USB Drive
* On Subsequent Runs