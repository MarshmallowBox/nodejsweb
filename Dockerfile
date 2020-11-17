FROM node
WORKDIR /app
ADD . ./
COPY . .
RUN npm install -g pm2
CMD ["pm2-docker", "main.js"]
EXPOSE 80
