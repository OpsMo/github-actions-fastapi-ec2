from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def root():
    return {
        "env": os.environ.get("APP_ENV", "unknown"),
        "version": "1",
        "status": "running"
    }


# if __name__ == "__main__":
#     import uvicorn
#     uvicorn.run("main:app", host="0.0.0.0", port=8000)