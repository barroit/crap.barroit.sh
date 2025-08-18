/* SPDX-License-Identifier: GPL-3.0-or-later */
/*
 * Copyright 2025 Jiamu Sun <barroit@linux.com>
 */

import { isRouteErrorResponse,
	 Links,
	 Meta,
	 Outlet,
	 Scripts,
	 ScrollRestoration,
} from 'react-router'

// import './index.css'

export function Layout({ children })
{
return (
<html lang='en'>
  <head>
    <meta charSet='utf-8'/>
    <meta name='viewport' content='width=device-width, initial-scale=1'/>
    <Meta/>
    <link rel='icon' sizes='32x32'   href='/favicon-32.png'/>
    <link rel='icon' sizes='192x192' href='/favicon-192.png'/>
    <link rel='icon' sizes='512x512' href='/favicon-512.png'/>
    <link rel='apple-touch-icon' sizes='180x180' href='/favicon-180.png'/>
    <Links/>
  </head>
  <body>
    { children }
    <ScrollRestoration/>
    <Scripts/>
  </body>
</html>
) /* return */
}

export default function App()
{
	return <Outlet/>
}

export function ErrorBoundary({ error })
{
	let message = 'Oops!'
	let details = 'An unexpected error occurred.'
	let stack

	if (isRouteErrorResponse(error)) {
		if (error.status == 404) {
			message = '404'
			details = 'The requested page could not be found.'
		} else {
			message = 'Error'
			details = error.statusText || details
		}

	} else if (import.meta.env.DEV && error && error instanceof Error) {
		details = error.message
		stack = error.stack
	}

return (
<main className='pt-16 p-4 container mx-auto'>
  <h1>{ message }</h1>
  <p>{ details }</p>
{stack && (
  <pre className='w-full p-4 overflow-x-auto'>
    <code>{ stack }</code>
  </pre>
)}
</main>
) /* return */
}
