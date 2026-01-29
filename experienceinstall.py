import os
import platform
import subprocess
import threading
import tkinter as tk
from tkinter import ttk, messagebox
import requests
import shutil

# =========================
# CONFIG
# =========================
DOWNLOAD_DIR = "ExperienceSetup/temp"
USR_DIR = "ExperienceSetup/usr"

URLS = {
    "Windows": {
        "bluestacks": "https://cloud.bluestacks.com/api/getdownloadnow?platform=win",
        "apk": "https://delta.filenetwork.vip/file/Delta-2.704.1060-02.apk"
    },
    "Linux": {
        "waydroid_iso": "https://sourceforge.net/projects/blissos-dev/files/latest/download",
        "apk": "https://delta.filenetwork.vip/file/Delta-2.704.1060-02.apk"
    }
}

INSTRUCTIONS = {
    "Linux": (
        "1. Install Waydroid:\n"
        "   sudo apt install curl ca-certificates -y\n"
        "   curl -s https://repo.waydro.id | sudo bash\n"
        "   sudo apt install waydroid -y\n"
        "2. Start Waydroid: waydroid session start\n"
        "3. Install APK inside Waydroid"
    ),
    "Windows": (
        "1. Run BlueStacks installer from 'temp'\n"
        "2. Open 'usr' folder to find your APK\n"
        "3. Drag & drop APK into BlueStacks"
    )
}

RUN_COMMANDS = {
    "Linux": ["sudo", "waydroid", "init"],
    "Windows": os.path.join(DOWNLOAD_DIR, "bluestacks_installer.exe")
}

FORCE_INSTALL = False
DOWNLOAD_COMPLETE = False
PLAYWRIGHT_READY = False

# =========================
# OS DETECTION
# =========================
def detect_os():
    system = platform.system()
    if system == "Linux":
        distro_name = platform.linux_distribution()[0] if hasattr(platform, "linux_distribution") else platform.platform()
        return "Linux", distro_name
    return system, None

# =========================
# DOWNLOAD FUNCTION
# =========================
def download_file(url, output, log_cb):
    try:
        r = requests.get(url, stream=True)
        total = int(r.headers.get("content-length", 0))
        downloaded = 0
        with open(output, "wb") as f:
            for chunk in r.iter_content(8192):
                if chunk:
                    f.write(chunk)
                    downloaded += len(chunk)
                    percent = int((downloaded / total) * 100) if total else 0
                    bar = "[" + ("#" * (percent // 4)).ljust(25) + f"] {percent}%"
                    log_cb(f"{os.path.basename(output)}: {bar}")
        log_cb(f"Finished downloading {os.path.basename(output)}")
        return True
    except Exception as e:
        log_cb(f"Error downloading {os.path.basename(output)}: {e}")
        return False

# =========================
# INSTALLER LOGIC
# =========================
def run_downloads(os_name, log, status):
    global DOWNLOAD_COMPLETE, PLAYWRIGHT_READY
    os.makedirs(DOWNLOAD_DIR, exist_ok=True)
    os.makedirs(USR_DIR, exist_ok=True)
    status.set("Please wait, this is normal...")

    tasks = []
    if os_name == "Windows":
        tasks = [
            ("BlueStacks", URLS["Windows"]["bluestacks"], os.path.join(DOWNLOAD_DIR, "bluestacks_installer.exe")),
            ("APK", URLS["Windows"]["apk"], os.path.join(USR_DIR, "delta.apk"))
        ]
    else:
        tasks = [
            ("Waydroid ISO", URLS["Linux"]["waydroid_iso"], os.path.join(DOWNLOAD_DIR, "waydroid.iso")),
            ("APK", URLS["Linux"]["apk"], os.path.join(USR_DIR, "delta.apk"))
        ]

    for name, url, path in tasks:
        if not url:
            log(f"No URL for {name}, skipping...")
            continue
        download_file(url, path, log)

    # Check for Playwright
    if os_name == "Linux":
        try:
            import playwright
        except:
            log("[*] Installing Playwright...")
            subprocess.run([shutil.which("pip3") or "pip3", "install", "playwright"], check=False)
            PLAYWRIGHT_READY = False
            log("[*] Please run 'playwright install' automatically...")
            subprocess.run([shutil.which("playwright") or "playwright", "install"], check=False)
            PLAYWRIGHT_READY = True
            log("[*] Playwright ready. Press Install button again.")
        else:
            PLAYWRIGHT_READY = True
            log("[*] Playwright already installed.")

    DOWNLOAD_COMPLETE = True
    status.set("Press Install button again to continue.")
    log("[*] Downloads complete.")

def run_install(os_name, log, status):
    status.set("Running setup commands...")
    if os_name == "Linux":
        try:
            subprocess.run(["sudo", "waydroid", "init"], check=True)
            subprocess.run(["waydroid", "session", "start"], check=True)
            status.set("Setup complete!")
            log("[*] Waydroid started. Install your APK from the 'usr' folder.")
        except Exception as e:
            log(f"[!] Error running setup: {e}")
    else:
        path = os.path.join(DOWNLOAD_DIR, "bluestacks_installer.exe")
        if os.path.exists(path):
            os.startfile(path)
            status.set("BlueStacks installer launched.")
            log("[*] Open the 'usr' folder to install delta.apk.")
        else:
            log("[!] Installer not found.")

# =========================
# GUI
# =========================
root = tk.Tk()
root.title("ExperienceInstaller")
screen_w = root.winfo_screenwidth()
screen_h = root.winfo_screenheight()
root.geometry(f"{int(screen_w*0.5)}x{int(screen_h*0.7)}")
root.resizable(False, False)

style = ttk.Style()
style.theme_use("clam")
style.configure("TButton", padding=10)
style.configure("Horizontal.TProgressbar", thickness=14)

os_name, distro_name = detect_os()
status_text = tk.StringVar(value=f"Detected OS: {os_name}{':' + distro_name if distro_name else ''}")

frame = ttk.Frame(root, padding=20)
frame.pack(fill="both", expand=True)

ttk.Label(frame, text="ExperienceInstaller", font=("Inter", 18)).pack(anchor="w")
ttk.Label(frame, textvariable=status_text).pack(anchor="w", pady=6)

progress_container = tk.Frame(frame, bg="#444444", bd=0, relief="flat")
progress_container.pack(fill="x", pady=5)

progress = ttk.Progressbar(progress_container, mode="determinate", maximum=100, length=400)
progress.pack(fill="x", pady=2, padx=2)

log_frame = tk.Frame(frame, bg="#2b2b2b", bd=0, relief="flat")
log_frame.pack(fill="both", expand=True, pady=10)

log_box = tk.Text(log_frame, height=12, background="#1e1e1e", foreground="#d0d0d0",
                  relief="flat", bd=0, highlightthickness=0, padx=10, pady=10)
log_box.pack(fill="both", expand=True)

def log(msg):
    log_box.insert("end", msg + "\n")
    log_box.see("end")

def on_install_click():
    if not DOWNLOAD_COMPLETE:
        threading.Thread(target=run_downloads, args=(os_name, log, status_text), daemon=True).start()
    else:
        run_install(os_name, log, status_text)

ttk.Button(frame, text="Install / Continue", command=on_install_click).pack(pady=10)

root.mainloop()
