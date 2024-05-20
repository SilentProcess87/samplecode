# Define the IOCs
$IPs = @("45.150.67.235", "212.193.2.48")
$Domains = @("api.startservicefounds.com", "dns.startservicefounds.com")

# Function to check an IP
function Check-IP {
    param (
        [string]$IP
    )
    try {
        Invoke-WebRequest -Uri "http://$IP" -Method Get
    } catch {
        Write-Output "Failed to reach $IP: $_"
    }
}

# Function to check a domain
function Check-Domain {
    param (
        [string]$Domain
    )
    try {
        Invoke-WebRequest -Uri "http://$Domain" -Method Get
    } catch {
        Write-Output "Failed to reach $Domain: $_"
    }
}

# Loop through the IPs and Domains
foreach ($IP in $IPs) {
    Check-IP -IP $IP
}

foreach ($Domain in $Domains) {
    Check-Domain -Domain $Domain
}
