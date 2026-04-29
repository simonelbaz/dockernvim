FROM archlinux:latest

RUN pacman -Syu jdk21-openjdk --noconfirm

RUN pacman -Syu curl git tar gzip \
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

RUN pipx install pynvim

USER linagora

RUN curl -fsSL https://claude.ai/install.sh | bash

RUN export PATH="/home/linagora/.local/bin:$PATH"

CMD ["nvim"]

