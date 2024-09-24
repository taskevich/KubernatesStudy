from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def main():
    return {"error": False, "message": "OK", "payload": None}
