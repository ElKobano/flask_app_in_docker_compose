FROM python:3.6-alpine

ARG APK_PACKAGES="postgresql build-base libpq-dev"

COPY . /app

RUN set -ex && \
    addgroup app && adduser -S app -G app && \
    apk add --update --no-cache $APK_PACKAGES && \
    chown -R app:app /app

USER app

WORKDIR /app

RUN pip3 install -r requirements.txt && \
    pip3 cache purge

EXPOSE 8000

ENV FLASK_APP=src/app.py

ENTRYPOINT ./start_app.sh
