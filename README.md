BatteryInfoProgram
==================

A program designed for retrieving info from a laptop battery


How To Use
==================

This program was designed to be used in a network infrastructure.

The way it works is "BatteryInfo.bat" should be ran on the target computer, this
will then output a .xml file to a directory specified from within the file.

Then once all the computers that have ran "BatteryInfo.bat" have finished, you can run the "Compile CSV.ps1"
to pull all the data into one file.

Both files have variabels in them which can be changed to better suit your needs, such as where to write the files to
and also what kinda of data will be added to the final CSV file.
