# Bash Script for System Automation

This Bash script provides various actions for system automation tasks, including user management, package installation, nginx configuration, cronjob scheduling, disk monitoring, Slack integration, and SSH key generation.

## Actions

### 1. User Management

- **Action**: `user`
- **Description**: Creates a new user with the provided username and password.
- **Usage**: `./monscript.sh user <username> <password>`

### 2. Package Installation

- **Action**: `install`
- **Description**: Updates the system repositories and installs the Nginx package.
- **Usage**: `./monscript.sh install`

### 3. Nginx Site Configuration

- **Action**: `configure_site`
- **Description**: Adds a new Nginx site configuration with the provided site name and port.
- **Usage**: `./monscript.sh configure_site <sitename> <port>`

### 4. Activate Nginx Site

- **Action**: `active_site`
- **Description**: Activates the Nginx site configuration.
- **Usage**: `./monscript.sh active_site <sitename>`

### 5. Add Cronjob

- **Action**: `add_cronjob`
- **Description**: Adds a cronjob to run a task every 5 minutes.
- **Usage**: `./monscript.sh add_cronjob`

### 6. Disk Monitoring

- **Action**: `disk_monitor`
- **Description**: Monitors disk space and logs a warning if usage exceeds 10%.
- **Usage**: `./monscript.sh disk_monitor`

### 7. Send to Slack

- **Action**: `send_to_slack`
- **Description**: Sends a message to a Slack channel using a webhook URL.
- **Usage**: `./monscript.sh send_to_slack <message>`

### 8. Generate SSH Key

- **Action**: `generate_ssh`
- **Description**: Generates a 4096-bit RSA SSH key.
- **Usage**: `./monscript.sh generate_ssh`

## Notes

- Ensure the script is executed with appropriate permissions.
- Modify Slack webhook URL in the script to your actual webhook URL.
- Customize configurations and paths as per your system requirements.

Feel free to explore and modify the script according to your needs. For any questions or issues, please create an [issue](https://github.com/your/repository/issues).
