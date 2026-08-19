# Frontend-Backend Contract

Use this reference when a feature crosses the browser/server boundary or when a
request, response, error, enum, rollout, or compatibility question is disputed.

## Find the source of truth

Identify whether the contract is defined by an API specification, server DTOs,
shared types, generated client, or an existing deployed compatibility contract.
Do not assume the newest client type or controller is authoritative without
checking the project's practice and active callers.

## Compare the contract

For each affected request and response field, compare name, type, requiredness,
nullable/absent semantics, format, range, default, enum values, error behavior,
and version compatibility. Trace the field from UI input through serialization,
server validation/conversion, persistence or side effect, and UI rendering.

Also verify HTTP method/path, authentication and ownership expectations,
pagination/filter semantics, duplicate-submit behavior, and success/failure
feedback. Report discrepancies with both client and server code locations.

## Change the contract safely

Prefer additive, tolerant changes when old and new clients may coexist. For a
breaking change, identify all callers, release ordering, feature flags or version
negotiation, rollback behavior, and the exact decision that requires approval.
Keep generated types and handwritten request mapping synchronized according to the
project's established source of truth.

## Verify the integration

Exercise representative requests across the real client and server boundary, or
use the closest available contract/integration test. Cover a valid request, client
validation failure, server validation failure, forbidden/not-found response,
business conflict or duplicate submission, and compatibility behavior when it is
in scope. State any environment-dependent verification still pending.
