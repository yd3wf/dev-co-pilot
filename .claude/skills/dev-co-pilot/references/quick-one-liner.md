# Quick One-Liners

Short reusable prompts for the most common tasks.

## Read-only investigation

First search and understand the existing implementation. Read-only analysis; do not
modify code. Provide the call chain, evidence locations, impact scope, and
pending-verification items.

## Plan first

Do not modify code yet. Based on current status, give a minimal-change plan,
compatibility strategy, risks, and acceptance criteria.

## Modify and verify

Modify the specified scope according to the confirmed plan and preserve existing
changes. After finishing, inspect `git diff`, run compile and tests, and report
evidence, unverified items, and residual risks.

## Frontend behavior

Trace this page/action from the route and component state through the request and
rendered result. Reuse the existing UI patterns, implement `[behavior]`, and
verify success, loading, failure, and duplicate-action behavior. Do not change the
API contract unless explicitly required.

## Backend behavior

Trace `[API/service/job]` through validation, authorization, business rules,
persistence, and async side effects. Implement `[behavior]` with the existing
patterns; verify malformed, forbidden, duplicate/concurrent, and retry behavior
that the changed path can reach.

## Contract review

Compare the client and server contract for `[endpoint/feature]`. Trace every
affected field and error through serialization, validation, persistence, and UI
feedback. List only proven mismatches, release-order risks, and the minimal
compatible fix.

## Diff review

Review the current diff for reachable behavior regressions. Focus on contracts,
permissions, state transitions, async/transaction effects, frontend states, and
missing tests. Give severity, scenario, evidence location, and minimal fix; do
not list stylistic preferences.

## Do not guess

Do not conclude from guessing. Mark every conclusion as confirmed, high-probability,
or pending-verification, and give the corresponding code, log, or test evidence.

## High-risk operation

This is a high-risk operation. First state the impact, goal, rollback method, and
current status. Do not execute until I confirm.
