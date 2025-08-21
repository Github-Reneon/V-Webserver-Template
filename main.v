module main

import veb

pub struct Context {
	veb.Context
pub mut:
	// Add any additional fields needed for your context
}

pub struct App {
	veb.StaticHandler
pub mut:
	templates map[string]string
pub:
	// Add any fields needed for your application
	message string
}

fn main() {
	mut app := &App{
		message: 'Welcome to the Veb application!'
	}

	app.load_templates('./templates/*.html')

	app.handle_static('static', true)!

	veb.run[App, Context](mut app, 8080)
}
