---
description: Create a PR plan with title, description, and checklist
agent: build
---

Analyze the current git state and generate a comprehensive pull request plan.

**Git State:**
- Current branch: !`git branch --show-current`
- Branch tracking: !`git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null || echo "None"`
- Branch exists remotely: !`git ls-remote --heads origin $(git branch --show-current 2>/dev/null) 2>/dev/null | grep -c . || echo "0"`
- Base branch: !`git merge-base HEAD origin/main 2>/dev/null || git merge-base HEAD origin/master 2>/dev/null || git merge-base HEAD main 2>/dev/null || git merge-base HEAD master 2>/dev/null || echo "main"`
- Commits not on base: !`git log --oneline --all --not $(git merge-base HEAD origin/main 2>/dev/null || git merge-base HEAD origin/master 2>/dev/null || git merge-base HEAD main 2>/dev/null || git merge-base HEAD master 2>/dev/null || echo main) 2>/dev/null || git log --oneline -20`
- Changed files: !`git diff --stat $(git merge-base HEAD origin/main 2>/dev/null || git merge-base HEAD origin/master 2>/dev/null || git merge-base HEAD main 2>/dev/null || git merge-base HEAD master 2>/dev/null || echo main)..HEAD 2>/dev/null || git diff --stat`

**Branch Status:**
!`BRANCH=$(git branch --show-current 2>/dev/null); if git ls-remote --heads origin "$BRANCH" >/dev/null 2>&1 && [ "$(git ls-remote --heads origin "$BRANCH" 2>/dev/null | grep -c .)" -gt 0 ]; then echo "✅ Branch exists and is tracking remotely."; else echo "⚠️ No branch exists. Create one from the base branch:

1. Create and checkout new branch:
   ```bash
   git checkout -b <type>/<short-description> <base-branch>
   ```

2. Push and set upstream tracking:
   ```bash
   git push -u origin <type>/<short-description>
   ```

3. Verify branch creation:
   ```bash
   git branch -vv
   ```

**Branch types (conventional commits):**
- `feat/` - New feature
- `fix/` - Bug fix
- `chore/` - Maintenance tasks
- `docs/` - Documentation changes
- `refactor/` - Code refactoring
- `test/` - Test additions/changes
- `ci/` - CI configuration changes
- `build/` - Build system changes

**Example:**
```bash
git checkout -b feat/add-login main
git push -u origin feat/add-login
```

**PR Plan Output:**

## Title
[Suggested PR title based on primary commit message using conventional commits]

## Description

### Summary
[Brief overview of what this PR changes]

### Changes
- [List of files modified]
- [Key changes per file]

### Testing
- [Test coverage notes]
- [Manual testing requirements]

### Breaking Changes
- [Any breaking changes, or "None"]
