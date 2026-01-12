---
name: gha-execution
description: Fix bug using GitHub Actions workflow with act
license: MIT
---

# GitHub Actions Execution Skill

Use act to run GitHub Actions workflow for bug identification and verification.

## Prerequisites

- act must be installed
- Docker must be running

## Commands

### Execute workflow with act
```bash
act -j build-and-test
```

### Identify bug from workflow output
The test step will fail and show the bug.

### Fix the bug
Edit `index.js` to add the missing exclamation mark.

### Verify with act
```bash
act -j build-and-test
```

## Notes

- Tests in CI-like environment
- Ensures workflow correctness
- Requires act and Docker setup
