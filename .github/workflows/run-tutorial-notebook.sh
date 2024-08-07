set -eu
apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  python3-pip \
  && rm -rf /var/lib/apt/lists/*
python3 -m pip install --no-cache-dir papermill
papermill "$1" "$1"
