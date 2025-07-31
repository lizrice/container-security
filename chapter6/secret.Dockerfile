FROM alpine
RUN --mount=type=secret,id=MY_SECRET echo /run/secrets/MY_SECRET 
