FROM archlinux:latest

RUN pacman -Syu jdk21-openjdk --noconfirm

RUN pacman -Syu curl git tar gzip \
                    base-devel \
                    wget \
                    lazygit \
                    tree-sitter-cli \
                    ripgrep \
                    fzf \
                    nodejs \
                    luarocks \
                    maven \
                    npm \
                    tree-sitter-cli \
                    fd \
                    ast-grep \
                    fish \
                    prettier \
                    gcc \
                    wl-clipboard \
                    xdg-utils \
                    perl \
                    cpanminus \
                    ruby \
                    python \
                    python-pipx \
                    maven \
                    neovim \
                    --noconfirm


RUN useradd linagora --shell /bin/bash --home /home/linagora  -m

COPY jdtls /home/linagora/jdtls

RUN npm install -g neovim

RUN mkdir /home/linagora/.config

RUN chown -R linagora:linagora /home/linagora 

USER linagora

RUN pipx install pynvim
RUN gem install neovim && gem environment

RUN curl -fsSL https://claude.ai/install.sh | bash

CMD ["nvim"]

