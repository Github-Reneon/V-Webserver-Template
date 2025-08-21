module main

import os


/*
 * Load templates from the specified path.
 * This function reads all HTML files in the given path and stores their content in the templates map.
*/
pub fn (mut app App) load_templates(path string) {
	
	files := os.glob(os.abs_path(path)) or { panic(err) }

	for _, entry in files {
		// Skip directories and non-file entries
		if !os.is_file(entry) {
			println('Skipping non-file: $entry')
			continue
		}
		if os.file_ext(entry) != '.html' {
			println('Loading template: $entry')
			continue
		}

		// Read the file content and store it in the templates map
		content := os.read_file(entry) or { panic(err) }
		filename := os.file_name(entry)
		app.templates[filename] = content
	}

	app.read_out_templates()
}

/*
 * Read out templates for debugging purposes.
 * This function prints the names of all loaded templates to the console.
*/
pub fn (mut app App) read_out_templates() {
	// Print loaded templates for debugging
	for k, _ in app.templates {
		println('Loaded template: $k')
	}
}