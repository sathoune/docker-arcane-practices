import fastapi
import pydantic
import requests
from fastapi.middleware.cors import CORSMiddleware

from session import initialize_redis


class AppSettings(pydantic.BaseSettings):
    write_host: str


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


@app.get("/read")
async def read_redis():
    key = requests.get(AppSettings().write_host + "/key").json()
    return await app.state.redis.get(key)
