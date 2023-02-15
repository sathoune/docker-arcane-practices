import pydantic
import redis.asyncio as redis


class RedisSettings(pydantic.BaseSettings):
    redis_url: str = "redis://redis:6379/0"


async def initialize_redis() -> redis.Redis:
    return await redis.from_url(
        RedisSettings().redis_url,
        encoding="utf-8",
        decode_responses=True,
    )
