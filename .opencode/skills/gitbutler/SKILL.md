---
name: gitbutler
description: Work with GitButler virtual branches, commits, and CLI operations
license: MIT
compatibility: opencode
metadata:
  audience: developers
  workflow: git
---
## What I do

I provide guidance for working with GitButler, a Git client that enables working on multiple virtual branches simultaneously. GitButler uses a patch-based system rather than traditional Git branches.

## Key Concepts

- **Virtual Branches**: GitButler's core feature allowing work on multiple branches simultaneously without git checkout
- **Integration Branch**: The underlying Git branch that GitButler manages (default: `gitbutler/integration`)
- **Butler Flow**: A lightweight branch-based workflow optimized for frequent deployments
- **Unapplied Changes**: Patches that exist but are not currently applied to the working directory

## When to use me

Use this skill when:
- The user wants to work with GitButler in their project
- You need to understand GitButler's CLI commands
- Managing virtual branches and commits
- Understanding the integration branch and how it relates to virtual branches

## Important Rules

1. **Do NOT use standard Git branching commands** (git branch, git checkout, git commit) while using GitButler - use `but` CLI instead
2. **Virtual branches are NOT real Git branches** - they exist only in GitButler's patch system
3. **Always check if GitButler is initialized** in the project before providing guidance
4. **Commits in GitButler are local** until explicitly pushed to a remote

## GitButler CLI Commands

### Branch Management
- `but branch list` - List all virtual branches
- `but branch create <name>` - Create a new virtual branch
- `but branch delete <name>` - Delete a virtual branch
- `but branch apply <name>` - Apply a virtual branch
- `but branch unapply <name>` - Unapply a virtual branch

### Commit Operations
- `but commit create` - Create a commit from current changes
- `but commit amend` - Amend the last commit
- `but commit list` - List commits

### Status and Sync
- `but status` - Show current status of all virtual branches
- `but fetch` - Fetch from remotes
- `but push` - Push virtual branches to remote
- `but pull` - Pull changes from remote

### Integrations
- `but sync` - Sync with remote (fetch + rebase)
- `but integrate` - Integrate branch into another

## Working with Projects Using GitButler

1. Check for `.gitbutler/config.json` to confirm GitButler is in use
2. Use `but status` to understand current state
3. When user wants to create a branch, suggest using `but branch create`
4. When user wants to commit, use `but commit create`
5. Be aware of the integration branch - don't manually modify it

## Common Patterns

### Creating a Feature Branch
```
but branch create feature/my-feature
but branch apply feature/my-feature
# make changes
but commit create -m "Add feature"
but branch unapply feature/my-feature
```

### Stacking Branches
GitButler excels at stacked PRs - create dependent branches:
```
but branch create feature/base
# work and commit
but branch create feature/derived
# work and commit
```

### Syncing with Remote
```
but fetch
but sync
```
