FROM ubuntu:16.04

# install dependencies
RUN apt-get update && apt-get install -y curl xz-utils libstdc++-5-dev libxml2

# download and unpack llvm
RUN curl -L https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.1/clang+llvm-10.0.1-x86_64-linux-gnu-ubuntu-16.04.tar.xz --output llvm.tar.xz && \
    tar -xJf llvm.tar.xz && \
    mv clang+llvm-10.0.1-x86_64-linux-gnu-ubuntu-16.04 llvm && \
    ln -s /llvm/bin/ld.lld /llvm/bin/ld && \
    ln -s /usr/lib/x86_64-linux-gnu/libxml2.so.2 /lib/x86_64-linux-gnu/libxml2.so && \
    ln -s /lib/x86_64-linux-gnu/libtinfo.so.5 /lib/x86_64-linux-gnu/libtinfo.so && \
    ln -s /lib/x86_64-linux-gnu/libz.so.1 /lib/x86_64-linux-gnu/libz.so && \
    echo 'export PATH=/llvm/bin:$PATH' >> ~/.bashrc 

# install utility scripts
COPY . /
RUN chmod +x build.sh && \
    chmod +x test.sh

# build the compiler by default
CMD [ "./build.sh" ]