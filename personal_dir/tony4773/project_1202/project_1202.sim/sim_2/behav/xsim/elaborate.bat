@echo off
REM ****************************************************************************
<<<<<<< HEAD
REM Vivado (TM) v2020.2 (64-bit)
=======
REM Vivado (TM) v2020.1 (64-bit)
>>>>>>> 9f881404852e3b8f6847682d22899b1450dea088
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
<<<<<<< HEAD
REM Generated by Vivado on Thu Dec 03 03:58:24 +0900 2020
REM SW Build 3064766 on Wed Nov 18 09:12:45 MST 2020
=======
REM Generated by Vivado on Wed Dec 02 05:32:17 +0900 2020
REM SW Build 2902540 on Wed May 27 19:54:49 MDT 2020
>>>>>>> 9f881404852e3b8f6847682d22899b1450dea088
REM
REM Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
<<<<<<< HEAD
REM elaborate design
=======
>>>>>>> 9f881404852e3b8f6847682d22899b1450dea088
echo "xelab -wto 56597538158a44a8947425f4afbd4c54 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot testBench_behav xil_defaultlib.testBench -log elaborate.log"
call xelab  -wto 56597538158a44a8947425f4afbd4c54 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot testBench_behav xil_defaultlib.testBench -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
