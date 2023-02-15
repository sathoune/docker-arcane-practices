FROM --platform=linux/amd64 python:3.11-slim
WORKDIR app
RUN apt-get update
RUN apt-get install -y curl

RUN pip install fastapi uvicorn redis

COPY . .

CMD ["uvicorn", "main:c", "--host", "0.0.0.0", "--port", "8000"]
