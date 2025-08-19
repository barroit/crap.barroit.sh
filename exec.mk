# SPDX-License-Identifier: GPL-3.0-or-later

shared += shared/react

LIVE   := npx react-router dev --no-typescript $(host_opt)
BUNDLE := npx react-router build --no-typescript
