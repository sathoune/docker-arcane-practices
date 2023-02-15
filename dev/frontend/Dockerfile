FROM --platform=linux/amd64   node:16.13.0-alpine3.14
WORKDIR /app

# Install dependencies
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

COPY . .
CMD ["yarn", "dev"]