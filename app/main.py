from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def root():
        return {"version": "1",
                "status": "running"}
        
            # return {"message": "FastAPI app workflow deployment Demo",
    #         "version": "v1",
    #         "status": "running"}


