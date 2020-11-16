FROM node
WORKDIR /app
ADD . ./
COPY . .
CMD ["pm2-docker", "main.js"]
EXPOSE 80