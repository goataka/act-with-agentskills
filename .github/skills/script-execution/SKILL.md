---
name: script-execution
description: Fix bug by creating and executing a shell script
license: MIT
---

# Script Execution Skill

Create a shell script with commands, then execute it to fix bugs.

## Commands

### Create test script
```bash
cat > test.sh << 'EOF'
#!/bin/bash
npm test
EOF
chmod +x test.sh
```

### Execute script to identify bug
```bash
./test.sh
```

### Fix the bug
Edit `index.js` to add the missing exclamation mark.

### Verify with script
```bash
./test.sh
```

## Notes

- Reusable script for repeated testing
- Can be version controlled
- Good for complex command sequences
