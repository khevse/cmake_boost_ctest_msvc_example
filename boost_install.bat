@echo off
SetLocal enabledelayedexpansion

rem coding: OEM
rem author: Khramtsov E.S.
rem   date: 26.03.2015

rem ----------------------------------------------------------------
rem Change this parameters
rem ----------------------------------------------------------------

rem Visual studio version. Example: 10, 12 ...
set STUDIO_VERSION=12

rem Explicitly request either 32-bit or 64-bit code generation
set ARCHITECTURE=32

rem ----------------------------------------------------------------
rem Not change
rem ----------------------------------------------------------------
set "BOOST_DIR=%cd%"

set "BUILD_DIR=%BOOST_DIR%\b2_build"
set "STAGE_DIR=%BOOST_DIR%\stage"

if exist "%STAGE_DIR%" (
    rmdir /s /q "%STAGE_DIR%"
)

mkdir "%STAGE_DIR%"

cd "%BOOST_DIR%\tools\build"

rem About parameters: http://www.boost.org/doc/libs/1_60_0/more/getting_started/windows.html#identify-your-toolset
call bootstrap vc%STUDIO_VERSION%

set "PATH=%BOOST_DIR%\tools\build;%PATH%"

if %NUMBER_OF_PROCESSORS% == 1 (
    set count_processes=1
) else (
    set/A count_processes=%NUMBER_OF_PROCESSORS%/2
)

cd "%BOOST_DIR%"

rem About parameters: http://www.boost.org/build/doc/html/bbv2/overview/invocation.html
b2 ^
    --prefix="%BUILD_DIR%" ^
    -j%count_processes% ^
    toolset=msvc-%STUDIO_VERSION%.0 ^
    variant=debug,release ^
    threading=single,multi ^
    link=static ^
    runtime-link=shared,static ^
    address-model=%ARCHITECTURE% ^
    --build-type=complete stage ^
    --layout=versioned ^
    install