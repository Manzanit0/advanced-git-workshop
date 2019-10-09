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

> *Reapply commits on top of another base tip 

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


$ git rebase master
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
