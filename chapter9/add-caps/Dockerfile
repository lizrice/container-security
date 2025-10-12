FROM ubuntu:24.04
RUN cp /usr/bin/sleep /tmp/mysleep
RUN apt-get update && apt-get install -y libcap2-bin
RUN setcap 'cap_net_bind_service=+ep' /tmp/mysleep
USER 1000
ENTRYPOINT [ "/usr/bin/bash" ]