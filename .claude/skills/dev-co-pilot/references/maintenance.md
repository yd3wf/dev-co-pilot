# Maintenance

Long-term maintenance of AI-generated code. The more AI-generated code exists, the
more important it is to focus not only on "does it run" but also on building a
sustainable maintenance mechanism.

## Maintenance principles

- Code must belong to a module: every module has a clear owner, business boundary, and key dependencies.
- Generated code must enter normal review: AI-generated code is not exempt from Code Review.
- Deliver code and tests together: core logic must have unit tests, interface tests, or regression cases.
- Keep business-rule explanations: comments should focus on "why", not just restate the code.
- Control single-change scope: commit in small batches for easier review, rollback, and pinpointing.
- Clean up tech debt regularly: repeated code, over-encapsulation, invalid config, and low-quality tests.
- Manage high-risk code carefully: payment, refund, inventory, permissions, messaging, and data sync must not fully rely on AI judgment.

## Maintenance register

Use `assets/maintenance-register.md` as the table template for tracking AI-code maintenance.

## AI code delivery standard

A piece of AI-generated code must deliver at least: modification purpose; key business
rules; changed files and impact scope; test cases and verification results; unverified
items and residual risks; the future maintainer.

## Regular maintenance review

Perform a read-only maintenance review of module `[module name]`. Focus on:

1. Repeated code and repeated business logic
2. Over-encapsulation, meaningless abstraction, and over-long methods
3. Complex branches, implicit defaults, and hard-to-understand naming
4. Missing exception handling, logging, idempotency, and transaction boundaries
5. Missing or ineffective tests
6. Deprecated interfaces, config, and dependencies
7. Risks affecting payment, permissions, inventory, messaging, and data consistency

Output as "problem / evidence location / impact / priority / suggested owner".
Do not modify code.

## Add missing tests

Check the core business logic of module `[module name]` and find scenarios with
insufficient test coverage. Prioritize: normal flow, boundary values, repeated calls,
exception rollback, permission checks, third-party failures, duplicate message
consumption, and old-data compatibility. Output specific test cases, prerequisite
data, steps, and expected results. Do not modify production code yet.

## Refactor tech debt

Inventory the tech debt of `[file/module]`, categorized by high / medium / low priority.
For each item output: problem, code evidence, business risk, change cost, and whether
immediate refactoring is suitable. Prioritize issues affecting correctness, stability,
security, and development efficiency. Give only a governance plan. Do not modify code.

## Maintenance loop

AI-generated -> human review -> test verification -> code merge -> monitoring ->
periodic review -> refactor and add tests.

The core is not to restrict AI-generated code, but to make every piece of code
understandable, verifiable, maintainable, modifiable, and rollback-able.
