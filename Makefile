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

build:
	mkdocs build && \
	sudo chown -R 911:1000 ../site/ && \
	rsync -avzzpP --delete ../site/ root@meanderingmind.me:/srv/nginx/config/www/meanderingmind/ && \
	sudo rm -rfv ../site/
