FROM --platform=linux/amd64 node:16.13.0-alpine3.14 as dev
WORKDIR /app

# Install dependencies
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

COPY . .
CMD ["yarn", "dev"]

# Build stage
FROM dev as build
RUN yarn build

# Production stage
FROM --platform=linux/amd64  nginx:1.21.4-alpine as prod
COPY --from=build /app/dist /usr/share/nginx/html

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]