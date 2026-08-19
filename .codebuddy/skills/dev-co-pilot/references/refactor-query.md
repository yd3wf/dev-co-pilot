# Refactor Query

Before refactoring, complete four steps: business query -> status confirmation ->
impact analysis -> refactor plan. Do not jump straight into coding.

## Query the full business chain

Query the complete business chain of `[feature name]` to prepare for refactoring. Analyze:

1. Business entry: page, interface, scheduled task, message, or external callback
2. Participating roles: user, merchant, operator, system task, etc.
3. Main flow: full steps from start to end
4. Branch flows: success, failure, cancel, retry, timeout, and compensation
5. Data changes: tables, fields, states, and key IDs involved
6. External dependencies: payment, SMS, messages, ES, cache, or third-party interfaces
7. Final result: what the user sees and what the system ultimately saves

Provide files, classes, methods, interfaces, and key code locations.
This round is read-only query. Do not modify code.

## Analyze how a business action is completed

Analyze how `[e.g. merchant purchases a version / user applies for refund / product is stocked]` is completed.
Answer in this format:

- Trigger condition
- Precondition
- Core steps
- State changes
- Data written
- Async tasks or messages
- External interfaces
- Success result
- Failure result
- Retry and compensation
- Idempotency handling

Distinguish behaviors confirmed in code from behaviors inferred by naming.

## Extract business rules and implicit constraints

Extract the business rules of `[business feature]` from code, config, database, and tests. Identify:

1. Required conditions and precondition states
2. State transitions and irreversible-state rules
3. Limits on amount, quantity, time, and count
4. Data ownership rules for user, merchant, brand, store, etc.
5. Handling of duplicate submission, duplicate refund, duplicate consumption
6. Fields kept only for backward compatibility with old data
7. Rules that exist only in code with no documentation

Output as "rule / code evidence / affected scenario / whether refactor needed".

## Query the state machine

Map out the state machine of `[order / payment / refund / task]`. Output:

1. All states and their meanings
2. Entry condition for each state
3. Allowed state transitions
4. Disallowed state transitions
5. Which interfaces, tasks, or callbacks change state
6. Handling when a state update fails
7. Risk of duplicate callbacks or concurrent updates

End with a table: "current state -> trigger action -> target state -> evidence location".

## Query the front-end to back-end chain

Starting from page `[page name / button name]`, trace to the back end and data layer.
Locate in order: page component -> request method -> interface URL -> Controller ->
Service -> database / cache / message -> returned result. State:

- Which parameters the front end passes
- How the back end validates and converts
- Which fields the back end fills in
- Which exceptions are returned directly to the front end
- What the front end and back end each need to change

## Trace data provenance and destination

Trace the full data flow of field `[field name]` or business ID `[ID name]`. Answer:

1. Where it is first created
2. Through which interfaces, services, and objects
3. Written into which database tables
4. Whether it enters cache, ES, Kafka, or other message systems
5. Which places modify it
6. Where it is finally queried or displayed
7. Any field renaming, type conversion, or default values

Provide the data flow and the code location of each node.

## Query refactoring impact scope

I plan to refactor `[feature / business rule]`. First analyze the impact scope without modifying code. Check:

1. External interfaces and frontend callers
2. Internal services and shared methods
3. Database tables, fields, indexes, and historical data
4. Cache, messages, ES, and async tasks
5. Scheduled tasks, callbacks, and compensation logic
6. Permissions, logging, monitoring, and alerts
7. Tests, scripts, and config files
8. Callers in other projects or modules

Classify results into: must change together / needs verification / should not change.

## Compare current status and refactor target

Compare the current and target implementation of `[feature name]`.

Current implementation: `[description]`
Target implementation: `[description]`

Output:

1. Current flow and target flow
2. Business rule changes
3. Data structure changes
4. Interface and caller changes
5. How to keep old logic compatible
6. Data that needs migration or compensation
7. Possible regression issues
8. Phased refactor suggestions

## Check for similar existing implementations

Find implementations similar to `[target feature]` in the current project and related projects.
Do not only search by class name; also search by: business keywords, interface paths,
database tables, state values, config items, log keywords, and external channel names.

Compare each candidate's: business scenario, call chain, data structure, exception
handling, compatibility strategy, and reusability. State which can be reused, which
can only be referenced, and which may have legacy defects.

## List questions to confirm before refactoring

Based on current code and business status, list questions that must be confirmed
before refactoring `[feature name]`. Cover at least: business rules, legacy data,
legacy interfaces, permissions, concurrency, idempotency, transactions, cache,
messages, third-party dependencies, rollback, and release switches.

Output as "question / why it must be confirmed / whether an answer exists now / who confirms it".
Do not assume answers where there is no evidence.

## Generate a pre-refactor business spec

Turn `[feature name]` into a pre-refactor business spec for development review. Must include:

1. Business background
2. Current flow
3. Current rules
4. Current system implementation
5. Known issues
6. Refactor target
7. Out-of-scope content
8. Affected modules
9. Open questions
10. Acceptance criteria

All conclusions must trace back to code, logs, data, or confirmed business info.
