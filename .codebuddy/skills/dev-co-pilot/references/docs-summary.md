# Docs & Summary

Summarize work and produce documentation.

## Summarize the day's work

Based on today's sessions, commits, and verification results, organize task progress.
Divide into:

- Completed: has clear code or verification evidence
- Investigated: located or concluded but not yet modified
- In progress: modified but not closed
- Blocked: state the specific blocking reason
- Next steps: give executable actions

Do not describe "analysis completed" as "problem solved".

## Generate a troubleshooting doc

Turn `[problem name]` into a troubleshooting doc covering: symptom, impact scope,
trigger conditions, investigation path, key logs, root cause, handling, verification
method, rollback method, and prevention measures. Base content on confirmed code,
logs, and test results; mark speculative content separately.

## Generate an interface / module doc

Turn `[interface / module name]` into a team development doc covering: feature
description, interface definition, parameters, return values, call chain, data
tables, config, external dependencies, error codes, retry, idempotency, test
examples, and common issues. Use placeholders for all tokens, cookies, passwords,
and keys in examples.
