# Flask App Auto Deployment Tool 🚀

This project contains an automation script that installs and deploys a Flask-based web application behind an NGINX reverse proxy on a Linux machine.

---

## 📦 Project Overview

**Script Name:** `deploy.sh`  
**Developed by:** shay.l  
**Date:** 05/04/2025  
**Version:** 0.0.1  
**Purpose:** Automate deployment of Flask web app with NGINX reverse proxy

---

## ⚙️ What the Script Does

The `deploy.sh` script automates the following tasks:

### ✅ 1. Software Installation
Installs all required software packages:
- `vim` – for basic file editing
- `git` – for cloning the project from GitHub
- `nginx` – used as the reverse proxy server

### ✅ 2. NGINX Configuration
Configures NGINX to act as a reverse proxy to the Flask app running on port 5000.
- Modifies /etc/nginx/sites-available/default
- Sets up proxy headers
- Reloads NGINX to apply changes

### ✅ 3. Environment Setup and App Deployment
- Creates a new projects/ folder under the current user
- Clones the Flask app from GitHub: https://github.com/shayle664/flask_example
- Creates and activates a Python virtual environment
- Installs Flask and gunicorn
- Starts the Flask app using Gunicorn on port 5000 in the background

### 🔁 How to Use
#### Prerequisites:
- Ubuntu or Debian-based Linux system
- Python 3.x installed

Run the Script:
```bash
chmod +x deploy.sh
sudo ./deploy.sh
```
You need to run it with sudo because it modifies system files like NGINX configs.
if sudo not working try to connect as administrator(sudo su) and then run
