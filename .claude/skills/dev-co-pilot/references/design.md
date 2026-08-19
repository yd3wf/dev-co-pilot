# Design

Plan a change before writing code.

## Generate a refactor plan

Design a refactor plan for `[requirement name]`. Do not modify code yet.

Current implementation: `[current status]`
Target: `[target]`

Output:

1. Current flow
2. Target flow
3. Files and methods to modify
4. Impact on database, interfaces, cache, messages, and config
5. How to keep old logic compatible
6. Exception, retry, rollback, and idempotency handling
7. Test scenarios
8. Release and rollback notes
9. Decisions or questions that need confirmation, only when the answer changes
   business behavior, public contracts, or rollback safety

For non-trivial choices, compare the smallest viable alternatives against the
project's existing patterns, implementation cost, compatibility, and verification
cost. Recommend one with evidence; do not manufacture alternatives for a simple
change.

## Minimize the change scope

Based on requirement `[requirement]`, give a minimal-change plan. Explicitly list:

- Files that must change
- Files that may need to change together
- Files that clearly should not change
- Public interfaces and default behaviors that stay unchanged
- How to keep old data, old config, and old callers compatible

Give only the plan first. Do not modify code. Make acceptance criteria observable:
user-visible behavior, contract behavior, data effects, or measurable checks.

## Reference another project's implementation

Reference feature `[feature]` in project A and analyze how to implement it in project B.
Do not copy code directly. Compare:

1. Business flow
2. Interface contract
3. Data structure
4. Config reading approach
5. Exception and state handling
6. Reusable vs. non-reusable parts

Finally, give a refactor plan only for project B, preserving project B's original
entry points and compatibility.
