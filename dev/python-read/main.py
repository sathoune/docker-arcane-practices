import fastapi

from session import initialize_redis

app = fastapi.FastAPI()


@app.on_event("startup")
async def startup_event():
    app.state.redis = await initialize_redis()


@app.get("/read")
async def read_redis():
    return await app.state.redis.get("message")
