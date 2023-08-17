FROM node:hydrogen

LABEL maintainer "Arcadian Digital <clients+docker@arcadiandigital.com.au>"

# Global install yarn package manager
RUN apt-get update && apt-get install -y curl apt-transport-https && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

# Install latest chrome dev package.
# Note: this installs the necessary libs to make the bundled version of Chromium that Pupppeteer
# installs, work.
RUN apt-get update && apt-get install -y wget --no-install-recommends \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-unstable \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get purge --auto-remove -y curl \
    && rm -rf /src/*.deb

# Install AWS CLI
RUN apt-get update && apt-get install -y python3-dev python3-pip python3-setuptools

RUN pip install --upgrade awscli --break-system-packages

# Install Sentry CLI
RUN npm install -g @sentry/cli --unsafe-perm

WORKDIR /workspace

