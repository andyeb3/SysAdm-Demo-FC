# File Server Access Guide

## Overview
This guide covers common procedures for accessing and troubleshooting file server access in a Windows environment.

## Connecting to File Shares

### Using Windows Explorer
1. Open File Explorer
2. In the address bar, type: `\\servername\sharename`
3. Press Enter
4. Authenticate if prompted

### Using Command Line
```cmd
# Map a network drive
net use Z: \\fileserver\share

# Map with credentials
net use Z: \\fileserver\share /user:domain\username

# List mapped drives
net use

# Disconnect a mapped drive
net use Z: /delete
```

### Using PowerShell
```powershell
# Map a network drive
New-PSDrive -Name Z -PSProvider FileSystem -Root \\fileserver\share -Persist

# List mapped drives
Get-PSDrive -PSProvider FileSystem

# Remove mapped drive
Remove-PSDrive -Name Z
```

## Troubleshooting Access Issues

### Common Error Messages

#### "Access Denied"
- Verify you have appropriate permissions
- Check share permissions AND NTFS permissions
- Ensure your account is not locked

#### "Network Path Not Found"
- Verify server name is correct
- Check DNS resolution: `nslookup fileserver`
- Verify network connectivity: `ping fileserver`

#### "The specified network name is no longer available"
- Check server availability
- Verify SMB service is running on server
- Check for firewall blocking SMB (ports 445, 139)

### Diagnostic Commands
```powershell
# Test SMB connection
Test-NetConnection -ComputerName fileserver -Port 445

# List shares on a server
net view \\fileserver

# Check current SMB sessions
Get-SmbSession

# View share permissions (from server)
Get-SmbShareAccess -Name ShareName
```

## Best Practices

1. **Use DFS Namespaces** for easier management and redundancy
2. **Apply principle of least privilege** for permissions
3. **Document share permissions** and review regularly
4. **Enable Access-Based Enumeration** to hide folders users cannot access
5. **Use Group Policy** to map drives consistently across the organization

## Permission Levels

| Permission | Description |
|------------|-------------|
| Read | View files and folders |
| Change | Read + create/modify/delete files |
| Full Control | Change + modify permissions |
