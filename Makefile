# SPDX-License-Identifier: GPL-3.0-or-later

.PHONY: init-shared dev build preview

init-shared:
	scripts/init-shared.sh

dev: init-shared
	npx react-router dev --no-typescript

build: init-shared
	npx react-router build --no-typescript

preview:
	npx vite preview
