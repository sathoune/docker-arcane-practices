import fastapi
import pydantic
from fastapi.middleware.cors import CORSMiddleware

from session import initialize_redis


class AppSettings(pydantic.BaseSettings):
    key_name: str


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
    await app.state.redis.set(AppSettings().key_name, message)

    return {"message": "Success"}


@app.get("/key")
async def key():
    return AppSettings().key_name


@app.get("/healtz")
async def healtz():
    return {"status": "ok"}
