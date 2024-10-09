# FanControlX aka supermicro-fan-speed
A script for Supermicro X11 motherboards that set fan speed according to time

Steps:
1. Install ipmi-tools or freeipmi
2. Download script and customize it to your needs
3. Set fans in IPMI webui to FULL SPEED !!!IMPORTANT!!!
4. Set cron

ALPHA - added 09.10.2024
- Dockerfile to build container with ipmitool
- Dockercompose file
- Build command: #docker build -t FanControlX  .
