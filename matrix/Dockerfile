FROM python:3.9-slim

WORKDIR /app
COPY ./matrix-webhook/* ./

RUN apt-get update && apt-get install -y cmake

RUN set -x \
    && pip install --no-cache-dir -r ./requirements.txt

EXPOSE 8000

ENV PYTHONUNBUFFERED=1
ENV LOGIN_STORE_PATH=/config

ENTRYPOINT [ "./docker-entrypoint.sh" ]