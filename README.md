# Developer Sandboxes
Empty Golang, Python and React Dockerized projects for use in developer 

## Project Structure

```
developer-sandboxes/
├── python/          # Python implementation with FastAPI
└── go/             # Go implementation with Gin
```

Each implementation includes:
- Docker Compose configuration
- Complete containerization

## Quick Start

All services can now be managed using make commands from the root directory:

### Start All Services
```bash
make up-all
```

### Start Individual Services
```bash
# Python service (FastAPI on port 8000)
make up-python

# Go service (Gin on port 8001)
make up-go
```

### View Available Commands
```bash
make help
```

## Make Commands

| Command | Description |
|---------|-------------|
| `make up-all` | Start both Python and Go services |
| `make up-python` | Start Python service (port 8000) |
| `make up-go` | Start Go service (port 8001) |
| `make down-all` | Stop both services |
| `make down-python` | Stop Python service |
| `make down-go` | Stop Go service |
| `make logs-python` | Show Python service logs |
| `make logs-go` | Show Go service logs |
| `make status` | Show status of all services |
| `make clean` | Stop all services and remove volumes |


## Development

For development with live log monitoring:
```bash
make dev-python  # Start Python service with logs
make dev-go      # Start Go service with logs
```

See individual README files in each directory for language-specific development instructions.
