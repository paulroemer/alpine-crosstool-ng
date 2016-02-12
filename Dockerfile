FROM alpine:3.3

MAINTAINER roemer.paul@gmail.com paulroemer

# ---
# crosstool-NG
#  see https://github.com/crosstool-ng/crosstool-ng.git
# ---

COPY build.sh /tmp/build.sh
RUN chmod +x /tmp/build.sh && /tmp/build.sh

# add user crosstoolng
RUN mkdir /home/theuser \
&& addgroup -g 1001 thegroup  \
&& adduser -u 1001 -G thegroup -h /home/theuser -s /bin/sh -D theuser \
&& chown -R theuser:thegroup /home/theuser

WORKDIR /home/theuser
USER theuser

# work like command
ENTRYPOINT ["ct-ng"]

