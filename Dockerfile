FROM nginx:1.21.6-alpine
ENV TZ=Asia/Shanghai
RUN apk add --no-cache --virtual .build-deps ca-certificates bash curl unzip php7
ADD mycollect.zip /mycollect/mycollect.zip
ADD usfig.zip /usfig/usfig.zip
ADD apt/default.conf.template /etc/nginx/conf.d/default.conf.template
ADD apt/nginx.conf /etc/nginx/nginx.conf
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
ENTRYPOINT ["sh", "/configure.sh"]
