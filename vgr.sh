#!/bin/bash

#--------------------#
#  👾 VGOD ATTACK SUGGESTER 
#--------------------#
# Made by Shivam Singh - For Educational & Authorized Use Only
# Suggests multiple attack vectors based on URL parameters
#--------------------#

# Colors
RED="\033[1;31m"
GREEN="\033[1;32m"
CYAN="\033[1;36m"
YELLOW="\033[1;33m"
RESET="\033[0m"

# Banner
clear
echo -e "${CYAN}"
echo "╔═══════════════════════════════════════╗"
echo "║     🚨 VGOD ATTACK SUGGESTER 🔥       ║"
echo "╠═══════════════════════════════════════╣"
echo "║  Made for Bug Bounty & Ethical Hacking║"
echo "╚═══════════════════════════════════════╝"
echo -e "${RESET}"

# Input
read -p "🔗 Enter a full URL (e.g. https://example.com/page.php?id=1&search=test): " url

# Check if input is valid
if [[ -z "$url" || "$url" != *"?"* ]]; then
    echo -e "${RED}❌ Please enter a valid URL with parameters.${RESET}"
    exit 1
fi

# Extract parameters
params=$(echo "$url" | cut -d '?' -f2 | tr '&' '\n' | cut -d '=' -f1)

echo -e "\n${YELLOW}🔍 Analyzing parameters...${RESET}"

sleep 1

for param in $params; do
    echo -e "\n${GREEN}[+] Found parameter: $param${RESET}"

    # Convert to lowercase
    p=$(echo "$param" | tr '[:upper:]' '[:lower:]')

    # SQLi, IDOR, Auth Bypass
    [[ "$p" =~ id|user|uid|account|pid|ref|profile ]] && {
        echo -e "${CYAN}   ↳ SQL Injection (SQLi)"
        echo -e "   ↳ IDOR (Insecure Direct Object Reference)"
        echo -e "   ↳ Authentication Bypass${RESET}"
    }

    # XSS
    [[ "$p" =~ search|q|query|msg|comment|input|name|desc|text|s ]] && {
        echo -e "${CYAN}   ↳ Reflected XSS"
        echo -e "   ↳ Stored XSS"
        echo -e "   ↳ DOM-Based XSS${RESET}"
    }

    # Open Redirect, SSRF
    [[ "$p" =~ url|redirect|target|next|return|dest ]] && {
        echo -e "${CYAN}   ↳ Open Redirect"
        echo -e "   ↳ SSRF (Server-Side Request Forgery)"
        echo -e "   ↳ Host Header Injection${RESET}"
    }

    # LFI / RFI / Traversal
    [[ "$p" =~ file|path|page|doc|folder ]] && {
        echo -e "${CYAN}   ↳ Local File Inclusion (LFI)"
        echo -e "   ↳ Remote File Inclusion (RFI)"
        echo -e "   ↳ Directory Traversal${RESET}"
    }

    # i18n bugs
    [[ "$p" =~ lang|locale|theme|style ]] && {
        echo -e "${CYAN}   ↳ i18n Bugs"
        echo -e "   ↳ File Inclusion via Theme Manipulation${RESET}"
    }

    # Debug / Info Disclosure
    [[ "$p" =~ debug|log|test|dev ]] && {
        echo -e "${CYAN}   ↳ Debug Info Disclosure"
        echo -e "   ↳ Stack Trace / Verbose Errors${RESET}"
    }

    # Token abuse
    [[ "$p" =~ token|auth|access|key|secret|apikey|jwt ]] && {
        echo -e "${CYAN}   ↳ Token Leakage"
        echo -e "   ↳ JWT Manipulation / None Algorithm"
        echo -e "   ↳ Authorization Bypass${RESET}"
    }

    # Command Injection
    [[ "$p" =~ cmd|exec|run|exec_cmd|command|payload ]] && {
        echo -e "${CYAN}   ↳ OS Command Injection"
        echo -e "   ↳ RCE (Remote Code Execution)${RESET}"
    }

    # XML Injection
    [[ "$p" =~ xml|feed|data|input ]] && {
        echo -e "${CYAN}   ↳ XXE (XML External Entity Injection)"
        echo -e "   ↳ XML Injection${RESET}"
    }

    # HTTP Header Injection
    [[ "$p" =~ header|host|forwarded|origin|referer ]] && {
        echo -e "${CYAN}   ↳ HTTP Header Injection"
        echo -e "   ↳ Cache Poisoning"
        echo -e "   ↳ SSRF via headers${RESET}"
    }

    # CSRF
    [[ "$p" =~ csrf|xsrf ]] && {
        echo -e "${CYAN}   ↳ CSRF (Cross-Site Request Forgery)"
        echo -e "   ↳ Session Fixation${RESET}"
    }

    # Prototype Pollution
    [[ "$p" =~ __proto__|constructor|prototype ]] && {
        echo -e "${CYAN}   ↳ Prototype Pollution"
        echo -e "   ↳ DOM Clobbering${RESET}"
    }

    # Clickjacking / UI Redress
    [[ "$p" =~ frame|iframe|ui|view ]] && {
        echo -e "${CYAN}   ↳ Clickjacking"
        echo -e "   ↳ UI Redress Attack${RESET}"
    }

    # Bruteforce / Rate Limit
    [[ "$p" =~ login|pass|password|otp|code|try ]] && {
        echo -e "${CYAN}   ↳ Rate Limiting Bypass"
        echo -e "   ↳ Bruteforce / Credential Stuffing${RESET}"
    }

    # No matches
    if ! [[ "$p" =~ id|user|uid|account|pid|ref|profile|search|q|query|msg|comment|input|name|desc|text|s|url|redirect|target|next|return|dest|file|path|page|doc|folder|lang|locale|theme|style|debug|log|test|dev|token|auth|access|key|secret|apikey|jwt|cmd|exec|run|exec_cmd|command|payload|xml|feed|data|input|header|host|forwarded|origin|referer|csrf|xsrf|__proto__|constructor|prototype|frame|iframe|ui|view|login|pass|password|otp|code|try ]]; then
        echo -e "${YELLOW}   ↳ Custom or Unrecognized — Try fuzzing manually.${RESET}"
    fi

done

echo -e "\n${GREEN}✅ Extended analysis complete. Keep hacking responsibly!${RESET}"
