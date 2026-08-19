# Engineering Review

Use this reference to review a diff, pull request, generated patch, or proposed
implementation. Review for behavior and operability, not for cosmetic preferences.

## Review order

1. Restate the intended behavior and identify the changed entry points, callers,
   data writes, async effects, and public contracts.
2. Check whether the implementation preserves existing invariants: validation,
   ownership, state transitions, idempotency, transaction boundaries, and error
   semantics.
3. For frontend changes, inspect state ownership, request/result mapping,
   loading/error/empty states, duplicate actions, route/permission behavior, and
   accessible interaction where relevant.
4. For backend changes, inspect authorization at the data boundary, null/default
   semantics, concurrent or retry behavior, persistence changes, external side
   effects, diagnostics, and compatibility.
5. Check that tests prove the changed behavior rather than merely executing the
   new lines. Identify the smallest missing test that could expose a real defect.

## Findings

Report only actionable findings supported by code evidence. For each finding give:
severity, concrete failure scenario, evidence location, and the minimal correction.
Do not invent risks without a reachable path. Separate non-blocking improvements
from bugs, and say clearly when the review found no supported blocking issue.
