# Use Node.js image
FROM node:20-alpine

WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN apk add --no-cache curl netstat-openbsd
RUN npm run build

# Explicitly set host and port for Next.js
ENV HOST=0.0.0.0
ENV PORT=3000
EXPOSE 3000

CMD ["npm", "start"]
