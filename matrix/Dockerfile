FROM python:3.9-slim

WORKDIR /app

COPY ../../docker/matrix/webhook/requirements.txt ./

RUN apt-get update && apt-get install -y cmake

RUN set -x \
    && pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

ENV PYTHONUNBUFFERED=1
ENV LOGIN_STORE_PATH=/config

COPY ../../docker/matrix/webhook/docker-entrypoint.sh ./
ENTRYPOINT [ "./docker-entrypoint.sh" ]

COPY ../../docker/matrix/webhook/src/ ./src/