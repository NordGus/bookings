FROM ruby:3.1.2

RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get update && \
    apt-get install postgresql-client nano nodejs imagemagick -y && \
    npm install --global yarn

WORKDIR /var/app

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
COPY package.json package.json
COPY yarn.lock yarn.lock

RUN bundle install
RUN yarn install

COPY . /var/app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]