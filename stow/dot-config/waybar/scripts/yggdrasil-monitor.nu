#!/usr/bin/env nu

def main [] {
    # 1. Parse the table
    let peers = (yggdrasilctl getpeers | detect columns)
    
    # 2. Metrics
    let total = ($peers | length)
    let up = ($peers | where State == "Up" | length)
    
    # 3. Status logic
    let status = if $up == 0 { 
        "down" 
    } else if $up < $total { 
        "degraded" 
    } else { 
        "ok" 
    }

    # 5. Final JSON
    {
        text: $"($up)/($total)",
        class: $status,
        alt: $status,
        percentage: (if $total > 0 { ($up * 100 / $total) } else { 0 })
    } | to json -r
}
