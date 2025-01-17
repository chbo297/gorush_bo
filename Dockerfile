FROM alpine:3.15.4@sha256:a777c9c66ba177ccfea23f2a216ff6721e78a662cd17019488c417135299cd89

LABEL maintainer="Bo-Yi Wu <appleboy.tw@gmail.com>" \
  org.label-schema.name="Gorush" \
  org.label-schema.vendor="Bo-Yi Wu" \
  org.label-schema.schema-version="1.0"

RUN apk add --no-cache ca-certificates mailcap && \
	echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

COPY release/linux/amd64/gorush /bin/

EXPOSE 8088 8089
HEALTHCHECK --start-period=1s --interval=10s --timeout=5s \
  CMD ["/bin/gorush", "--ping"]

ENTRYPOINT ["/bin/gorush"]
