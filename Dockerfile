FROM nginx:latest
LABEL Author="hammer182"
LABEL Project="Portfolio"
EXPOSE 80
COPY ./portfolio/ /usr/share/nginx/html