import pydantic
import redis.asyncio as redis


class RedisSettings(pydantic.BaseSettings):
    redis_host: str


async def initialize_redis() -> redis.Redis:
    return await redis.from_url(
        f"redis://{RedisSettings().redis_host}/0",
        encoding="utf-8",
        decode_responses=True,
    )
