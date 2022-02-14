#!/bin/sh

set -e

cd /code

. `poetry env info -p`/bin/activate

exec "$@"
