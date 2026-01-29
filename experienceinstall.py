import platform
import threading
import os
import subprocess
import tkinter as tk
from tkinter import ttk, messagebox
import requests

# =========================
# CONFIG
# =========================
URLS = {
    "Windows": {
        "bluestacks": "https://cloud.bluestacks.com/api/getdownloadnow?platform=win&win_version=&mac_version=&client_uuid=39a7afcc-87d3-4e7b-b129-6e138816c50c&app_pkg=nxt_n64&platform_cloud=&preferred_lang=en&utm_source=&utm_medium=&gaCookie=&gclid=&clickid=&msclkid=&affiliateId=&offerId=&transaction_id=&aff_sub=&referrer=&first_landing_page=&download_page_referrer=https%3A%2F%2Fwww.bluestacks.com%2Fdownload.html&utm_campaign=download-en&user_id=&exit_utm_campaign=nxt-bs5-n64_button_download_page-en&incompatible=false&bluestacks_version=bs5&device_memory=undefined&device_cpu_cores=22&extra_data=%7B%22deviceDetails%22%3A%22unix%22%2C%22renderer%22%3A%22Intel(R)%20HD%20Graphics%2C%20or%20similar%22%7D",
        "apk": "https://delta.filenetwork.vip/file/Delta-2.704.1060-02.apk"
    },
    "Linux": {
        "waydroid_iso": "https://sourceforge.net/projects/blissos-dev/files/latest/download",
        "apk": "https://delta.filenetwork.vip/file/Delta-2.704.1060-02.apk"
    }
}

DOWNLOAD_DIR = "ExperienceSetup/temp"
USR_DIR = "ExperienceSetup/usr"

INSTRUCTIONS = {
    "Windows": {
        "title": "How to finish setup on Windows",
        "text": (
            "1. Open the 'temp' folder and run the BlueStacks installer.\n"
            "2. Follow the on-screen prompts to complete the installation.\n"
            "3. After installation, BlueStacks will launch automatically.\n"
            "4. Open the 'usr' folder to find your APK.\n"
            "5. Drag & drop the APK into BlueStacks or install via its interface."
        )
    },
    "Linux": {
        "title": "How to finish setup on Linux (Waydroid)",
        "text": (
            "1. Open the 'temp' folder and locate the Waydroid ISO or .deb file.\n"
            "2. Install Waydroid using your package manager, e.g., 'sudo apt install waydroid'.\n"
            "3. Run 'sudo waydroid init' to initialize the container.\n"
            "4. Start Waydroid with 'sudo systemctl start waydroid-container' and 'waydroid session start'.\n"
            "5. Open the 'usr' folder to find your APK.\n"
            "6. Install the APK inside Waydroid using 'waydroid app install <apk>' or via the GUI."
        )
    }
}

RUN_COMMANDS = {
    "Windows": os.path.join(DOWNLOAD_DIR, "bluestacks_installer.exe"),
    "Linux": "sudo waydroid init"
}

FORCE_INSTALL = False  # Admin override flag

# =========================
# OS / Distro DETECTION
# =========================
def detect_os_and_distro():
    system = platform.system()
    desktop_env = None
    if system == "Linux":
        desktop_env = os.environ.get("XDG_CURRENT_DESKTOP", "").lower()
        if desktop_env and "kde" in desktop_env:
            desktop_env = "kde"
    return system, desktop_env

# =========================
# DOWNLOAD FUNCTION
# =========================
def download_file(url, output, progress_cb, log_cb):
    r = requests.get(url, stream=True)
    total = int(r.headers.get("content-length", 0))
    downloaded = 0
    with open(output, "wb") as f:
        for chunk in r.iter_content(8192):
            if chunk:
                f.write(chunk)
                downloaded += len(chunk)
                percent = int((downloaded / total) * 100) if total else 0
                progress_cb(percent)
    log_cb(f"Finished downloading {os.path.basename(output)}")

# =========================
# INSTALL PROCESS
# =========================
def run_install(os_name, desktop_env, log, status, progress):
    os.makedirs(DOWNLOAD_DIR, exist_ok=True)
    os.makedirs(USR_DIR, exist_ok=True)

    status.set("please approve and put your password")
    log("Waiting for user approval")

    tasks = []

    if os_name == "Windows":
        tasks = [
            ("BlueStacks", URLS["Windows"]["bluestacks"], os.path.join(DOWNLOAD_DIR, "bluestacks_installer.exe")),
            ("APK", URLS["Windows"]["apk"], os.path.join(USR_DIR, "app.apk"))
        ]
    elif os_name == "Linux" and desktop_env == "kde":
        tasks = [
            ("Waydroid ISO", URLS["Linux"]["waydroid_iso"], os.path.join(DOWNLOAD_DIR, "waydroid.iso")),
            ("APK", URLS["Linux"]["apk"], os.path.join(USR_DIR, "app.apk"))
        ]
    elif FORCE_INSTALL:
        log("Force install enabled: skipping OS check")
        tasks = [
            ("Generic Installer", URLS.get(os_name, {}).get("bluestacks", ""), os.path.join(DOWNLOAD_DIR, "installer.bin")),
            ("APK", URLS.get(os_name, {}).get("apk", ""), os.path.join(USR_DIR, "app.apk"))
        ]
    else:
        log("Unsupported OS/desktop environment, aborting.")
        messagebox.showerror(
            "Unsupported",
            "Sorry unsupported distro. Come back when your distro is supported."
        )
        return

    for name, url, path in tasks:
        if not url:
            log(f"No download URL for {name}, skipping.")
            continue
        status.set(f"Installing {name.lower()}…")
        log(f"Downloading {name}")
        download_file(url, path, lambda p: progress.configure(value=p), log)
        progress.configure(value=0)

    status.set("Installation complete")
    log("All downloads finished")
    show_instructions(os_name)

# =========================
# INSTRUCTIONS GUI
# =========================
def show_instructions(os_name):
    data = INSTRUCTIONS.get(os_name, {
        "title": "Instructions",
        "text": "No specific instructions available. Use your own installer."
    })

    instr_window = tk.Toplevel()
    instr_window.title(data["title"])
    instr_window.geometry("500x350")

    tk.Label(instr_window, text=data["title"], font=("Inter", 14, "bold")).pack(pady=10)

    text_widget = tk.Text(instr_window, wrap="word", height=12, background="#f0f0f0", bd=5)
    text_widget.insert("1.0", data["text"])
    text_widget.configure(state="disabled")
    text_widget.pack(fill="both", expand=True, padx=10, pady=5)

    def open_usr():
        folder_path = os.path.abspath(USR_DIR)
        if platform.system() == "Windows":
            os.startfile(folder_path)
        else:
            subprocess.Popen(["xdg-open", folder_path])

    tk.Button(instr_window, text="Open usr folder", command=open_usr, font=("Inter", 12, "bold")).pack(pady=5)

    # Run setup button
    def run_command():
        cmd = RUN_COMMANDS.get(os_name)
        if FORCE_INSTALL:
            cmd = os.path.join(DOWNLOAD_DIR, "installer.bin")
        if not cmd:
            messagebox.showwarning("No command", "No run command defined for this OS.")
            return

        # Popup for password input
        def execute_with_password():
            password = password_entry.get()
            popup.destroy()
            try:
                if platform.system() == "Windows":
                    subprocess.Popen(cmd, shell=True)
                else:
                    subprocess.run(['sudo', '-S'] + cmd.split(), input=f"{password}\n", text=True, check=True)
                messagebox.showinfo("Success", "Command executed. Check terminal if needed.")
            except subprocess.CalledProcessError:
                messagebox.showerror("Error", "Failed to execute command. Make sure the password and permissions are correct.")

        popup = tk.Toplevel()
        popup.title("Superuser Password")
        popup.geometry("300x120")
        tk.Label(popup, text="Enter your superuser password:", font=("Inter", 12)).pack(pady=10)
        password_entry = tk.Entry(popup, show="*", width=25)
        password_entry.pack(pady=5)
        tk.Button(popup, text="Run Command", bg="#1e90ff", fg="#ffffff",
                  font=("Inter", 11, "bold"), command=execute_with_password).pack(pady=5)

    tk.Button(instr_window, text="Run Setup Command", bg="#1e90ff", fg="#ffffff",
              font=("Inter", 12, "bold"), command=run_command).pack(pady=10)

# =========================
# MAIN GUI
# =========================
root = tk.Tk()
root.title("ExperienceInstaller")
root.geometry("500x450")
root.resizable(False, False)

style = ttk.Style()
style.theme_use("clam")
style.configure("TButton", padding=10)
style.configure("Horizontal.TProgressbar", thickness=14)

os_name, desktop_env = detect_os_and_distro()
status_text = tk.StringVar(value=f"Detected OS: {os_name}, Desktop: {desktop_env or 'Unknown'}")

frame = ttk.Frame(root, padding=20)
frame.pack(fill="both", expand=True)

ttk.Label(frame, text="ExperienceInstaller", font=("Inter", 16)).pack(anchor="w")
ttk.Label(frame, textvariable=status_text).pack(anchor="w", pady=6)

# Rounded progress bar container
progress_container = tk.Frame(frame, bg="#444444", bd=0, relief="flat")
progress_container.pack(fill="x", pady=5)

progress = ttk.Progressbar(progress_container, mode="determinate", maximum=100, length=400)
progress.pack(fill="x", pady=2, padx=2)

# Rounded log frame
log_frame = tk.Frame(frame, bg="#2b2b2b", bd=0, relief="flat")
log_frame.pack(fill="both", expand=True, pady=10)

log_box = tk.Text(log_frame, height=8, background="#1e1e1e", foreground="#d0d0d0",
                  relief="flat", bd=0, highlightthickness=0, padx=10, pady=10)
log_box.pack(fill="both", expand=True)

def log(msg):
    log_box.insert("end", msg + "\n")
    log_box.see("end")

def start_install():
    if not FORCE_INSTALL and not ((os_name == "Windows") or (os_name == "Linux" and desktop_env == "kde")):
        messagebox.showerror(
            "Unsupported",
            "Sorry unsupported distro. Come back when your distro is supported."
        )
        log("Unsupported OS/desktop environment, aborting.")
        return

    if not messagebox.askyesno(
        "Confirm",
        f"Detected OS: {os_name}\nDetected desktop: {desktop_env or 'N/A'}\nIs this correct?"
    ):
        log("Installation canceled by user.")
        return

    threading.Thread(
        target=run_install,
        args=(os_name, desktop_env, log, status_text, progress),
        daemon=True
    ).start()

ttk.Button(frame, text="Start Installation", command=start_install).pack(pady=10)

# =========================
# HIDDEN ADMIN EASTER EGG
# =========================
secret_input = ""

def show_admin_panel():
    admin_window = tk.Toplevel()
    admin_window.title("Randomatic Studios Admin Panel")
    admin_window.geometry("400x300")

    tk.Label(admin_window, text="ADMIN MODE ACTIVE", font=("Inter", 14, "bold")).pack(pady=10)
    tk.Text(admin_window, height=12, background="#000000", foreground="#00ff00").pack(fill="both", expand=True, padx=10, pady=5)
    tk.Label(admin_window, text="Force install enabled! OS checks bypassed.", font=("Inter", 12)).pack(pady=5)

def on_secret_key(event):
    global secret_input, FORCE_INSTALL
    secret_input += event.char
    if secret_input.endswith("RandomaticStudiosADMIN"):
        secret_input = ""
        FORCE_INSTALL = True
        messagebox.showinfo("Admin Access", "Secret admin mode activated! OS checks bypassed.")
        show_admin_panel()

# Invisible label in bottom-left corner
secret_label = tk.Label(root, text="", width=2, height=1)
secret_label.place(x=0, y=root.winfo_height()-20)
secret_label.bind("<Key>", on_secret_key)
secret_label.focus_set()

root.mainloop()


