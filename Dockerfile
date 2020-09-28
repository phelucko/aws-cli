FROM amazon/aws-cli:latest
LABEL description="Amazon CLI docker image with non-root user"

RUN set -o errexit -o nounset \
  && echo "Installing shadow-utils" \
  && yum -y install shadow-utils \
  && echo "Adding aws user and group" \
  && groupadd --system --gid 1000 aws \
  && useradd --system --gid aws --uid 1000 --shell /bin/bash --create-home aws \
  && mkdir /home/aws/.aws \
  && chown --recursive aws:aws /home/aws
