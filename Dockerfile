FROM ubuntu:latest

ARG user=jekyll
ARG group=jekyll
ARG uid=1000
ARG gid=1000
ARG port=4000

RUN apt update
RUN apt install -y build-essential ruby-full zlib1g-dev
RUN gem install jekyll bundler

RUN groupadd -g ${gid} ${group} && \
    useradd -u ${uid} -g ${group} -m -d /home/${user} -s /bin/sh ${user}

USER ${user}

ENV GEM_HOME=/home/${user}/gems
ENV PATH=/home/${user}/gems/bin:$PATH
ENV PORT=${port}

EXPOSE ${port}
WORKDIR /home/${user}/
RUN mkdir -p /home/${user}/site

CMD [ "jekyll", "serve", "-s", "site", "--disable-disk-cache", "--force_polling", "-H", "0.0.0.0", "-P", "4000" ]
