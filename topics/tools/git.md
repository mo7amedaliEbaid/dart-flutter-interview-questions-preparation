## https://git-scm.com/docs/git#_git_commands

# What is Git?
- Git is a distributed version control system that helps developers manage and track changes in their source code during software development. It is widely used for collaborative development and is an essential tool for version control.

## Basic Concepts:
### Repository (Repo):

- A Git repository is a collection of files and the entire history of changes made to those files. It can be local (on your machine) or remote (on a server).
### Commit:

- A commit is a snapshot of the changes made to the files in the repository at a specific point in time. Commits are like milestones in the project's history.
### Branch:

- A branch is a parallel version of the code. It allows developers to work on different features or bug fixes independently without affecting the main codebase. The main branch is often called master or main.
### Merge:

- Merging is the process of combining changes from one branch into another. It's typically done to incorporate the changes made in a feature branch back into the main branch.

## Basic Commands:
### Initialize a Repository:
```
git init
```
- Initializes a new Git repository in the current directory.
### Clone a Repository:
```
git clone <repository_url>
```
- Creates a copy of a remote repository on your local machine.
### Check Status:
```
git status
```
- Shows the status of changes as untracked, modified, or staged.
### Add Changes:
```
git add <file_name>
```
- Adds changes to the staging area in preparation for a commit.
### Commit Changes:
```
git commit -m "Commit message"
```
- Commits the changes with a descriptive message.

### Push Changes:
```
git push origin <branch_name>
```
- Pushes local commits to a remote repository.
### Pull Changes:
```
git pull origin <branch_name>
```
- Fetches changes from a remote repository and merges them into the local branch.
### Create Branch:
```
git branch <branch_name>
```
- Creates a new branch.
### Switch Branch:
```
git checkout <branch_name>
```
- Switches to a different branch.
### Merge Branch:
```
git merge <branch_name>
```
- Merges changes from one branch into another.

##### These are just a few basic commands to get you started with Git. Git offers a wide range of functionalities, including handling conflicts, reverting changes, and collaborating with others. Understanding these basics will provide a solid foundation for using Git in your development workflow.

