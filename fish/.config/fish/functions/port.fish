function port
    sudo ss -tulpn | awk '{printf "%-6s %-9s %-19s %s\n", $1, $2, $5, $7}'
end

