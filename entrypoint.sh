#!/bin/sh
set -e
echo "Starting"
# Remove a potentially pre-existing server.pid for Rails.
rm -rf /home/developer/myapp/tmp/pids/server.pid



# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"