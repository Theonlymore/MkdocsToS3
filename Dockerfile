FROM python:3.8-alpine

ENV AWSCLI_VERSION='1.17.1'

RUN apk add build-base

RUN pip install --quiet --no-cache-dir awscli==${AWSCLI_VERSION}
RUN pip install --quiet --no-cache-dir mkdocs
RUN pip install --quiet --no-cache-dir mkdocs-material
RUN pip install --quiet --no-cache-dir mkdocs-git-revision-date-localized-plugin
RUN pip install --quiet --no-cache-dir mkdocs-foo-plugin

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
