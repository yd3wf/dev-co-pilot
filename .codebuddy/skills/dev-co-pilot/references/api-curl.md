# API & curl

Generate and analyze interface requests.

## Generate an interface request

Generate a curl for test interface `[interface name]` based on the code. First confirm:

1. context-path
2. HTTP method
3. URL
4. Required headers
5. Auth method
6. Request body field types and meanings
7. Success and failure responses

Use placeholders such as `[TOKEN]`, `[COOKIE]`, `[PRIVATE_KEY]` for sensitive values.
Do not output real credentials.

## Compare front-end and back-end interfaces

Compare the front-end call and the back-end interface definition. Check: parameter
names, types, required flags, default values, enum values, headers, return structure,
error codes, and compatibility. Output the inconsistent items and their code locations.
Do not modify code.

## Analyze a payment interface

Map the complete chain of the `[payment / refund / query]` interface, distinguishing:

1. Request parameter assembly
2. Signing and signature verification
3. Business-field encryption / decryption
4. Source of merchant config
5. Request sending
6. Callback handling
7. State updates and idempotency
8. Failure retry and compensation

Clearly distinguish "signing" from "encryption" and reference concrete code locations.
