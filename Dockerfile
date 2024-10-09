# Use a base image with bash and cron support
FROM ubuntu:latest

# Install required packages: cron for scheduling and ipmitool for IPMI commands
RUN apt-get update && \
    apt-get install -y cron ipmitool && \
    apt-get clean

# Copy the fan control script into the container
COPY script.sh /root/change_fan_speed.sh

# Make sure the script is executable
RUN chmod +x /root/change_fan_speed.sh

# Create a cron job entry to run the script every hour
RUN echo "0 * * * * /root/change_fan_speed.sh >> /var/log/cron.log 2>&1" > /etc/cron.d/fan_control

# Give execution rights to the cron job file
RUN chmod 0644 /etc/cron.d/fan_control

# Apply the cron job
RUN crontab /etc/cron.d/fan_control

# Create a log file to allow tailing logs later
RUN touch /var/log/cron.log

# Start cron service and tail the log to keep the container running
CMD cron && tail -f /var/log/cron.log
