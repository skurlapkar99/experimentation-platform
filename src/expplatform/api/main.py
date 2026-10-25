"""FastAPI application entry point."""

from fastapi import FastAPI

app = FastAPI(
    title="Experimentation Platform API",
    version="0.1.0",
    description="A/B testing and causal inference results service",
)


@app.get("/health")
def health_check() -> dict[str, str]:
    """Liveness probe."""
    return {"status": "ok"}
