# Experimentation Platform

A production-grade A/B testing and causal-inference engine built as a portfolio project demonstrating the full data-science lifecycle.

## What it does

| Layer | Capability |
|-------|-----------|
| **Ingest** | Downloads and loads the Criteo Uplift dataset (~25 M rows) plus simulated experiments with known effects |
| **Statistics** | SRM checks, power analysis, CUPED variance reduction, sequential testing, multiple-comparison correction |
| **Causal** | Difference-in-differences, synthetic control, uplift modelling (EconML) |
| **Service** | FastAPI endpoint that accepts experiment IDs and returns results as JSON |
| **Dashboard** | Streamlit app with interactive charts for experiment monitoring |

## Quick start

```bash
# 1. Clone and enter
git clone https://github.com/<your-username>/experimentation-platform.git
cd experimentation-platform

# 2. Create a virtual environment
python3.11 -m venv .venv && source .venv/bin/activate

# 3. Install
make setup

# 4. Run tests
make test

# 5. Start the API
make api          # http://localhost:8000/docs

# 6. Start the dashboard
make run           # http://localhost:8501
```

## Architecture

```
┌───────────┐    ┌───────────┐    ┌───────────┐    ┌───────────┐
│  Ingest   │───▶│   Stats   │───▶│  Causal   │───▶│  FastAPI  │
│  (data/)  │    │  engine   │    │  methods  │    │  service  │
└───────────┘    └───────────┘    └───────────┘    └─────┬─────┘
                                                        │
                                                  ┌─────▼─────┐
                                                  │ Streamlit  │
                                                  │ dashboard  │
                                                  └───────────┘
```

## Project structure

```
src/expplatform/
  ingest/    — download and load raw data
  stats/     — power, SRM, CUPED, sequential tests
  causal/    — diff-in-diff, synthetic control, uplift
  api/       — FastAPI service
sql/         — versioned analysis queries
tests/       — unit/ and e2e/
app/         — Streamlit dashboard
docs/        — decisions log, architecture diagrams
```

## License

MIT
