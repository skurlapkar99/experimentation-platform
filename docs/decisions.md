# Architecture Decision Records

| Date | Decision | Context | Trade-off |
|------|----------|---------|-----------|
| 2026-10-24 | Use `src/` layout | Avoids accidental imports of the dev tree; standard for installable packages | Slightly deeper paths |
| 2026-10-24 | DuckDB for analytics SQL | Serverless, fast on single-node columnar scans, zero infra | Not a real data warehouse; swap for Postgres/BigQuery in production |
| 2026-10-24 | Ruff for lint + format | Single tool replaces flake8 + isort + black; very fast | Newer, less ecosystem support than black |
