/* SPDX-License-Identifier: GPL-3.0-or-later */
/*
 * Copyright 2025 Jiamu Sun <barroit@linux.com>
 */

import { defineConfig } from 'vite'
import devtoolsJson from 'vite-plugin-devtools-json'
import { reactRouter } from '@react-router/dev/vite'
import tailwindcss from '@tailwindcss/vite'

import no_nuke from './scripts/no-nuke.js'

export default defineConfig({
	plugins: [
		devtoolsJson(),
		reactRouter(),
		tailwindcss(),
		no_nuke(),
	],
	publicDir: 'assets',
	build: {
		outDir: 'build',
	},
})
