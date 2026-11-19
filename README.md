# Table — learning Ruby on Rails 8

> **📚 Learning project — not production code.**
> I built this step by step while getting back into Ruby on Rails (I last used it professionally years ago),
> following a guided tutorial with [Claude](https://claude.ai) as my tutor. The code is mine, typed and debugged
> by hand, but the structure and exercises came from the tutorial. It exists to practise the framework,
> not to be a finished product.

A small restaurant app: a public list of restaurants with their menus, plus a login-protected admin area
for managing dishes.

## What I practised

- **Rails conventions** — how naming wires models, tables, controllers, views and routes together; Zeitwerk autoloading
- **Active Record** — migrations, `schema.rb`, lazy relations, hash conditions vs. SQL fragments, scopes
- **Associations** — `belongs_to` / `has_many`, foreign keys, `dependent:`
- **N+1 queries** — spotting them in the log, `includes` vs. `joins`, `count` vs. `size`
- **Validations vs. database constraints** — built-in and custom validations, backed by unique / not-null constraints
- **Forms** — Post/Redirect/Get, 422 / 303 status codes for Turbo, strong parameters (`params.expect`), CSRF
- **Partials** — shared form partial, collection rendering, namespaced partial lookup
- **Security habits** — scoping lookups through the parent record (IDOR), secure-by-default controllers
- **Authentication** — Rails 8's built-in generator: `has_secure_password` (bcrypt), database-backed sessions, rate limiting
- **Namespaces** — an `/admin` area with its own controllers and views
- **Money** — `decimal` / `BigDecimal`, never floats

## Stack

Ruby 3.4 · Rails 8.1 · PostgreSQL 17 (Docker Compose) · Hotwire (Turbo) · Minitest

## Running it

```bash
docker compose up -d        # Postgres on localhost:5434
bundle install
bin/rails db:prepare db:seed
bin/rails server            # http://localhost:3000
```

Development login (created by the seeds): `admin@example.com` / `change-me-please`.

## Status

Paused after step 11 (admin namespace). Planned next steps: restaurant management in the admin area,
reservations, mailers and background jobs, I18n (FR/DE/EN), and tests.

---

[Constantin Theis](https://portfolio.ths.lu)
