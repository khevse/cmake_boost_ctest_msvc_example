@echo off
rem coding: OEM
rem author: Khramtsov E.S.
rem   date: 26.03.2015

rem source: https://cognitivewaves.wordpress.com/cmake-and-visual-studio/

rem ----------------------------------------------------------------
rem Change this parameters
rem ----------------------------------------------------------------

rem Visual studio version. Example: 10, 12 ...
SET STUDIO_VERSION=12

rem ----------------------------------------------------------------
rem Not change
rem ----------------------------------------------------------------

SET "DIR_NAME=msvc%STUDIO_VERSION%"
if exist "%DIR_NAME%" (
    rmdir /s /q "%DIR_NAME%"
)

mkdir "%DIR_NAME%"
cd "%DIR_NAME%"

cmake .. -G "Visual Studio %STUDIO_VERSION%"

start "" my_lib.sln