FROM alpine:3.21
COPY setuid.sh setuid.sh
COPY setuid-sh setuid-sh 
CMD ["./setuid.sh"]