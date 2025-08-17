# SPDX-License-Identifier: GPL-3.0-or-later

.PHONY: init-shared live build preview deploy

live:

init-shared:
	scripts/init-shared.sh

live: init-shared
	npx react-router dev --no-typescript

build: init-shared
	npx react-router build --no-typescript

preview: build
	npx wrangler dev

deploy: build
	npx wrangler deploy
