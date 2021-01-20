FROM alpine:3.12
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
RUN apk add --no-cache tzdata moreutils git nodejs npm curl bash
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "Asia/Shanghai" > /etc/timezone

RUN date

WORKDIR /
COPY sync.sh /sync.sh
COPY custom.list /custom.list
RUN bash /sync.sh
COPY ./cron_wrapper /jd-scripts-docker/cron_wrapper
CMD crontab -l && crond -f
