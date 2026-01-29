#!/usr/bin/env python3

import platform
import subprocess
import sys
import json
import urllib.request
import datetime

RECOVERY_JSON_URL = (
    "https://raw.githubusercontent.com/"
    "ARandomDumDev/ExperienceGui/"
    "refs/heads/Desktop/experiencerecoveryos.json"
)

APP_NAME = "ExperienceRecovery"

# -------------------------
# Logging
# -------------------------
def log(msg):
    ts = datetime.datetime.now().strftime("%H:%M:%S")
    print(f"[{ts}] {msg}", flush=True)

# -------------------------
# Fatal handler
# -------------------------
def fatal(msg):
    log("========================================")
    log("FATAL ISSUE")
    log(msg)
    log("If the issue persists, please contact")
    log("CoolDownExperience via the Discord server.")
    log("========================================")
    sys.exit(1)

# -------------------------
# OS Detection
# -------------------------
def detect_os():
    system = platform.system()
    if system == "Linux":
        try:
            with open("/etc/os-release") as f:
                data = f.read().lower()
            for line in data.splitlines():
                if line.startswith("id="):
                    return "linux", line.split("=", 1)[1].strip().strip('"')
        except Exception:
            return "linux", "unknown"
    elif system == "Windows":
        return "windows", platform.release().lower()
    elif system == "Darwin":
        return "macos", platform.mac_ver()[0]
    return "unknown", "unknown"

# -------------------------
# Fetch recovery list
# -------------------------
def fetch_recovery_os_list():
    log("Fetching recovery compatibility list…")
    try:
        with urllib.request.urlopen(RECOVERY_JSON_URL, timeout=10) as r:
            return json.loads(r.read().decode())
    except Exception as e:
        fatal(f"Failed to load recovery list: {e}")

# -------------------------
# Linux recovery steps
# -------------------------
def recover_linux():
    log("Starting Linux recovery process")

    commands = [
        ["pkexec", "apt", "install", "-y", "git", "dkms", "linux-headers-generic"],
        ["pkexec", "rm", "-rf", "/tmp/anbox-modules"],
        ["git", "clone", "https://github.com/choff/anbox-modules", "/tmp/anbox-modules"],
        ["pkexec", "bash", "-c", "cd /tmp/anbox-modules && ./INSTALL.sh"],
        ["pkexec", "modprobe", "binder_linux"],
        ["pkexec", "modprobe", "ashmem_linux"],
    ]

    for cmd in commands:
        log(f"Running: {' '.join(cmd)}")
        try:
            subprocess.run(cmd, check=True)
        except subprocess.CalledProcessError as e:
            fatal(f"Recovery command failed: {' '.join(cmd)}")

    log("Linux recovery completed successfully")

# -------------------------
# Main
# -------------------------
def main():
    log(f"{APP_NAME} starting")

    os_type, os_id = detect_os()
    log(f"Detected OS: {os_type} ({os_id})")

    recovery_data = fetch_recovery_os_list()

    affected = False
    for entry in recovery_data.get("affected_os", []):
        if entry["os"] == os_type:
            if entry.get("id") in (None, os_id, "any"):
                affected = True
                break

    if not affected:
        log("This system is not affected. No recovery needed.")
        sys.exit(0)

    log("System is affected. Recovery required.")

    if os_type == "linux":
        recover_linux()
    else:
        fatal("Automatic recovery is only supported on Linux.")

    log("Recovery finished. You may now retry installation.")

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        fatal("Recovery interrupted by user")

