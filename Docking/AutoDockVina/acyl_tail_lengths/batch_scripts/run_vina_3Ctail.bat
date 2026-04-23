@echo off
setlocal enabledelayedexpansion

:: === USER SETTINGS ===
set "receptor=LpxH_chainA_model1.pdbqt"    :: change to your receptor file
set "ligand=3Ctail.pdbqt"       :: change to your ligand file
set runs=10                      :: how many repeats

for %%A in ("%receptor%") do set "receptorName=%%~nA"
for %%B in ("%ligand%")  do set "ligandName=%%~nB"

for /L %%i in (1,1,%runs%) do (
    echo Running docking iteration %%i...
    vina_1.2.7_win.exe ^
      --receptor "!receptor!" ^
      --ligand  "!ligand!"  ^
      --center_x 10.889      ^
      --center_y 1.139      ^
      --center_z -6.667      ^
      --size_x   72          ^
      --size_y   84          ^
      --size_z   76          ^
      --exhaustiveness 40     ^
      --seed %%i             ^
      --out "!receptorName!_!ligandName!_%%i.pdbqt"
)

echo All runs completed.
pause