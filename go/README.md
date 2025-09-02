# Go Interview Framework

## Features

- Chi router
- Docker containerization
- Logs
- Air Hot Reloading and Rebuilding

## Quick Start

1. **Run the appropriate top level make file:**
   ```bash
   make up-go
   ```

2. **Access the API:**
   - API: http://localhost:8001
   - Health Check: http://localhost:8001/health

3. **Database Access:**
   - Host: localhost
   - Port: 5433
   - Database: interview_db
   - User: postgres
   - Password: postgres

## API Endpoints

- `GET /` - Root endpoint 
- `GET /health` - Health check


## Example Usage

### Get Health
```bash
curl -X POST http://localhost:8001/health
```

## Development

1. **Install dependencies:**
   ```bash
   go mod tidy
   ```

2. **Run locally not in container (requires PostgreSQL running):**
   ```bash
   go run main.go
   ```

## Notes

- The Go version uses port 8001 to avoid conflicts with the Python version
- Database runs on port 5433 to avoid conflicts with the Python version
