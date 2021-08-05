# Git CheatSheet
---

## Config Git
```git config --global user.name 'name'```
```git config --global user.email 'email'```

```git config --list```

## Help
```git config --help```
```git config --help```

## Initializing Repository

initialize variable
```git init```

##  Show Filese staged for commit
```git status```

## Adding Files
```git add .gitnore```
```git add <file>```
```git status```

Using git reset after add will put things back to normal and remove them from the staging area
```git reset```


```git commit -m 'message'```
Return last log file/action ```git log```

## Cloning

```git clone <url> <where>```
```git clone https://www.github/randomuser/randomrepo```

## Remote
Lists remote branches
```git remote -v```
List all branches
```git branch -a```

Find changes made to code compared to repo
```git diff```
```git add -A```
```git commit -m 'msg <file>'```

## Pushing Changes
```git push -u origin main``` 
```git pull origin main``` OR ```git pull origin master```
```git push origin main``` OR ```git push origin master```

## Overall Workflow
List local branches
```git branch <branchname>```
Start working on a different branch
```git checkout <branchname>```

## Note
- .gitignore will just ignore all types of files listed inside of it. This is important for personalization and things that should not be sharehttps://www.github/randomuser/randomrepo```
- 3 stages: Working Directory, Staging Area, Git Directory (Repository)
    - commit from the staging area! Commits should be detailed about what stages are made

## Merging Branches

```git checkout main```
```git pull origin main```
```git branch --merge``` 
```git merge <local_branchname>```
```git push origin master```

## Deleting old Merged Branch
```git branch --merge```
```git branch -d <local_branchname>```
```git branch -a``` 
```git push origin --delete <local_branchname>```
