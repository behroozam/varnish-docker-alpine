FROM alpine:latest
RUN apk update
RUN apk add varnish

# Make our custom VCLs available on the container
ADD default.vcl /etc/varnish/default.vcl
# Expose volumes to be able to use data containers
VOLUME ["/var/lib/varnish", "/etc/varnish"]

ADD start.sh /start.sh
CMD ["/start.sh"]
