FROM squidfunk/mkdocs-material:8.1.8

RUN apk add --no-cache --virtual .devel gcc make musl-dev \
 && pip install 'mdx_truly_sane_lists==1.2.*' \
                'mdx_unimoji==1.0.*' \
                'mkdocs-awesome-pages-plugin==2.6.*' \
                'plantuml-markdown==3.5.*' \
                'pymdown-extensions==9.1.*' \
                'python-markdown-math==0.8.*' \
                git+https://github.com/bmcorser/fontawesome-markdown@5feb14118d963312d52bb1fdb4c7eefa4da19880 \
 && apk del .devel

RUN apk add --no-cache openssl

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
 && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
 && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz
