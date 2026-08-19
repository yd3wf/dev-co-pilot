# Backend Delivery

Use this reference for APIs, services, jobs, consumers, persistence, migrations,
or third-party integration. Follow the project's current layering and transaction
conventions instead of imposing a new architecture.

## Establish the server path

Trace the actual entry point through validation, authorization, application or
domain logic, persistence, cache, messages/jobs, and response conversion. Record
the business invariant being protected, the owner of each resource, and any
state-transition or concurrency rule before changing behavior.

## Implement a backend change

1. Validate syntax and business preconditions at the boundary, then enforce
   ownership and invariant checks in the service/data path where bypass callers
   cannot avoid them.
2. Keep request/response semantics, error codes, null/default handling, and enum
   meanings compatible unless the requested contract explicitly changes them.
3. Make transaction boundaries deliberate. For callbacks, retries, consumers,
   and external effects, check idempotency, ordering, retry behavior, and what
   happens after a partial failure.
4. For schema or data changes, identify migration order, historical-data behavior,
   indexes/constraints, rollback feasibility, and compatibility with rolling
   deployment before writing a migration.
5. Add useful diagnostics at business boundaries: stable identifiers, outcome,
   and failure context. Do not log credentials, payment data, or unnecessary
   personal data.

## Verify proportionately

Prefer the narrowest meaningful check first: unit/service tests for rules,
repository/integration tests for persistence, contract tests for API behavior, and
consumer or callback tests for asynchronous behavior. Include unauthorized,
not-found, duplicate/concurrent, malformed, and retry cases when the changed path
can reach them. Distinguish an unavailable environment from a passing test.
