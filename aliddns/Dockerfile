ARG BUILD_FROM
FROM $BUILD_FROM
ARG BUILD_ARCH

# Add env
ENV LANG C.UTF-8

# Setup base
# RUN apt-get install -y --no-install-recommends jq
RUN apk add --no-cache jq curl

RUN if [ "$BUILD_ARCH" = "armhf" ]; \
    then curl -L -O https://github.com/chenhw2/aliyun-ddns-cli/releases/download/v20180622/aliddns_arm-47BBA02DE2.2018-06-22.tar.gz \
  && tar zxvpf aliddns_arm-47BBA02DE2.2018-06-22.tar.gz && rm aliddns_arm-47BBA02DE2.2018-06-22.tar.gz aliddns_arm5 aliddns_arm6 && mv aliddns_arm7 /usr/bin/aliyun-ddns-cli;\
    elif [ "$BUILD_ARCH" = "amd64" ]; \
    then curl -L -O https://github.com/chenhw2/aliyun-ddns-cli/releases/download/v20180622/aliddns_linux-amd64-47BBA02DE2.2018-06-22.tar.gz \
  && tar zxvpf aliddns_linux-amd64-47BBA02DE2.2018-06-22.tar.gz && rm aliddns_linux-amd64-47BBA02DE2.2018-06-22.tar.gz && mv aliddns_linux_amd64 /usr/bin/aliyun-ddns-cli;\
    else return 0;\
    fi 


# Copy data
COPY run.sh /

RUN chmod a+x /run.sh
RUN chmod +x /usr/bin/aliyun-ddns-cli

CMD [ "/run.sh" ]