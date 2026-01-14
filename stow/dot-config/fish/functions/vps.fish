function vps
    set vps_list "$HOME/.local/share/vps-list"

    if not test -f $vps_list
        echo "Error: Vps list file '$vps_list' not found"
        return 1
    end

    set selected_line (cat $vps_list | grep -v '^#' | grep -v '^$' | sk --prompt="Select vps: " --border)

    if test -z "$selected_line"
        echo "No vps selected"
        return 0
    end

    set vps_info (echo $selected_line | string split ' ')
    set vps_name $vps_info[1]
    set vps_ip $vps_info[2]

    if test -z "$vps_name" -o -z "$vps_ip"
        echo "Error: Invalid vps entry format. Expected: vps-name vps-ip"
        return 1
    end

    echo "Connecting to $vps_name ($vps_ip)..."
    ssh root@$vps_ip -t fish
end
