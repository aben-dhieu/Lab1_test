#!/bin/bash
# Function to clean repository
clean_repository() {
    echo "Cleaning repository..."
    
    # Rename directory if it exists
    if [ -d "./rename_directory" ]; then
        
        mv rename_directory analyzed_data
        
        echo "Directory renamed."
        
        # Remove dummy file from renamed directory (if exists)
        rm -f analyzed_data/dummy-3.txt
        
    fi
    
    # Remove dummy files from root and raw_data directories (if exist)
    rm -f dummy dummy-2.txt raw-data/dummy-2.txt
    
}


