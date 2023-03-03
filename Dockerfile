# First stage #
FROM node:18-alpine as builder

#This is place where I have put env variables

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm run build

# Second stage #
FROM gcr.io/distroless/nodejs:18

WORKDIR /app

COPY --from=builder /app /app

#This is place where I have put env variables

EXPOSE 3000

USER 1000

CMD ["./node_modules/next/dist/bin/next", "start"]
