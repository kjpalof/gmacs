# Gmacs Version 1.0 #

Updated December 2013, by Athol Whitten

## Generalized Modeling for Alaskan Crab Stocks ##

This repository holds code and instructions for Gmacs (Generalized Modeling for Alaskan Crab Stocks), a generic size-based stock assessment model. 

## Modeling structure and format ##

Gmacs implements a size-structured modelling framework with flexibility similar to that provided by other general stock assessment modelling frameworks. Some effort has been made to maintain consistency with data and control file formats familiar to users of Stock Synthesis.
### Input file structure
####  Catch structure  
  * Fishery, year, retained,...      
####  Length structure  
  1. Fishery   
  2. Year   
  2. Retention
  2. Maturity   
  2. Shell condition  
  2. Sex
  2. Size-bin      
#### For numbers at length:  
  * Resolution: year, sex, maturity, shell condition, size-bin

## Development ##
This software is under development and is not yet intended for general use. If you would like to contribute to the project, please contact [Athol Whitten](mailto:whittena@uw.edu). 
