---
marp: true
title: Advanced Git Techniques
theme: haskell
class: lead
paginate: true
---

# Advanced **Git**
###### A history of conflicts among branches

---

# Git **rebase**

###### *Rewritting history since 2005*

---

## **What** is rebase?

> _Reapply commits on top of another base tip_

---

## So... **why** rebase?

- Modifying broken commits, ergo eliminating bugged commits

- Rearranging content between commits, ergo more meaningful commits

- Keeping a clean history, ergo... clean history :)

---

## **How** do I rebase?

```
           --A---B---C topic
         /
    D---E---F---G master


$ git checkout topic
$ git rebase master topic


                   --A'--B'--C' topic
                 /
    D---E---F---G master
```

---

### The powerhouse: **interactive** rebase

- The power to rewrite history literally: it allows you to alter commits rather than only moving them.

- It’s based on `git commit --amend`

- Interactive mode further allows you to also squash the commits, for a cleaner history.

---

### Rebasing **caveats**

- Rewrites history – careful with rebasing on public branches

- Merge conflicts are more frequent

- Commits can be lost in interactive mode

---

## Git **merge**

###### *Eventually, all rivers lead to the sea*

---

### **What** is merge?

> _Join two or more development histories together_

---

### What's the **difference** with rebase?

- Merge commits are unique against other commits in the fact that they have two parent commits.

- History is completely preserved, instead of rewritting it.

---

### **Why** would I want to merge?

- Incorporate the commits from the named branch into the current branch without loosing history

---

### **Merging** in a nutshell

```
          A---B---C topic
        /
    D---E---F---G master

$ git checkout master
$ git merge topic

          A---B---C topic
        /         \
    D---E---F---G---H master
```

---

## Further **details**

*Git merge will combine multiple sequences of commits into one unified history. [...] git merge takes two commit pointers, usually the branch tips, and will find a common base commit between them. Once Git finds a common base commit it will create a new "merge commit" that combines the changes of each queued merge commit sequence.*

- If a piece of data that is changed in both histories git will be unable to automatically combine them.

- Fast-forward vs 3-way merge
