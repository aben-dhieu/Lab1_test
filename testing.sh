#!/bin/bash

# Set variables for columns based on actual CSV structure (example assumes temperature is column 5)
TEMP_COLUMN=5  
COUNTRY_COLUMN=3  
HUMIDITY_COLUMN=6  

# Set chosen country name here (e.g., South Africa)
COUNTRY_NAME="South Africa"

echo "Starting cleanup and analysis..."

# Navigate to correct path if necessary; adjust based on where script runs relative to data files.
cd "$(dirname "$0")"

# Task 1: Cleanup
echo "Cleaning up repository..."

# Rename directory if it exists
if [ -d rename_directory ]; then
    mv rename_directory analyzed_data
fi

# Create raw_data directory if it doesn't exist
if [ ! -d raw_data ]; then
    mkdir raw_data
fi

# Move satelite_temperature_data.csv into raw_data/
mv satelite_temperature_data.csv raw_data/

# Delete dummy files if they exist
rm -f dummy dummy-2.txt dummy-3.txt

echo "Cleanup completed."

# Task 2: Analysis using Linux commands

echo "Analyzing satellite data..."

### Extract top temperatures into highest_temp.csv under analyzed_Data/
sort -t ',' -k $TEMP_COLUMN,nr raw_data/satelite_temperature_data.csv | head > analyzed_data/highest_temp.csv 

### Extract specific country's data sorted by humidity descendingly into humidity_<country>.csv under analyzed_Data/
grep "$COUNTRY_NAME" raw_data/satelite_temperature_data.csv | sort -t ',' -k $HUMIDITY_COLUMN,rn > analyzed_data/humidity_$COUNTRY_NAME.csv 

echo "Analysis completed."

