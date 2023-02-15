import fastapi
from fastapi.middleware.cors import CORSMiddleware

from session import initialize_redis

app = fastapi.FastAPI()

c = CORSMiddleware(
    app,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)
@app.on_event("startup")
async def startup_event():
    app.state.redis = await initialize_redis()


@app.get("/write")
async def write_redis(message: str):
    await app.state.redis.set("message", message)

    return {"message": "Success"}
