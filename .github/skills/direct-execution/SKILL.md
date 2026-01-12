---
name: direct-execution
description: Fix bug by directly executing build and test commands
license: MIT
---

# Direct Execution Skill

Directly execute build and test commands to identify and fix bugs.

## Commands

### Run test to identify bug
```bash
npm test
```

### Fix the bug
Edit `index.js` to add the missing exclamation mark in the return statement.

### Verify the fix
```bash
npm test
```

## Notes

- Simple and direct approach
- No intermediate files needed
- Quick for small fixes
