---
name: script-reference
description: Create shell script as reference, then execute commands directly
license: MIT
---

# Script Reference Skill

Create a shell script as documentation, then execute commands directly.

## Commands

### Create reference script
```bash
cat > test-reference.sh << 'EOF'
#!/bin/bash
# Reference script - commands to run manually
npm test
EOF
```

### View reference and execute directly
```bash
cat test-reference.sh
npm test
```

### Fix the bug
Edit `index.js` to add the missing exclamation mark.

### Verify directly
```bash
npm test
```

## Notes

- Script serves as documentation
- Flexibility to modify commands on-the-fly
- Useful for learning and understanding
