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


---

## CI/CD Pipeline

A CI/CD pipeline automates the process of integrating code changes, testing them, and deploying to production.

### Key Concepts

- **Version Control**: Git to track code changes.
- **Build Automation**: Jenkins, Travis CI, GitHub Actions, CircleCI.
- **Testing Automation**: Unit tests, integration tests, end-to-end tests.
- **Deployment Automation**: Kubernetes, Docker, Terraform.

### Best Practices

- **Pipeline as Code**: Define pipelines in YAML files (version-controlled).
- **Incremental Changes**: Deploy small changes to reduce risk.
- **Monitoring and Logging**: Catch issues in production.
- **Rollback Strategies**: Plan for reverting bad deployments.
- **Infrastructure as Code (IaC)**: Terraform, Ansible, CloudFormation for infrastructure management.

### CI/CD Metrics (DORA)
- Deployment frequency.
- Lead time for changes.
- Mean time to recovery (MTTR).
- Change failure rate.

---

## Development and Production Branches

- **Development branch** (`develop` / `dev`): Where active development happens. Feature branches are merged here. Less stable.
- **Production branch** (`main` / `master`): The stable branch representing the latest release.

Typical GitFlow:
1. Create feature branches from `develop`.
2. Merge completed features back into `develop`.
3. Merge `develop` into `main` for releases.

---

## Deploying a Flutter App

### Google Play Store
1. Create a Google Play Developer account.
2. Create a signing key.
3. Configure the app (signing, metadata).
4. Submit for review.
5. Publish.

### Apple App Store
1. Create an Apple Developer account.
2. Create a signing certificate and provisioning profile.
3. Configure the app (bundle ID, capabilities).
4. Submit via Xcode or Transporter for review.
5. Publish.

### TestFlight (iOS Beta Testing)
TestFlight is Apple's service for over-the-air installation and testing of iOS apps. Developers distribute to internal or external beta testers who can send feedback. The TestFlight SDK provides remote logs, crash reports, and tester feedback.

### Shorebird (Code Push / OTA Updates)
Shorebird allows deploying new Flutter app versions directly to users' devices without going through the app stores.

Components:
1. **shorebird CLI**: Command-line tool for building and deploying updates.
2. **Modified Flutter engine**: Included in the app.
3. **Public-cloud infrastructure**: Hosts app updates.

