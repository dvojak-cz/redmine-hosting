# run make in diffren direcory

.phony: root nginx clean

all: root nginx pg

root:
	@make -C conf/ssl ssl

nginx:
	@make -C docker/worker/conf/nginx/ssl ssl

pg:
	@make -C ansible/roles/db/files/ssl ssl

clean:
	@make -C conf/ssl clean
	@make -C docker/worker/conf/nginx/ssl clean
	@make -C ansible/roles/db/files/ssl clean