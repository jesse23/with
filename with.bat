@echo off
setlocal

:: Do FZF Setting Here
:: set FZF_DEFAULT_COMMAND=fd -a -j 4
:: set FZF_DEFAULT_OPTS=--prompt="=>" --border --inline-info 

:: Process executable input
set EXECUTABLE=%1

:::: If just 'with', no executable so no ext
if not defined EXECUTABLE goto EXEFZF

:::: Get extension and file name
for /f "usebackq delims=" %%a in (`where %EXECUTABLE%`) do (set EXE_EXT=%%~xa) && (set EXE_NAME=%%~na)

:::: NOTE: for support *.cmd, we can use example below
:::: set "formats=.cmd.bat."
:::: for /f "usebackq delims=" %%a in (`where %EXECUTABLE%`) do (
::::   if "!formats:%%~xa.=!" neq "!formats!" (
::::     set IS_BAT=true
::::   ) 
::::   set EXE_EXT=%%~xa
::::   set EXE_NAME=%%~na
:::: )

:::: If still no ext here, means EXECUTABLE is invalid
if not defined EXE_EXT goto END

:EXEFZF
:: Run fzf to get selection
for /f "usebackq delims=" %%i in (`fzf`) do set SELECTION=%%~fi

:::: Go to end if no selection
if not defined SELECTION goto END 

:: Do execution
:::: If not BAT go to WITH_START
if not "%EXE_EXT%" == ".bat" goto WITH_START

:::: Hard code for vim.bat case
if "%EXE_NAME%" == "vim" goto WITH_START

:WITH_CALL
call %1 "%SELECTION%"
goto :END

:WITH_START
start "winpty" %1 "%SELECTION%" -cur_console:n
goto :END

:END


