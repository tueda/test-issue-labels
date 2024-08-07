# NOTE: this is intended to be invoked within a container.
set -eu
notebook_file=$1
apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  python3-pip \
  && rm -rf /var/lib/apt/lists/*
python3 -m pip install --no-cache-dir papermill
papermill "$notebook_file" "$notebook_file"
