# Get-System-Info.ps1
# PowerShell script to gather system information

# Get computer name
$computerName = $env:COMPUTERNAME
Write-Host "Computer Name: $computerName"

# Get operating system information
$os = Get-CimInstance -ClassName Win32_OperatingSystem
Write-Host "Operating System: $($os.Caption)"
Write-Host "OS Version: $($os.Version)"
Write-Host "OS Architecture: $($os.OSArchitecture)"

# Get processor information
$processor = Get-CimInstance -ClassName Win32_Processor
Write-Host "Processor: $($processor.Name)"
Write-Host "Number of Cores: $($processor.NumberOfCores)"

# Get memory information
$memory = Get-CimInstance -ClassName Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum
$totalMemoryGB = [math]::Round($memory.Sum / 1GB, 2)
Write-Host "Total Physical Memory: $totalMemoryGB GB"

# Get disk information
Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3" | ForEach-Object {
    $freeSpaceGB = [math]::Round($_.FreeSpace / 1GB, 2)
    $sizeGB = [math]::Round($_.Size / 1GB, 2)
    Write-Host "Drive $($_.DeviceID) - Total: $sizeGB GB, Free: $freeSpaceGB GB"
}

# Get network adapter information
Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration -Filter "IPEnabled=True" | ForEach-Object {
    Write-Host "Network Adapter: $($_.Description)"
    Write-Host "  IP Address: $($_.IPAddress -join ', ')"
    Write-Host "  Subnet Mask: $($_.IPSubnet -join ', ')"
    Write-Host "  Default Gateway: $($_.DefaultIPGateway -join ', ')"
    Write-Host "  DNS Servers: $($_.DNSServerSearchOrder -join ', ')"
}
