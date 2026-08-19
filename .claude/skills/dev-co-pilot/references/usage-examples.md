# Usage Examples

Realistic example prompts for each scenario. Copy, adapt the `[...]` placeholders
to your project, and send. These show how the skill should be triggered in natural
language.

## Code understanding

**Find the feature entry**

```
Locate the complete implementation of "order creation" in this project.
Output:
1. External interfaces and entry files
2. Controller / Service / Repository call chain
3. Involved tables, cache, messages, and external interfaces
4. Success and failure flows
5. Key files, classes, methods, and line numbers
Read-only analysis. Do not modify code.
```

## Refactor query

**Query the full business chain before refactoring**

```
Query the complete business chain of "merchant version upgrade" to prepare for
refactoring. Analyze entry points, participating roles, main flow, branch flows
(fail/cancel/retry/timeout/compensation), data changes, external dependencies,
and final results. Give files, classes, methods, and code locations.
Read-only query. Do not modify code.
```

## Troubleshooting

**Locate a problem from logs**

```
Investigate why "payment callback fails intermittently" based on these logs.
Symptom: ...
Reproduction steps: ...
Logs: ...
Analyze: which stage, trigger entry, data flow, whether transaction/cache/async/
callback is involved, code evidence, and separate confirmed / high-probability /
pending-verification issues. Investigation only, do not modify code.
```

## Design

**Generate a refactor plan**

```
Design a refactor plan for "refund deadline change". Do not modify code yet.
Current implementation: refund allowed within 24h after payment.
Target: refund allowed within 7 days, must notify merchant.
Output current flow, target flow, files/methods to change, impact on DB/interface/
cache/messages/config, compatibility strategy, exception/retry/rollback/idempotency
handling, test scenarios, release notes, and questions to confirm.
```

## Code modification

**Fix a clear bug**

```
Fix bug: "order status stuck at PAID after payment callback succeeds".
Reproduction: pay via test card, callback returns 200 but DB status stays PAID.
Expected: order becomes PAID and refund window starts.
Requirements: locate root cause with evidence, minimal fix, modify code, add a
test covering this scenario, verify normal/error/boundary, output changed files
and test results.
```

## Testing

**Generate a test checklist**

```
Generate a test checklist for "refund feature" covering normal flow, empty/malformed/
boundary params, insufficient permission, duplicate refund, third-party timeout and
retry, transaction rollback, cache/message consistency, and old-data compatibility.
For each item: preconditions, steps, expected result, key verification points.
```

## Git

**Review change impact**

```
Review the current git diff. Focus on: whether only the target feature changed,
any unrelated changes, whether public interfaces/default behavior/config changed,
whether exception/rollback/idempotency/compatibility logic is missing, and whether
new tests are needed. Review only, do not modify code.
```

## API & curl

**Generate an interface request**

```
Generate a curl for the "refund" test interface based on the code. First confirm
context-path, HTTP method, URL, required headers, auth method, request body field
types and meanings, success/failure responses. Use [TOKEN]/[COOKIE] placeholders,
never output real credentials.
```

## Security

**Check permissions and object-level authorization**

```
Check whether the "get order detail" interface has authentication, authorization,
or object-level permission problems. Verify login requirement, role checks, whether
userId/merchantId is bound to the current user, whether service/DB re-check ownership,
and whether another user's data can be accessed. Give the full call chain and
evidence locations. Do not modify code.
```

## Release

**Generate a release plan**

```
Generate a release plan for "refund deadline change" including pre-release checks,
DB/config changes, release order, canary/feature-flag strategy, monitoring metrics
and log keywords, verification steps, rollback conditions, rollback actions, and
post-release observation items. Separate mandatory vs optional items.
```

## Docs & summary

**Generate a troubleshooting doc**

```
Turn the "payment callback intermittent failure" investigation into a troubleshooting
doc: symptom, impact scope, trigger conditions, investigation path, key logs, root
cause, handling, verification, rollback, and prevention. Base on confirmed code/logs/
tests; mark speculation separately.
```

## Maintenance

**Add missing tests**

```
Check the core business logic of the "order module" and find scenarios with
insufficient test coverage. Prioritize normal flow, boundary values, repeated calls,
exception rollback, permission checks, third-party failures, duplicate message
consumption, and old-data compatibility. Output concrete test cases, prerequisite
data, steps, and expected results. Do not modify production code yet.
```

## Quick one-liner

```
First search and understand the existing implementation. Read-only analysis; do not
modify code. Provide the call chain, evidence locations, impact scope, and
pending-verification items.
```
