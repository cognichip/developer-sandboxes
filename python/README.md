# Python Interview Framework

A FastAPI-based CRUDL API service with PostgreSQL database.

## Features

- FastAPI web framework
- Docker containerization
-
## Quick Start

1. **Run the appropriate top level make file:**
   ```bash
   make up-python
   ```

2. **Access the API:**
   - API: http://localhost:8000
   - API Documentation: http://localhost:8000/docs
   - Health Check: http://localhost:8000/health

3. **Database Access:**
   - Host: localhost
   - Port: 5432
   - Database: interview_db
   - User: postgres
   - Password: postgres

## API Endpoints

- `GET /` - Root endpoint with API info
- `GET /health` - Health check


## Example Usage

### Create an item
```bash
curl -X POST http://localhost:8000/health
```


## Development

1. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

2. **Run locally (requires PostgreSQL running):**
   ```bash
   uvicorn app.main:app --reload
   ```
