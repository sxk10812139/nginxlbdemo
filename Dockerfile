FROM nginx

ADD  nginx.conf /etc/nginx/nginx.conf
ADD  upstream.conf /etc/nginx/upstream.conf

#CMD ["nginx","-g","daemon off;"]
ENTRYPOINT ["nginx","-g","daemon off;"]

EXPOSE 80
