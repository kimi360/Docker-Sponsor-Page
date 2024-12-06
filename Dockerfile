# Dockerfile for Sponsor-Page based scratch
# Copyright (C) @ 2022-2023 KIMI360 <https://github.com/kimi360>
# Reference URL:
# https://github.com/emikulic/darkhttpd
# https://github.com/Kaiyuan/sponsor-page
# https://github.com/TinyJay/donate-page

# Build environment
FROM alpine:3.21.0 AS build 
ARG STYLE=1
  
WORKDIR /src

# Get static files from github
COPY ./web ./web
RUN mkdir -p /apps/etc \
 && if [ "$STYLE" = 1 ]; then \
      mv web/sample1 /apps/web; \
    elif [ "$STYLE" = 2 ]; then \
      mv web/sample2 /apps/web; \
    fi; 

# Get darkhttpd from docker
COPY --from=kimi360/darkhttpd:1.14 /darkhttpd  /apps/darkhttpd
COPY --from=kimi360/darkhttpd:1.14 /etc/passwd /apps/etc/passwd
COPY --from=kimi360/darkhttpd:1.14 /etc/group  /apps/etc/group

FROM scratch
LABEL maintainer="KIMI360 <https://github.com/kimi360>"
COPY --from=build --chown=0:0 /apps /
EXPOSE 80
ENTRYPOINT ["/darkhttpd","/web", "--chroot", "--uid", "nobody", "--gid", "nobody"]
