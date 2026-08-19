# Git

Safe and disciplined Git workflows.

## View current status

First check the current Git status: branch, working-tree changes, untracked files,
local vs. remote differences, and recent commits.

Read-only check. Do not run stash, merge, reset, checkout, commit, or push.
Finally state the current operation risks.

## Pull and resolve conflicts

Sync remote `[branch]` to local and resolve conflicts.

Requirements:

1. First check the current branch and working tree
2. Protect all uncommitted and untracked files
3. Confirm the remote pull succeeds first
4. When conflicts appear, explain both sides' intent per file
5. After resolving, check conflict markers, `git diff`, and the commit graph
6. Do not push
7. If permissions or credentials fail, clearly state that the sync did not complete

## Review change impact

Review the current `git diff`, focusing on:

1. Whether only the target feature changed
2. Whether any unrelated files changed
3. Whether public interfaces, default behavior, or config changed
4. Whether exception, rollback, idempotency, and compatibility logic is missing
5. Whether new tests are needed

Review only. Do not modify code.

## Generate a commit message

Generate a commit message from the `git diff`, including:

1. Purpose of the change
2. Core changes
3. Affected modules
4. Test results
5. Incomplete items and risks

Do not overstate results that were not verified.
