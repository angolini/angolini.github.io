---
title: "Good to know yocto commands"
date: 2024-07-15 17:27:00 +0000
tags: ["Yocto"]
---
### List all the bbappend files

(remember to grep)

```bash
bitbake-layers show-appends
```

### Create the dependency graph for the tasks from a recipe

```bash
bitbake <recipe> -g
```

It generates a file [`task-depends.dot`](http://task-depends.dot) you can open on any text editor, but I’m still working to get it rendered as a graph (as it’s a huge graph).

### Refs:

- https://docs.yoctoproject.org/dev-manual/debugging.html

---

<aside>
<img src="https://www.notion.so/icons/drafts_green.svg" alt="https://www.notion.so/icons/drafts_green.svg" width="40px" /> **Home** **•**  [Pages](https://www.notion.so/Pages-66946fdd3188404796eada6badf1245d?pvs=21) **•**  [e-mail](mailto:angolini@gmail.com) **•**  [github](http://www.github.com/angolini) **•**

</aside>

---