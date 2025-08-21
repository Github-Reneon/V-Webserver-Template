module main

import veb

@[get]
pub fn (app &App) index(mut ctx Context) veb.Result {
	return ctx.html(app.templates['index.html'] or { 
		panic('Template not found: index.html') 
	})
}

@[get; '/other-page']
pub fn (app &App) other_page(mut ctx Context) veb.Result {
	return ctx.html(app.templates['other-page.html'] or { 
		panic('Template not found: other-page.html') 
	})
}
