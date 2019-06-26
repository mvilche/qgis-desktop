FROM ubuntu:bionic
RUN apt update && apt install gpg ca-certificates gpg-agent --no-install-recommends -y
COPY qgis-2017.gpg.key /tmp/qgis-2017.gpg.key
RUN echo "deb  http://qgis.org/debian bionic main" >> /etc/apt/sources.list && \
echo "deb-src  http://qgis.org/debian bionic main" >> /etc/apt/sources.list && \
gpg --import /tmp/qgis-2017.gpg.key && gpg --fingerprint CAEB3DC3BDF7FB45 && gpg --export --armor CAEB3DC3BDF7FB45 | apt-key add -
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install gosu dbus-x11 ttf-wqy-microhei qgis python3-qgis qgis-plugin-grass --no-install-recommends -y
COPY run.sh /usr/bin/run.sh
RUN adduser --disabled-password --gecos "" qgis
ENTRYPOINT ["/usr/bin/run.sh"]
CMD ["/usr/bin/qgis"]

