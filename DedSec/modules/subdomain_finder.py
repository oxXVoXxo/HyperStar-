import requests
import sys
domain = input("Enter domain: ")
subs = ["www", "mail", "ftp", "test", "dev"]
for sub in subs:
    url = f"http://{sub}.{domain}"
    try:
        res = requests.get(url)
        print("[+] Found:", url)
    except:
        pass
