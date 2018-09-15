ARG BUILD_FROM
FROM $BUILD_FROM

# Add env
ENV LANG C.UTF-8

# Setup base
# RUN apt-get install -y --no-install-recommends jq
RUN apk add --no-cache jq curl

RUN curl -L -O https://github.com/chenhw2/aliyun-ddns-cli/releases/download/v20180622/aliddns_arm-47BBA02DE2.2018-06-22.tar.gz \
  && tar zxvpf aliddns_arm-47BBA02DE2.2018-06-22.tar.gz && rm aliddns_arm-47BBA02DE2.2018-06-22.tar.gz aliddns_arm5 aliddns_arm6

# Copy data
COPY run.sh /

RUN chmod a+x /aliddns_arm7
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]