# IPv4 DNS & DHCP Troubleshooting Guide

## Overview
This guide covers common troubleshooting steps for IPv4, DNS, and DHCP issues in a Windows Server environment.

## DNS Troubleshooting

### Common Issues
1. **DNS resolution failures**
2. **Slow DNS queries**
3. **DNS server not responding**

### Diagnostic Commands
```powershell
# Test DNS resolution
nslookup example.com

# Clear DNS cache
ipconfig /flushdns

# Display DNS cache
ipconfig /displaydns

# Test specific DNS server
nslookup example.com 192.168.1.10
```

### Resolution Steps
1. Verify DNS server is running
2. Check DNS forwarders configuration
3. Review DNS zone records
4. Verify network connectivity to DNS server

## DHCP Troubleshooting

### Common Issues
1. **Clients not receiving IP addresses**
2. **IP address conflicts**
3. **Scope exhaustion**

### Diagnostic Commands
```powershell
# Release current IP
ipconfig /release

# Renew IP address
ipconfig /renew

# View DHCP lease information
ipconfig /all
```

### Resolution Steps
1. Verify DHCP server service is running
2. Check scope availability
3. Review exclusion ranges
4. Verify DHCP relay agent configuration (if applicable)

## IPv4 Connectivity Troubleshooting

### Diagnostic Commands
```powershell
# Test connectivity
ping 192.168.1.1

# Trace route
tracert example.com

# View routing table
route print

# View network configuration
ipconfig /all
```

### Resolution Steps
1. Verify physical connectivity
2. Check IP configuration
3. Verify default gateway
4. Review firewall rules
