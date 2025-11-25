# Network Map

## Overview
This document provides a visual representation of the network topology.

## Network Diagram

```
                            ┌─────────────────┐
                            │    Internet     │
                            └────────┬────────┘
                                     │
                            ┌────────┴────────┐
                            │    Firewall     │
                            │   192.168.1.1   │
                            └────────┬────────┘
                                     │
                    ┌────────────────┼────────────────┐
                    │                │                │
           ┌────────┴────────┐ ┌─────┴─────┐ ┌───────┴───────┐
           │   Core Switch   │ │   Router  │ │  Wireless AP  │
           │  192.168.1.2    │ │           │ │ 192.168.1.5   │
           └────────┬────────┘ └───────────┘ └───────────────┘
                    │
    ┌───────────────┼───────────────┬───────────────┐
    │               │               │               │
┌───┴───┐     ┌─────┴─────┐   ┌─────┴─────┐   ┌─────┴─────┐
│  DC   │     │   File    │   │   DHCP    │   │   Print   │
│Server │     │  Server   │   │  Server   │   │  Server   │
│.10    │     │   .20     │   │   .30     │   │   .40     │
└───────┘     └───────────┘   └───────────┘   └───────────┘

```

## IP Address Assignments

| Device | IP Address | Description |
|--------|------------|-------------|
| Firewall | 192.168.1.1 | Network perimeter |
| Core Switch | 192.168.1.2 | Main network switch |
| Wireless AP | 192.168.1.5 | Wireless access point |
| Domain Controller | 192.168.1.10 | AD DS, DNS |
| File Server | 192.168.1.20 | File shares |
| DHCP Server | 192.168.1.30 | DHCP services |
| Print Server | 192.168.1.40 | Print services |

## Network Segments

| Segment | Subnet | Description |
|---------|--------|-------------|
| Management | 192.168.1.0/24 | Server and infrastructure |
| Workstations | 192.168.2.0/24 | End-user devices |
| Guest | 192.168.10.0/24 | Guest wireless network |

## VLAN Configuration

| VLAN ID | Name | Subnet |
|---------|------|--------|
| 1 | Management | 192.168.1.0/24 |
| 10 | Workstations | 192.168.2.0/24 |
| 20 | Guest | 192.168.10.0/24 |
| 100 | Voice | 192.168.100.0/24 |
