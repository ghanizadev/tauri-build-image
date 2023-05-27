FROM cimg/node:lts

RUN sudo apt-get update && \
    sudo apt-get install -y libwebkit2gtk-4.0-dev \
        build-essential \
        curl \
        wget \
        libssl-dev \
        libgtk-3-dev \
        squashfs-tools \
        libgtksourceview-3.0-dev \
        libappindicator3-dev \
        lld \
        llvm \
        nsis \
        libclang-dev && \
    sudo apt-get clean


RUN curl https://sh.rustup.rs -sSf | \
    sh -s -- --default-toolchain stable -y

RUN $HOME/.cargo/bin/rustup target add i686-pc-windows-gnu

RUN $HOME/.cargo/bin/rustup target add x86_64-pc-windows-gnu

RUN $HOME/.cargo/bin/rustup target add aarch64-apple-darwin

RUN $HOME/.cargo/bin/rustup target add i686-unknown-linux-gnu

RUN $HOME/.cargo/bin/rustup target add x86_64-unknown-linux-gnu

ENV PATH=$HOME/.cargo/bin:$PATH