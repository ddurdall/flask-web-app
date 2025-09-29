# Build stage
FROM python:3.11-slim AS build-env
WORKDIR /app

# Create virtual env
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install dependencies
COPY src/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Release build
FROM gcr.io/distroless/python3-debian12
WORKDIR /app

# Copy over files from build stage
COPY --from=build-env /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
ENV PYTHONPATH="/opt/venv/lib/python3.11/site-packages"

COPY src/ .

EXPOSE 5000
CMD ["./app.py"]
