#!/bin/bash

# List processes
ps -u $USER

# Ask for a PID to kill
read -p "Enter the PID of the process to kill: " pid

# Kill the process
kill "$pid"