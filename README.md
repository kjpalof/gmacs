# Gmacs Version 1.0 #

Updated January 2014, by Athol Whitten

**Note:** Current source files are under active development and will not compile. An updated and compilable source will be available at the end of the week (January 10th).

## Generalized Modeling for Alaskan Crab Stocks ##

This repository holds source code, instructions, examples, and associated scripts for **Gmacs** (Generalized Modeling for Alaskan Crab Stocks), a generic size-based stock assessment model. 

## Modeling structure and format ##

Gmacs implements a size-structured modelling framework with flexibility similar to that provided by other general stock assessment modelling frameworks. Some effort has been made to maintain consistency with data and control file formats familiar to users of Stock Synthesis.

### Input file structure

Data are supplied via the `model.dat` file in a *flat format* to enable easy indexing and simple preparation using spreadsheet software. Each record for catch, abundance, length-structure etc. should be held in an individual row, with information relating to year, fleet, sex and more:

####  Catch data structure
 
  * Year, Season, Fleet, Sex, Observation    

####  Survey data structure
 
  * Year, Season, Survey, Observation, Error

####  Length frequency data structure  

  * Year, Season, Fleet/Survey, Sex, Maturity, Shell Condition, No. Samples, Data

Gmacs allows for the inclusion of an optional growth data file `growth.dat` to specify a fixed growth transtion matrix or year-specific growth transtion matrices. The program also reads a `starter.gm` file for specifying the overall model run conditions, and a control file `model.ctl` for specifications relating to parameter estimation. Finally, a `forecast.gm` file is read to specify the calculation of relevant reference points. This file will allow users to specify model projection options in later versions of Gmacs.

During the read-in procedure, helpful messages are printed to screen and the information read in is printed to a separate file called `echoinput.gm` allowing users to check and debug their data and control files. 

A general user-guide to the program is under development and will be made available with future releases.

## Development ##
This software is under development and is not yet intended for general use. If you would like to contribute to the project, please contact [Athol Whitten](mailto:whittena@uw.edu). 
