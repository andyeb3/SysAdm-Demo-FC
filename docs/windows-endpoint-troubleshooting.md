# Windows Endpoint Troubleshooting Guide

## Overview
This guide provides troubleshooting steps for common Windows endpoint issues in an enterprise environment.

## Network Connectivity Issues

### Symptoms
- Unable to access network resources
- Slow network performance
- Intermittent connectivity

### Diagnostic Steps
```powershell
# Check network adapter status
Get-NetAdapter

# View IP configuration
ipconfig /all

# Test network connectivity
Test-NetConnection -ComputerName server01 -Port 445

# Check DNS resolution
Resolve-DnsName example.com
```

### Resolution Steps
1. Verify physical cable connection
2. Check network adapter drivers
3. Reset TCP/IP stack: `netsh int ip reset`
4. Reset Winsock: `netsh winsock reset`

## Domain Join Issues

### Symptoms
- Trust relationship failures
- Unable to authenticate
- Group Policy not applying

### Diagnostic Steps
```powershell
# Test domain connectivity
Test-ComputerSecureChannel -Verbose

# Check domain membership
(Get-WmiObject Win32_ComputerSystem).Domain

# Force Group Policy update
gpupdate /force
```

### Resolution Steps
1. Verify network connectivity to domain controller
2. Check DNS settings point to domain DNS servers
3. Reset computer account password
4. Rejoin domain if trust relationship broken

## Performance Issues

### Symptoms
- Slow system performance
- High CPU/memory usage
- Application hangs

### Diagnostic Steps
```powershell
# Check running processes
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10

# Check disk usage
Get-WmiObject Win32_LogicalDisk | Select-Object DeviceID, FreeSpace, Size

# Check system events
Get-EventLog -LogName System -Newest 50
```

### Resolution Steps
1. Check for malware
2. Review startup programs
3. Check disk space and health
4. Update drivers and Windows

## Remote Access Issues

### Symptoms
- Unable to RDP to workstation
- Remote management failures

### Diagnostic Steps
```powershell
# Check RDP service
Get-Service TermService

# Verify RDP is enabled
(Get-ItemProperty 'HKLM:\System\CurrentControlSet\Control\Terminal Server').fDenyTSConnections

# Check firewall rules
Get-NetFirewallRule -DisplayGroup "Remote Desktop"
```

### Resolution Steps
1. Enable Remote Desktop
2. Configure firewall rules
3. Verify user has RDP permissions
4. Check Network Level Authentication settings
