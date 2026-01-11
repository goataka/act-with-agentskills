---
name: build-and-test
description: Build and test the Node.js application using act
license: MIT
---

# Build and Test Skill

This skill uses `act` to run the GitHub Actions workflow locally for building and testing the Node.js application.

## Prerequisites

- act must be installed ([installation guide](https://github.com/nektos/act#installation))
- Docker must be running (required by act)

## Commands

### Run build and test workflow with act
```bash
act -j build-and-test
```

This command:
- Runs the `build-and-test` job from `.github/workflows/build-test.yml`
- Executes in a containerized environment (similar to GitHub Actions)
- Installs dependencies, builds, and tests the application

### Alternative: Run all workflow triggers
```bash
act push
```

## Notes

- Requires act installed and Docker running
- First run may take time to pull Docker images
- Uses the GitHub Actions workflow defined in `.github/workflows/build-test.yml`
