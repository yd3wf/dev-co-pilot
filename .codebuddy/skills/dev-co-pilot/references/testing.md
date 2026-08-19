# Testing & Acceptance

Verify changes rigorously and honestly.

## Generate a test checklist

Generate a test checklist for feature `[feature name]` covering:

1. Normal flow
2. Empty, malformed, and boundary-value parameters
3. Insufficient permission and non-existent data
4. Duplicate submission and duplicate consumption
5. Network timeout, third-party failure, and retry
6. Transaction rollback
7. Final consistency of cache, messages, and indexes
8. Compatibility of old data and old callers

For each item give: preconditions, steps, expected result, and key verification points.

## Compile and run tests

Verify this change.

Verification order:

1. Check `git status` and `git diff`
2. Run `[compile command]`
3. Run `[test command]`
4. If an interface is available, run `[interface test command]`
5. Check key logs or database results

Distinguish: code errors, test failures, dependency issues, missing config,
permission issues, and network issues.

Do not describe "command executed" as "verification passed".

## Generate an acceptance report

Generate an acceptance report from this change and verification results, including:

1. Modification goal
2. Changed files and core behavior
3. Compile result
4. Test result
5. Interface / log / database verification result
6. Unverified items
7. Residual risks
8. Pre-release checklist

Mark anything without evidence as "unverified". Do not fabricate conclusions.
