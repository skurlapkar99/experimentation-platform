# Experimentation Platform — Project Memory

## Goal
Build a production-grade A/B testing and causal-inference platform that
ingests experiment data, runs statistical checks (SRM, power, CUPED,
sequential testing), applies causal methods (diff-in-diff, synthetic
control, uplift modelling), serves results via a FastAPI service, and
visualises them in a Streamlit dashboard.

## Success metrics
- Unit-test coverage ≥ 80 %
- CI green on every merge to main
- End-to-end test: ingest → stats → API → dashboard on sample data
- README contains architecture diagram and reproducible setup instructions

## Stack
- Python 3.11 | pandas, polars, scipy, statsmodels, EconML
- FastAPI (service) | Streamlit (dashboard) | DuckDB (analytics SQL)
- pytest, ruff | Docker | GitHub Actions CI
- Data: Criteo Uplift dataset + simulated experiments

## Commands
```bash
make setup   # install deps into current env
make test    # unit tests only (fast)
make test-all # unit + e2e
make lint    # ruff check + format check
make format  # auto-fix lint issues
make api     # start FastAPI dev server on :8000
make run     # start Streamlit dashboard on :8501
```

## Conventions
- Source code lives in `src/expplatform/`; import as `from expplatform.stats import ...`
- One module = one file with a matching test in `tests/unit/test_<module>.py`
- Type hints on every public function; Google-style docstrings
- SQL queries go in `sql/` and are read at runtime, never inlined
- Decisions get a short entry in `docs/decisions.md` (date, context, choice, trade-off)
- Branches: `EXP-<ticket>-short-slug` off main

## Workflow
1. Pick a Jira ticket → move it to In Progress
2. Create branch `EXP-<n>-slug`
3. Write code + tests; `make lint && make test` must pass
4. Open PR → CI runs automatically
5. Merge to main → move ticket to Done

## Rules
- Never commit to main directly — always use a PR
- Never commit anything under `data/` — it is git-ignored
- Keep functions pure where possible; side effects only at boundaries
- If a design choice is non-obvious, add it to `docs/decisions.md`
