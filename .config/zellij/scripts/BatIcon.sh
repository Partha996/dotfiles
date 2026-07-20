#!/bin/bash

# Fetch data from aspi
acpi_out=$(acpi -b)
[[ -z "$acpi_out" ]] && exit 0

# Extract percentage and status
charge=$(echo "$acpi_out" | grep -P -o "[0-9]+(?=%)")
status=$(echo "$acpi_out" | grep -oE "Charging|Discharging|Full|Not charging")

# Scale 0-100 to 0-10
level=$((charge / 10))

discharge_icons=(󰠑 󰁺 󰁻 󰁼 󰁽 󰁾 󰁿 󰂀 󰂂 󰂂 󰁹)
charge_icons=(󰢜 󰂆 󰂇 󰂈 󰢝 󰂉 󰢞 󰂊 󰂋 󰂅 󰂄)

if [[ "$status" == "Charging" ]]; then
	printf '%s\n' "${charge_icons[$level]}"
elif [[ "$status" == "Discharging" ]]; then
	printf '%s\n' "${discharge_icons[$level]}"
else
	printf '%s\n' "󱈑"
fi
