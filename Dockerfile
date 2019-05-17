FROM node:8 as build-deps

WORKDIR /usr/src/app

COPY . /usr/src/app
RUN yarn install

RUN npm run build

RUN ls -l

FROM nginx:alpine
WORKDIR /html
COPY --from=build-deps /usr/src/app/build /usr/share/nginx/html/
