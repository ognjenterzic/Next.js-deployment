# First stage #
FROM node:18-alpine as builder

ENV NEXT_PUBLIC_FOURSQUARE_API_KEY=fsq3snxM24jfqamDg26HA89t8YESgTqhC7kkE40jrM0ZjuY=
ENV NEXT_PUBLIC_UNSPLASH_ACCESS_KEY=8p9lC4mKntiOa0q50srgCcspkNBLFoXELHcdfvTBM4k
ENV AIRTABLE_API_KEY=keyieL30tupx8ItBM
ENV AIRTABLE_BASE_KEY=appEQyo6tgjzfYWIz

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm run build

# Second stage #
FROM gcr.io/distroless/nodejs:18

WORKDIR /app

COPY --from=builder /app /app

ENV NEXT_PUBLIC_FOURSQUARE_API_KEY=fsq3snxM24jfqamDg26HA89t8YESgTqhC7kkE40jrM0ZjuY=
ENV NEXT_PUBLIC_UNSPLASH_ACCESS_KEY=8p9lC4mKntiOa0q50srgCcspkNBLFoXELHcdfvTBM4k
ENV AIRTABLE_API_KEY=keyieL30tupx8ItBM
ENV AIRTABLE_BASE_KEY=appEQyo6tgjzfYWIz

EXPOSE 3000

USER 1000

CMD ["./node_modules/next/dist/bin/next", "start"]