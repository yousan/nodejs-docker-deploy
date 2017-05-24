FROM node:4.3.2

RUN useradd --user-group --create-home --shell /bin/false app && \
  npm install --global npm@3.7.5

ENV HOME=/home/app

COPY package.json npm-shrinkwrap.json $HOME/yourappnamehere/
RUN chown -R app:app $HOME/*

USER app
WORKDIR $HOME/yourappnamehere
RUN npm install


USER root
COPY . $HOME/yourappnamehere
RUN chown -R app:app $HOME/*
USER app

CMD ["node", "index.js"]
