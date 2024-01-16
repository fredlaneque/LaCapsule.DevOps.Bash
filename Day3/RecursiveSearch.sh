#!/bin/bash

# Find and process CSV files
find ~ -name "*.csv" -exec awk -F, '$2 > 2