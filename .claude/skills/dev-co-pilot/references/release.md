# Release

Plan and verify releases.

## Generate a release plan

Generate a release plan for feature `[feature name]` including:

1. Pre-release checks
2. Database and config changes
3. Release order
4. Canary / feature-flag strategy
5. Monitoring metrics and log keywords
6. Verification steps
7. Rollback conditions
8. Rollback actions
9. Post-release observation items

Distinguish mandatory items from optional ones.

## Generate release acceptance criteria

Generate executable release acceptance criteria for `[feature name]`.
Output as "check item / operation / expected result / failure handling / owner".
Must cover normal, error, rollback, compatibility, and monitoring scenarios.
