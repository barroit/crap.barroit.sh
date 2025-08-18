/* SPDX-License-Identifier: GPL-3.0-or-later */
/*
 * Copyright 2025 Jiamu Sun <barroit@linux.com>
 */

import { execSync } from 'node:child_process'

function prebuild()
{
	execSync('make init-shared', { stdio: 'inherit' })
}

export default function no_nuke()
{
	return {
		name:    'No Fucking Nuke',
		version: '0.0.39',

		buildStart: prebuild,
	}
}
