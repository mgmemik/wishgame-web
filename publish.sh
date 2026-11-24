#!/bin/zsh
# Publishes this folder to https://mgmemik.github.io/wishgame-web/ (public repo + GitHub Pages).
set -euo pipefail
cd "${0:A:h}"
if ! gh repo view mgmemik/wishgame-web >/dev/null 2>&1; then
  gh repo create mgmemik/wishgame-web --public --source . --push \
    --description "Forum Wish Game: yarış kuralları, gizlilik, katılım koşulları ve destek"
  gh api -X POST repos/mgmemik/wishgame-web/pages -f 'source[branch]=main' -f 'source[path]=/' >/dev/null
else
  git push -u origin main
fi
echo "OK: https://mgmemik.github.io/wishgame-web/ (Pages ilk yayında 1-2 dakika sürer)"
