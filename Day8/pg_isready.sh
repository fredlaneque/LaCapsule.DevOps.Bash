#!/bin/bash

while true;
do
    if pg_isready -h localhost -p 5432; then
        echo "PostgreSQL is ready."
    else
        echo "PostgreSQL is not responding. Restarting..."
    fi
    sleep 5
done
