FROM jekyll/jekyll:4.2.2

WORKDIR /srv/jekyll

COPY Gemfile* ./

RUN bundle install

COPY . .

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--livereload"]