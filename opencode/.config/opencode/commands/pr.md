---
description: Create a PR plan with title, description, and checklist
agent: plan
---

Analyze the current git state and generate a comprehensive pull request plan.

**Git State:**
- Current branch: !`git branch --show-current`
- Base branch: !`git merge-base HEAD origin/main 2>/dev/null || git merge-base HEAD origin/master 2>/dev/null || git merge-base HEAD main 2>/dev/null || git merge-base HEAD master 2>/dev/null || echo "main"`
- Commits not on base: !`git log --oneline --all --not $(git merge-base HEAD origin/main 2>/dev/null || git merge-base HEAD origin/master 2>/dev/null || git merge-base HEAD main 2>/dev/null || git merge-base HEAD master 2>/dev/null || echo main) 2>/dev/null || git log --oneline -20`
- Changed files: !`git diff --stat $(git merge-base HEAD origin/main 2>/dev/null || git merge-base HEAD origin/master 2>/dev/null || git merge-base HEAD main 2>/dev/null || git merge-base HEAD master 2>/dev/null || echo main)..HEAD 2>/dev/null || git diff --stat`

**PR Plan Output:**

## Title
[Suggested PR title based on primary commit message]

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

### Checklist
- [ ] Tests pass
- [ ] Documentation updated
- [ ] No linting errors
- [ ] PR title follows conventions
- [ ] Reviewers assigned

### Labels
- `aw` (required)

**Note:** If label `aw` does not exist in the repository, create it.
