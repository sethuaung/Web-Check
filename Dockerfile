
# Node and Debian versions
ARG NODE_VERSION=22
ARG DEBIAN_VERSION=bookworm

FROM node:${NODE_VERSION}-${DEBIAN_VERSION} AS deps

WORKDIR /app

# Skip Chromium until the final stage
ENV PUPPETEER_SKIP_DOWNLOAD='true' \
    NODE_CHROMIUM_SKIP_INSTALL='true'

COPY package.json yarn.lock ./

# Install deps, without changing lockfile
RUN npm pkg delete devDependencies && \
    yarn install --pure-lockfile --network-timeout 100000 && \
    rm -rf /app/node_modules/.cache

# Build stage, using the full image because we need the full toolchain
FROM node:${NODE_VERSION}-${DEBIAN_VERSION} AS build

SHELL ["/bin/bash", "-euo", "pipefail", "-c"]

WORKDIR /app

# The build needs no browser either
ENV PUPPETEER_SKIP_DOWNLOAD='true' NODE_CHROMIUM_SKIP_INSTALL='true'

COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile --network-timeout 100000 && \
    rm -rf /app/node_modules/.cache

COPY . .

RUN yarn build --production

# Slim's fine from here, there's nothing left to compile
FROM node:${NODE_VERSION}-${DEBIAN_VERSION}-slim AS final

WORKDIR /app

COPY --from=deps /app/node_modules ./node_modules
COPY --from=build /app/dist ./dist
COPY --from=build /app/api ./api
COPY --from=build /app/public ./public
COPY --from=build /app/server.js /app/healthcheck.js /app/package.json /app/yarn.lock ./

RUN apt-get update && \
    apt-get install -y --no-install-recommends chromium traceroute tini && \
    rm -rf /var/lib/apt/lists/*

# Fail the build here if the runtime tree can't load the compiled server
RUN node --input-type=module -e "await import('/app/dist/server/entry.mjs');"

# Metadata only, so it can't follow PORT
EXPOSE 3000

# Point Chromium-using libs at the system binary, skip puppeteer's bundled download
ENV CHROME_PATH='/usr/bin/chromium' \
    PUPPETEER_EXECUTABLE_PATH='/usr/bin/chromium' \
    PUPPETEER_SKIP_DOWNLOAD='true'

LABEL org.opencontainers.image.title="Web-Check" \
      org.opencontainers.image.description="All-in-one OSINT tool for analysing any website" \
      org.opencontainers.image.url="https://web-check.xyz" \
      org.opencontainers.image.source="https://github.com/lissy93/web-check" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.vendor="Alicia Sykes"

HEALTHCHECK --interval=30s --timeout=10s --start-period=15s --retries=3 \
    CMD ["node", "healthcheck.js"]

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["node", "server.js"]
