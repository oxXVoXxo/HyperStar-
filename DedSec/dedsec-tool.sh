#!/bin/bash
# DedSec CLI Tool - By Tyler (Inspired by Watch Dogs)

# Colors
red='\033[1;31m'
green='\033[1;32m'
cyan='\033[1;36m'
yellow='\033[1;33m'
reset='\033[0m'

# Banner
banner() {
    clear
    echo -e "${red}"
    figlet -f slant "DedSec"
    echo -e "${cyan}Welcome to the System. Tools Loaded.${reset}"
    echo ""
}

# Menu
menu() {
    echo -e "${green}[1]${reset} IP Tracker"
    echo -e "${green}[2]${reset} Port Scanner"
    echo -e "${green}[3]${reset} Admin Panel Finder"
    echo -e "${green}[4]${reset} Basic Hash Cracker"
    echo -e "${green}[5]${reset} System Info"
    echo -e "${green}[6]${reset} IP Logger Link Generator"
    echo -e "${green}[0]${reset} Exit"
    echo -ne "${cyan}\nChoose your tool: ${reset}"
    read choice
    case $choice in
        1) ip_tracker ;;
        2) port_scanner ;;
        3) admin_finder ;;
        4) hash_cracker ;;
        5) neofetch ;;
        6) ip_logger ;;
        0) echo -e "${red}Exiting DedSec. Stay hidden.${reset}"; exit ;;
        *) echo -e "${red}Invalid choice.${reset}"; sleep 1; main ;;
    esac
}

ip_tracker() {
    echo -ne "${cyan}Enter IP/Domain: ${reset}"
    read target
    curl -s http://ip-api.com/json/$target | jq
    back
}

port_scanner() {
    echo -ne "${cyan}Target IP: ${reset}"
    read ip
    echo -ne "${cyan}Ports (e.g. 20-80): ${reset}"
    read ports
    nmap -p $ports $ip
    back
}

admin_finder() {
    echo -ne "${cyan}Enter Website URL: ${reset}"
    read site
    for path in admin login wp-admin dashboard panel; do
        url="$site/$path"
        status=$(curl -s -o /dev/null -w "%{http_code}" $url)
        if [ $status == "200" ]; then
            echo -e "${green}[+] Found: $url${reset}"
        fi
    done
    back
}

hash_cracker() {
    echo -ne "${cyan}Enter MD5 Hash: ${reset}"
    read hash
    curl -s "https://md5.gromweb.com/?md5=$hash" | grep -oP '(?<=<em class="long-content string">)[^<]+'
    back
}

ip_logger() {
    echo -e "${cyan}Generating IP logger link using Grabify...${reset}"
    echo -ne "${cyan}Enter a redirect URL (e.g. https://example.com): ${reset}"
    read redirect

    echo -e "${green}[+] Open this page to generate your link:${reset}"
    echo -e "${cyan}https://grabify.link${reset}"

    echo -e "${yellow}"
    echo "1. Go to Grabify.link"
    echo "2. Paste the redirect URL: $redirect"
    echo "3. Click 'Create URL'"
    echo "4. Copy the tracking link and send it to your target"
    echo "5. Monitor logged IPs from Grabify dashboard"
    echo -e "${reset}"

    back
}

back() {
    echo -ne "${cyan}\nPress [Enter] to return to menu...${reset}"
    read
    main
}

main() {
    banner
    menu
}

main
