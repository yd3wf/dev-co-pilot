# Quick One-Liners

Short reusable prompts for the most common tasks.

## Read-only investigation

First search and understand the existing implementation. Read-only analysis; do not
modify code. Provide the call chain, evidence locations, impact scope, and
pending-verification items.

## Plan first

Do not modify code yet. Based on current status, give a minimal-change plan,
compatibility strategy, risks, and acceptance criteria.

## Modify and verify

Modify the specified scope according to the confirmed plan and preserve existing
changes. After finishing, inspect `git diff`, run compile and tests, and report
evidence, unverified items, and residual risks.

## Do not guess

Do not conclude from guessing. Mark every conclusion as confirmed, high-probability,
or pending-verification, and give the corresponding code, log, or test evidence.

## High-risk operation

This is a high-risk operation. First state the impact, goal, rollback method, and
current status. Do not execute until I confirm.
