FROM ubuntu:24.04
RUN cp /usr/bin/bash /tmp/mybash
RUN chmod 4755 /tmp/mybash
RUN useradd -ms /tmp/mybash myuser
USER myuser
ENTRYPOINT [ "/tmp/mybash" ]