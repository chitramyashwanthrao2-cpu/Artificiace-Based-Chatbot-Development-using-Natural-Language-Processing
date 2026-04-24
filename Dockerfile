FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    nginx \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements
COPY backend/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt gunicorn

# Copy all code
COPY . .

# Nginx config for production
COPY nginx.conf /etc/nginx/sites-available/default

EXPOSE 80

CMD ["sh", "-c", "nginx && gunicorn -w 4 -b 0.0.0.0:5000 backend.app:app"]

