function vps
    set vps_list "$HOME/cloud/resources/vps-list"
    
    if not test -f $vps_list
        echo "Error: Vps list file '$vps_list' not found"
        return 1
    end
    
    # Read the vps list and create a selection with fzf
    set selected_line (cat $vps_list | grep -v '^#' | grep -v '^$' | sk --prompt="Select vps: " --border)
    
    # Check if user made a selection
    if test -z "$selected_line"
        echo "No vps selected"
        return 0
    end
    
    # Extract server name and IP from the selected line
    set vps_info (echo $selected_line | string split ' ')
    set vps_name $vps_info[1]
    set vps_ip $vps_info[2]
    
    # Validate that we have both name and IP
    if test -z "$vps_name" -o -z "$vps_ip"
        echo "Error: Invalid vps entry format. Expected: vps-name vps-ip"
        return 1
    end
    
    echo "Connecting to $vps_name ($vps_ip)..."
    ssh root@$vps_ip -t fish
end
