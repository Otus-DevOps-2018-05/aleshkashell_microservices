FROM alpine:3.4
#RUN apk update && apk add --virtual ruby-full ruby-dev build-essential ruby-bundler

RUN apk update && apk --update add ruby ruby-irb ruby-json ruby-rake \  
    ruby-bigdecimal ruby-io-console libstdc++ tzdata postgresql-client nodejs

RUN apk --update add --virtual build-dependencies build-base ruby-dev openssl-dev \  
    postgresql-dev libc-dev linux-headers && \
    gem install bundler --no-ri --no-rdoc
# && gem install bundler --no-ri --no-rdoc
ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/
RUN bundle install
ADD . $APP_HOME
ENV POST_SERVICE_HOST post
ENV POST_SERVICE_PORT 5000
ENV COMMENT_SERVICE_HOST comment
ENV COMMENT_SERVICE_PORT 9292
CMD ["puma"]