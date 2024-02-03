dev:
  zola serve

build:
  zola build

deploy:
  zola build
  rsync -rvP --delete public/ root@$(hcloud server ip nixe):/var/www/blog
