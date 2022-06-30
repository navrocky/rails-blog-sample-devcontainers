# берем нужную версию базового дистрибутива. Debian 8 из 2015 года, нам подходит.
FROM debian:8

# устанавливаем все необходимые утилиты
RUN apt-get update && apt-get install -y gnupg2 ca-certificates curl procps sudo git mc libpq-dev

# добавляем пользователя, под которым будем работать внутри контейнера, заодно даем ему возможность делать sudo
RUN useradd -m -d /home/user -s /bin/bash user && adduser user sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# дальше все действия производим уже от пользователя
USER user 

# устанавливаем rvm
RUN gpg2 --keyserver hkp://keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB && \
    curl -ksSL https://get.rvm.io | bash -s stable

# устанавливаем nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# подгружаем все инициализационные скрипты и переменные среды в bash, чтобы заработал установленный rvm
SHELL ["/bin/bash", "-c", "-l"]

# устанавливаем нужную версию Ruby и Bundler
RUN rvm install ruby-2.4 && gem install bundler:1.17.3

# создаем пользовательский каталог .bundle, чтобы были правильные права на эту папку при монтировании volume
RUN mkdir -p /home/user/.bundle

# устанавливаем node v5.3.0 и делаем её по умолчанию
RUN source $HOME/.nvm/nvm.sh && nvm install v5.3.0 && nvm alias default v5.3.0

# просто висим в бесконечном ожидании из /dev/null, это нужно чтобы контейнер не закрылся после запуска
ENTRYPOINT [ "tail", "-f", "/dev/null" ]
