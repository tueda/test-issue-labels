# syntax=docker/dockerfile:1

FROM ubuntu:20.04 AS builder
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    gcc \
    libc6-dev \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /opt/bin
RUN --mount=type=bind,source=increment.c,target=increment.c gcc -Wall -Wextra -o increment increment.c

FROM ubuntu:20.04 AS py_builder
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*
RUN python3 -m pip install --no-cache-dir \
    jupyterlab

FROM ubuntu:20.04 AS runner
COPY --from=builder /opt/bin/increment /opt/bin/increment
COPY --from=py_builder /usr/local/bin /usr/local/bin
COPY --from=py_builder /usr/local/lib /usr/local/lib
COPY --from=py_builder /usr/local/etc/jupyter /usr/local/etc/jupyter
COPY --from=py_builder /usr/local/share/jupyter /usr/local/share/jupyter
ENV PATH=/opt/bin:$PATH
