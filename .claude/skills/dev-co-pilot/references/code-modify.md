# Code Modification

For a clear implementation request, state the concise approach and file scope,
then modify. Stop for a material unresolved business, public-contract, or
destructive-operation decision.

## Modify according to the confirmed plan

Modify code according to the plan confirmed just now.

Requirements:

1. Only modify files within the confirmed scope
2. Preserve existing uncommitted changes
3. Do not change unrelated functionality
4. Keep compatibility for old callers
5. Add proportionate error handling, diagnostics, and tests for the changed path
6. After finishing, list the changes made in each file

After modifying, do not commit or push unless explicitly requested.

## Fix a clear bug

Fix bug: `[problem description]`.

Reproduction conditions: `[conditions]`
Expected result: `[result]`
Actual result: `[result]`

Requirements:

1. First locate the root cause and explain the evidence
2. Give the minimal fix plan
3. Modify the code
4. Add or adjust tests covering this scenario
5. Verify normal, error, and boundary scenarios
6. Output changed files, test command, and results

## Refactor while keeping behavior unchanged

Refactor `[file/module]` to improve readability and maintainability while keeping
current business behavior unchanged.

Requirements:

1. First list current behaviors and implicit rules
2. Do not change interfaces, return values, exception semantics, or database behavior
3. Do not expand the scope
4. Preserve logs and key instrumentation
5. Compile and run regression tests after modifying
6. Compare behavior differences before and after refactoring

## Add compatibility logic

Add compatibility logic for `[new field / new config / new channel]`.

Rules:

- When the new value exists: `[new behavior]`
- When the new value does not exist: `[old behavior]`
- Old data must not error
- Old callers keep working without changes

Check read paths, default values, validation, persistence, cache, and rollback paths,
and add corresponding tests.
