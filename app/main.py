from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def root():
        return {"version": "1",
                "status": "running"}
        


