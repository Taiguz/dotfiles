#!/bin/bash

# Function to get the title of a window using xtitle
get_window_title() {
    title=$(xtitle "$1")
    echo "$title"
}

# Get hidden window IDs in the focused workspace
hidden_windows=$(bspc query -N -d focused -n .hidden)

# Initialize count of hidden windows with non-empty titles
hidden_window_count=0

# Loop through hidden windows
for window_id in $hidden_windows; do
    # Get title of each hidden window
    window_title=$(get_window_title "$window_id")
    # If title is not blank, increment the count
    if [ -n "$window_title" ]; then
        ((hidden_window_count++))
    fi
done

# Check if the count is zero
if [ "$hidden_window_count" -eq 0 ]; then
    # If count is zero, return blank
    echo ""
else
    # Otherwise, return the original count
    echo " $hidden_window_count"
fi
