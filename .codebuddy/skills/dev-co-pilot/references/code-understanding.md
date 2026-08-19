# Code Understanding

Read-only analysis prompts for locating and explaining code. Do not modify code during this phase.

## Find the feature entry

Locate the complete implementation of `[feature name]` in the current project. Output:

1. External interfaces and entry files
2. Controller / Service / Repository or Mapper call chain
3. Database tables, cache, messages, and external interfaces involved
4. Success and failure flows
5. Key files, classes, methods, and line numbers

This round is read-only analysis. Do not modify code.

## Explain a piece of code

Explain the role of `[class name / method name]` in `[file path]`. Structure the answer:

1. Input parameters
2. Core processing steps
3. Data changes
4. External dependencies
5. Exceptions and edge cases
6. Possible risks

Reference concrete code locations. Do not give conceptual-only descriptions.

## Find callers of an interface

Search all callers of `[interface path / method name]`. Distinguish:

- Frontend calls
- Backend internal calls
- Scheduled task or message calls
- Test calls

For each caller, state the key parameters passed and the impact of changing the interface.

## Generate a module map

Organize `[module name]` into a development document covering: directory structure,
core entries, main interfaces, key classes, database tables, cache, messages,
external dependencies, config items, exception handling, and testing approach.
End with a concise call chain or module relationship diagram.
