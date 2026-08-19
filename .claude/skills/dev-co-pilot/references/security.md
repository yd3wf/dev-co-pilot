# Security Review

Read-only security analysis. Do not modify code.

## List security issues only

Perform a read-only security scan of the current codebase. List issues only; do not
provide fixes. Focus on: authentication, authorization, object ownership, client
route guards versus server authorization, unsafe DOM rendering/XSS, SQL
injection, command injection, file upload, path traversal, SSRF, XXE,
deserialization, sensitive information, log leakage, callback signature
verification, config exposure, and dependency risks.

For each issue output: severity, description, evidence file and line, impact scope,
and trigger conditions. Keep only issues supported by code evidence.

## Check permissions and object-level authorization

Check whether interface `[interface name]` has authentication, authorization, or
object-level permission problems. Verify:

1. Whether login is required
2. Whether roles / permissions are checked
3. Whether `userId`, `accId`, `brandId`, `merchantId`, etc. are bound to the current user
4. Whether the service layer and DB queries re-check ownership
5. Whether another user's or merchant's data can be accessed

Give the full call chain and evidence locations. Do not modify code.
