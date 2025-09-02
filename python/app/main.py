from fastapi import FastAPI

app = FastAPI(
    title="Developer Sandbox",
    description="A Basic Python Application in a Docker Container",
    version="1.0.0"
)

@app.get("/")
def read_root():
    return {"message": "Python Developer Sandbox", "version": "1.0.0"}

@app.get("/health")
def health_check():
    return {"status": "healthy"}
