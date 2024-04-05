#!/bin/bash
#!/bin/bash

# Get hidden window IDs in the focused workspace
hidden_windows=$(bspc query -N -d focused -n .hidden)

workspace_name=$(bspc query -D -d focused --names)

# Create an array to store window titles and corresponding IDs
declare -A window_titles

# Function to generate a unique title by appending an index
generate_unique_title() {
    local title="$1"
    local index=2
    while [[ -n "${window_titles[$title]}" ]]; do
        title="$1 ($index)"
        ((index++))
    done
    echo "$title"
}

# Loop through hidden windows
for window_id in $hidden_windows; do
    # Get title of each hidden window
    window_title=$(xtitle "$window_id")

    if [ -n "$window_title" ]; then
        unique_title=$(generate_unique_title "$window_title")
        window_titles["$unique_title"]="$window_id"
    fi
done

# Create an array of window titles for Rofi
rofi_items=""
for title in "${!window_titles[@]}"; do
    rofi_items+="$title\n"
done

# Run Rofi to select a window
selected_window=$(echo -e "$rofi_items" | rofi -dmenu -i -lines ${#window_titles[@]} -p "Hidden windows at $workspace_name")

# Check if a window was selected
if [ -n "$selected_window" ]; then
    # Get the ID of the selected window
    selected_window_id="${window_titles[$selected_window]}"
    echo $selected_window_id
    # Focus the selected window
    bspc node "$selected_window_id" --flag hidden=off
fi
