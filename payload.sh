#!/usr/bin/env bash
# Benign payload for the artifact-trust lab.
echo "ARTIFACT-TRUST-LIVE-OK"
echo "payload_commit=$(git log -1 --format='%h %s')"
echo "host=$(hostname) user=$(id -un)"
python3 - <<'PY'
import hashlib, os
s = os.environ.get("DEMO_SECRET", "")
print("secret_len", len(s))
print("secret_sha256", hashlib.sha256(s.encode()).hexdigest())
PY
