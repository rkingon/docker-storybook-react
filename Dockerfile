FROM node:10.15.3

ENV PORT 6006
ENV PREVIEW_URL http://localhost:1337/iframe.html

WORKDIR /home/node

RUN npm install -g yarn

COPY yarn.lock package.json ./

RUN yarn install

COPY . ./

CMD ["bash", "-c", "yarn storybook -p ${PORT} --preview-url=${PREVIEW_URL}"]
