FROM alpine:3.16
WORKDIR /images/
RUN apk update && apk add wget
COPY file.sh .
ENTRYPOINT ["/images/file.sh"]
