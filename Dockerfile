FROM node as builder
RUN mkdir ./frontend
WORKDIR /frontend
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
FROM nginx:alpine
COPY --from=builder /frontend/dist/dockerclass /usr/share/nginx/html
EXPOSE 80
CMD ["nginx","-g", "daemon off;"]