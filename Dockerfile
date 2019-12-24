FROM rclone/rclone:latest
LABEL maintainer="Jean-Avit Promis docker@katagena.com"

LABEL org.label-schema.vcs-url="https://github.com/nouchka/docker-rclone"
LABEL version="latest"

COPY rclone.conf.template /root/.config/rclone/rclone.conf.template
COPY start.sh /start.sh
RUN chmod +x /start.sh

ENV TYPE     s3
ENV PROVIDER Scaleway
ENV AUTH     false
ENV ENDPOINT s3.fr-par.scw.cloud
ENV REGION   fr-par
ENV ACL      private
ENV ACCESS_KEY=
ENV SECRET_KEY=
ENV SOURCE   /data
ENV TARGET   s3:data

ENTRYPOINT ["/start.sh"]
