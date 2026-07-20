#!/bin/bash

# Fetch data from aspi
acpi_out=$(acpi -b)
[[ -z "$acpi_out" ]] && exit 0

charge=$(echo "$acpi_out" | grep -P -o "[0-9]+(?=%)")

echo "$charge"
