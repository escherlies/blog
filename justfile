dev:
  zola serve -O

build:
  zola build

deploy:
  zola build
  rsync -rvP --delete public/ root@$(hcloud server ip nixe):/var/www/blog

install:
  if [ ! -d "./themes/anemone" ]; then \
    mkdir -p themes; \
    cd themes; \
    git clone https://github.com/escherlies/anemone.git; \
  fi

new_post title:
  #!/bin/bash
  DATE=$(date +%Y-%m-%d)
  FILENAME="content/blog/${DATE}-{{title}}.md"
  echo -e "---\ntitle: {{title}}\ndate: ${DATE}\n---\n" > $FILENAME
  echo "New post created at $FILENAME"
  code $FILENAME