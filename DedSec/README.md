# DedSec CLI Tool

**Author:** Tyler  
**Inspired by:** Watch Dogs  
**Description:**  
DedSec is a command-line penetration testing toolkit designed to provide useful network and web tools with a clean, hacker-themed interface.  
It includes IP tracking, port scanning, admin panel finding, basic hash cracking, system info, and IP logger link generation.

---

## Features

- IP Tracker using `ip-api.com`
- Port Scanner using `nmap`
- Admin Panel Finder for common admin paths
- Basic MD5 Hash Cracker using online lookup
- System Info display (`neofetch`)
- IP Logger Link Generator using Grabify

---

## Requirements

- Linux or macOS terminal (or Termux on Android)  
- `bash` shell  
- `curl`  
- `jq` (for JSON formatting)  
- `nmap`  
- `figlet`  
- `neofetch` (optional, for system info)  

---

## Installation

1. Clone or download the repository:

```bash
git clone https://github.com/yourusername/dedsec-cli-tool.git
cd dedsec-cli-tool

Make the main script executable:
chmod +x dedsec.sh

Run the tool:
./dedsec.sh