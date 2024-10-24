#Stage 1
FROM node:18-alpine AS build

WORKDIR /app

COPY package.json  ./

RUN npm install

COPY . .

RUN npm run build:css

# Stage 2
FROM python:3.10-slim AS runtime

WORKDIR /app

COPY --from=build /app /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_ENV=development
ENV FLASK_DEBUG=1

# Run the app
CMD ["flask", "run"]
