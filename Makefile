# Minimal makefile
#
# instructs make to invoke a single instance of the shell and provide it with the entire recipe,
# regardless of how many lines it contains.
.ONESHELL:

.install:
	uv install

.Phony: debug
debug:
	source .venv/bin/activate && \
	mkdocs serve --livereload
