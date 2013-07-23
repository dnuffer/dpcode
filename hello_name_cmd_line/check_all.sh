#!/bin/sh
find . -mindepth 1 -maxdepth 1 -type d -print0 | xargs -0 -I '{}' /bin/sh -c 'cd {}; make check-solution >/dev/null 2>/dev/null || echo "Failed in {}";'
