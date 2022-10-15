FROM alpine:3.16
WORKDIR /srv/
RUN apk add --no-cache python3 py3-pip && pip install flask==2.2.2 psycopg2-binary==2.9.4 configparser==5.3.0
COPY app/ app/
CMD ["python3", "/srv/app/web.py"]
