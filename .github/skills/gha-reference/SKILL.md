---
name: gha-reference
description: Use GitHub Actions workflow as reference, execute directly
license: MIT
---

# GitHub Actions Reference Skill

Reference the GitHub Actions workflow, then execute commands directly.

## Commands

### View workflow steps
```bash
cat .github/workflows/build-test.yml
```

### Execute commands from workflow manually
```bash
npm install
npm run build
npm test
```

### Identify and fix the bug
Edit `index.js` to add the missing exclamation mark.

### Verify directly
```bash
npm test
```

## Notes

- Workflow serves as reference documentation
- No act/Docker requirement
- Fast local execution
- Good for development iteration
