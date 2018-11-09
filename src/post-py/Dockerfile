FROM python:3.6.0-alpine
WORKDIR /app
ADD . /app
RUN apk --update add gcc musl-dev && pip install -r /app/requirements.txt
ENV POST_DATABASE_HOST post_db
ENV POST_DATABASE posts
CMD ["python3", "post_app.py"]
