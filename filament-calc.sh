#!/bin/bash

# display, text, input
get_inputs() {
    zenity --forms \
    --title="Filament Calculator" \
    --text="Enter Filament Information" \
    --add-entry="Weight of Filament (grams):" \
    --add-entry="Price of Filament (without currency):" \
    --add-entry="Currency:" \
    --add-entry="Amount of Filament Used (grams):" \
    --separator="," \
    --width=400 \
    --height=250
}

# getting data from user
input_data=$(get_inputs)

# Extracting input values
IFS=',' read -r filament_weight filament_price_before filament_used currency <<< "$input_data"

# Calculating
price_for_filament_used=$(echo "scale=2; ($filament_used * $filament_price_before) / $filament_weight" | bc)

# Display
zenity --info --title="Filament Calculator" --text="Price for filament you used is: $price_for_filament_used $currency" \
