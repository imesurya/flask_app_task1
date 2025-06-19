# Use official lightweight Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app
# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app and model
COPY app.py model.pkl ./

# Expose port 8080 (Cloud Run default)
EXPOSE 8080

# Use gunicorn to run the app for production readiness
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
