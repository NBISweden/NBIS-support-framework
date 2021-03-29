# Contributing to NBIS-SF

To contribute, first create a new feature branch to work on. The `master`
branch should always be deployable, and any new feature should ideally have
been tested before merging it into master. 

```bash
# Clone NBIS-SF
git clone https://github.com/NBISweden/NBIS-support-framework
cd NBIS-support-framework

# Checkout a new feature branch
git checkout -b <branch>

# Code, commit changes and push to origin when ready
git push origin <branch>
```

Commit messages should contain relevant information regarding the feature(s)
you have added, what type of analyses they can be used for, *etc.*. The subject
line should be written in an imperative mood and be 50 characters or less,
while the body should be wrapped at 72 characters. The subject and body should
be separated by a blank line, start with a capital letter, and the subject line
should not end with a period. You can read more about good commit messages
[here][git-commits].

Once you have pushed your code to `origin <branch>`, open a new pull-request at
GitHub. The code will then be reviewed and subsequently merged into `master`,
at which point other people can start using it as well.

[git-commits]: https://chris.beams.io/posts/git-commit/
