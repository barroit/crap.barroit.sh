# SPDX-License-Identifier: GPL-3.0-or-later

SHARED_DIR  := shared/styles shared/react
INIT_SHARED := scripts/init-shared.sh

LIVE := npx react-router dev --no-typescript $(VITE_HOST)

BUNDLE := npx react-router build --no-typescript
