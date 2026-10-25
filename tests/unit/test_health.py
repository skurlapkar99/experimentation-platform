"""Smoke test — proves the test harness and FastAPI app both work."""

from fastapi.testclient import TestClient

from expplatform.api.main import app

client = TestClient(app)


def test_health_returns_ok() -> None:
    resp = client.get("/health")
    assert resp.status_code == 200
    assert resp.json() == {"status": "ok"}
