# Dockerfile for ariang based scratch
# Copyright (C) @ 2022 KIMI360 <https://github.com/kimi360>
# Reference URL:
# https://github.com/emikulic/darkhttpd
# https://github.com/mayswind/AriaNg-DailyBuild AriaNG
# https://github.com/chrisaxiom/docker-health-check

# Build environment
FROM alpine:3.17.0 AS build 
ARG STYLE=1

RUN apk add --no-cache \
  build-base=~0.5 \
  git=~2.38.2
  
WORKDIR /src
RUN git clone https://github.com/emikulic/darkhttpd .
COPY ./web ./web

# Hardening GCC opts taken from these sources:
# https://developers.redhat.com/blog/2018/03/21/compiler-and-linker-flags-gcc/
# https://security.stackexchange.com/q/24444/204684
ENV CFLAGS=" \
  -static                                 \
  -O2                                     \
  -flto                                   \
  -D_FORTIFY_SOURCE=2                     \
  -fstack-clash-protection                \
  -fstack-protector-strong                \
  -pipe                                   \
  -Wall                                   \
  -Werror=format-security                 \
  -Werror=implicit-function-declaration   \
  -Wl,-z,defs                             \
  -Wl,-z,now                              \
  -Wl,-z,relro                            \
  -Wl,-z,noexecstack                      \
"
RUN make darkhttpd-static \
 && strip darkhttpd-static \
 && mkdir -p /apps/etc \
 && mv darkhttpd-static /apps/darkhttpd \
 && mv passwd /apps/etc \
 && mv group /apps/etc \ 
 && if [ "$STYLE" = 1 ]; then \
      mv web/sample1 /apps/web; \
    elif [ "$STYLE" = 2 ]; then \
      mv web/sample2 /apps/web; \
    fi; 

FROM scratch
LABEL maintainer="KIMI360 <https://github.com/kimi360>"
COPY --from=build --chown=0:0 /apps /
EXPOSE 80
ENTRYPOINT ["/darkhttpd","/web", "--chroot", "--uid", "nobody", "--gid", "nobody"]
