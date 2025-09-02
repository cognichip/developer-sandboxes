.PHONY: help up-all up-python up-go down-all down-python down-go logs-python logs-go status clean

# Default target
help:
	@echo "SWE Interview Framework - Make Commands"
	@echo ""
	@echo "Service Management:"
	@echo "  up-all        Start both Python and Go services"
	@echo "  up-python     Start Python service (FastAPI on port 8000)"
	@echo "  up-go         Start Go service (Chi on port 8001)"
	@echo ""
	@echo "  down-all      Stop both services"
	@echo "  down-python   Stop Python service"
	@echo "  down-go       Stop Go service"
	@echo ""
	@echo "Monitoring:"
	@echo "  logs-python   Show Python service logs"
	@echo "  logs-go       Show Go service logs"
	@echo "  status        Show status of all services"
	@echo ""
	@echo "Cleanup:"
	@echo "  clean         Stop all services and remove volumes/networks"
	@echo ""
	@echo "API Endpoints (when running):"
	@echo "  Python API: http://localhost:8000"
	@echo "  Go API:     http://localhost:8001"

# Start all services
up-all: up-python up-go
	@echo "Both Python and Go services are starting..."
	@echo "Python API will be available at: http://localhost:8000"
	@echo "Go API will be available at: http://localhost:8001"

# Start Python service
up-python:
	@echo "Starting Python service..."
	@cd python && docker-compose up -d
	@echo "Python service started on http://localhost:8000"

# Start Go service
up-go:
	@echo "Starting Go service..."
	@cd go && docker-compose up -d
	@echo "Go service started on http://localhost:8001"

# Stop all services
down-all: down-python down-go
	@echo "All services stopped"

# Stop Python service
down-python:
	@echo "Stopping Python service..."
	@cd python && docker-compose down
	@echo "Python service stopped"

# Stop Go service
down-go:
	@echo "Stopping Go service..."
	@cd go && docker-compose down
	@echo "Go service stopped"

# Show logs for Python service
logs-python:
	@echo "Python service logs:"
	@cd python && docker-compose logs -f

# Show logs for Go service
logs-go:
	@echo "Go service logs:"
	@cd go && docker-compose logs -f

# Show status of all services
status:
	@echo "=== Python Services ==="
	@cd python && docker-compose ps 2>/dev/null || echo "Python services not running"
	@echo ""
	@echo "=== Go Services ==="
	@cd go && docker-compose ps 2>/dev/null || echo "Go services not running"

# Clean up everything (stop services and remove volumes)
clean:
	@echo "Cleaning up all services, volumes, and networks..."
	@cd python && docker-compose down -v --remove-orphans 2>/dev/null || true
	@cd go && docker-compose down -v --remove-orphans 2>/dev/null || true
	@docker system prune -f --volumes 2>/dev/null || true
	@echo "Cleanup completed"

# Development helpers
dev-python: up-python logs-python

dev-go: up-go logs-go


build-all:
	cd python && docker-compose build
	cd go && docker-compose build

build-python:
	cd python && docker-compose build

build-go:
	cd go && docker-compose build