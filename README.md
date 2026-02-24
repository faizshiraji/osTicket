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