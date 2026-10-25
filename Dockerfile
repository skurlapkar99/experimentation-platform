FROM python:3.11-slim AS base

WORKDIR /app

# System deps
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential curl && \
    rm -rf /var/lib/apt/lists/*

# Python deps (cached layer)
COPY pyproject.toml .
RUN pip install --no-cache-dir .

# Application code
COPY src/ src/
COPY sql/ sql/

EXPOSE 8000

CMD ["uvicorn", "expplatform.api.main:app", "--host", "0.0.0.0", "--port", "8000"]
