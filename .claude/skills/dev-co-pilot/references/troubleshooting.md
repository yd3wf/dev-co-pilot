# Troubleshooting

Read-only investigation prompts. Do not modify code during this phase.

## Locate a problem from logs

Investigate `[problem description]` based on the following symptoms and logs.

Symptom: `[symptom]`
Reproduction steps: `[steps]`
Logs: `[logs]`

Analyze in order:

1. Which stage the symptom occurs in
2. What the trigger entry is
3. How parameters and data flow
4. Whether transactions, cache, async, messages, or callbacks are involved
5. Code locations that prove the conclusion
6. Confirmed, high-probability, and pending-verification issues separately

This round is investigation only. Do not modify code.

## Investigate a browser-to-server failure

Investigate `[page/action]` that fails or displays incorrect data. Trace browser
event -> component state -> request construction -> Network request/response ->
server entry -> business/data path -> response mapping -> rendered state. Check
console errors, stale state, request cancellation, client validation, HTTP status,
contract mismatches, authorization, and sanitized correlation IDs. Separate the
first proven failure from downstream symptoms. Do not modify code.

## Investigate abnormal interface responses

Investigate why interface `[interface URL]` returns `[error symptom]`.

Known info:

- Request params: `[params]`
- Response: `[response]`
- Request time: `[time]`
- Environment: `[dev / test / prod]`
- Business ID: `[ID]`

Check: parameter validation, permissions, database queries, transactions, cache,
third-party interfaces, exception catching, and return-value conversion.
Provide evidence locations and the minimal reproduction method. Do not modify code.

## Investigate data inconsistency

Investigate data inconsistency between system A and system B.
Trace the chain: write source -> transaction commit -> event/message -> async
consumer -> target system -> cache/index refresh. Confirm:

1. Whether a message is sent before the transaction commits
2. Whether messages are lost, consumed twice, or fail
3. Whether filter conditions, whitelists, or time ranges exist
4. Whether cache or ES lag exists
5. How to further verify using logs, databases, and interfaces

## Investigate async task or message issues

Investigate why `[task/message name]` did not run, ran twice, or produced wrong results. Check:

1. Where the producer sends it
2. Where Topic, queue, partition, and consumer are configured
3. Whether the consumer received the message
4. Offset, retry, exception, and dead-letter handling
5. Idempotency and transaction boundaries
6. Whether the final business result is persisted or refreshed to the target system

Output the full sequence and the most likely failure points. Do not modify code.

## Find root cause from a stack trace

Analyze the exception stack trace below. Do not only explain the outermost exception.

Stack trace: `[stack]`

Output:

1. The first business-code location
2. The direct cause of the exception
3. What abnormal data the upstream passed in
4. Why the existing code did not block it
5. Which business scenarios may be affected
6. Recommended verification steps
