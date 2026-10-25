.PHONY: setup test lint format run api clean

# ── Setup ───────────────────────────────────────────────────────
setup:
	python -m pip install --upgrade pip
	pip install -e ".[dev]"
	pre-commit install || true
	@echo "✔ environment ready"

# ── Quality ─────────────────────────────────────────────────────
lint:
	ruff check src/ tests/
	ruff format --check src/ tests/

format:
	ruff check --fix src/ tests/
	ruff format src/ tests/

# ── Tests ───────────────────────────────────────────────────────
test:
	python -I -m pytest tests/unit -v

test-all:
	python -I -m pytest tests/ -v

test-cov:
	python -I -m pytest tests/ --cov=expplatform --cov-report=term-missing

# ── Run ─────────────────────────────────────────────────────────
api:
	uvicorn expplatform.api.main:app --reload --port 8000

run:
	streamlit run app/dashboard.py --server.port 8501

# ── Docker ──────────────────────────────────────────────────────
docker-build:
	docker build -t expplatform .

docker-run:
	docker run --rm -p 8000:8000 expplatform

# ── Housekeeping ────────────────────────────────────────────────
clean:
	find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
	rm -rf .pytest_cache .ruff_cache dist *.egg-info
