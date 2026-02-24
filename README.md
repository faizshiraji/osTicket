# osTicket 1.17.7 Docker Deployment

Dockerized osTicket v1.17.7 running on PHP 8.2 (Apache Bookworm).

---

## Requirements

- Docker 24+
- Docker Compose v2+
- External MySQL / MariaDB database

---

## Quick Start

```bash
git clone https://github.com/faizshiraji/osTicket.git
cd osTicket
docker compose up -d --build

Access in browser:

http://localhost:8085

Database Configuration

During installation, use your own database instance:
	•	Database Host: <your-db-host>
	•	Database Name: <your-db-name>
	•	Database User: <your-db-user>
	•	Database Password: <your-db-password>

Make sure:
	•	Port 3306 is accessible from Docker network
	•	MySQL user allows remote connections

Persistent Data

This project uses Docker volumes:
	•	osticket_config → Stores include/ost-config.php
	•	osticket_attachments → Stores ticket attachments

Your configuration and uploaded files will survive container restarts.

Important Notes
	•	Do NOT remove the setup/ directory before installation.
	•	After installation (production environments only), remove:

	•	Command to remove 'setup' folder

        docker exec -it osticket_app rm -rf /var/www/html/setup

	•	To rebuild container:

        docker compose down
        docker compose up -d --build

