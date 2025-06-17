# VGR-1 🛡️ - Vulnerability Guide Recommender

`VGR-1` is a Bash tool built to assist bug bounty hunters in identifying attack vectors based on URL parameters. It is helpful for reconnaissance during penetration testing and ethical hacking.

---

## 🚀 Features

- Takes a target URL as input
- Automatically detects URL parameters
- Suggests possible attacks like:
  - XSS (Cross-Site Scripting)
  - SQL Injection
  - SSRF (Server-Side Request Forgery)
  - Open Redirect
  - Command Injection
- Easy to use for beginners and useful for pros

---

## 💻 Usage

```bash
bash vgr.sh "https://example.com/page.php?id=123"
