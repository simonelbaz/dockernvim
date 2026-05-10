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
                    ccls \
                    --noconfirm


RUN useradd linagora --shell /bin/bash --home /home/linagora  -m
RUN chown -R linagora:linagora /home/linagora 

RUN npm install -g neovim

USER linagora

COPY jdtls /opt/jdtls
RUN mkdir /home/linagora/.config

RUN pipx install pynvim
RUN gem install neovim && gem environment

RUN curl -fsSL https://claude.ai/install.sh | bash

RUN mkdir -p ~/.local/share/nvim/site/pack/coc/start \
    && cd ~/.local/share/nvim/site/pack/coc/start \
    && git clone --branch release https://github.com/neoclide/coc.nvim.git --depth=1 \
    && nvim -c "helptags coc.nvim/doc/ | q"

COPY clangd /home/linagora/.clangd

CMD ["nvim"]
