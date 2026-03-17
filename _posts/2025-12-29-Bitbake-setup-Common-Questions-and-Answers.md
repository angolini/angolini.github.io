---
title: "Bitbake-setup: Common Questions and Answers"
date: 2025-12-29 00:00:00 +0000
tags: ["Yocto", "bitbake", "bitbake-setup"]
---
## Introduction

A list of common questions I had when I started learning about bitbake-setup.

### 1. BitBake Clone Strategy

**Question:**  Am I downloading BitBake to download BitBake?

**Answer:**
Yes!

The `bitbake-setup` you use to `init` a Setup is different from the BitBake cloned inside the Setup.

You can have one copy of BitBake to init all your Setups. But the BitBake from your project will probably be pinned in a specific version, due to reproducibility requirements. So you will have one copy of BitBake to init, and one copy of BitBake per project.

---

### 2. Directory Preservation

**Question:** What is preserved from the directory where `bitbake-setup init` is executed?

**Answer:**

At first, it may seem like the directory where you call `bitbake-setup init` is important. But in reality, the command will create a new directory for the setup and will not modify the current directory.

The directories created by `bitbake-setup init` are configured by the variables:
`top-dir-prefix`, `top-dir-name`  and `setup-dir-name`. And it's advisable that you understand and decide where to place your setups.


---

### 3. Central sstate-cache and downloads Configuration

**Question:** How to configure sstate-cache and downloads directories to be used in only one central place on the same machine for all builds?

**Answer:**

When you init at least one Setup, it will create a `site.conf` file in the Top Directory. You can edit this file to set the `DL_DIR` and `SSTATE_DIR` variables, and they will be shared across all Setups that are created in that Top Directory.

---

### 4. Metadata Synchronization Command

**Question:** What is the equivalent of `repo sync`?

**Answer:**

So far, what I understand is that there is no equivalent.

The command `bitbake-setup update` will take the latest BitBake Configuration Template, compare it with the current version, and update the meta layers only if needed. However, this will discard any local changes you may have made to the layers and some configurations in the `config/` directory of the Setup.

There are ongoing discussions on the mailing list regarding this topic, and things may change in the future. Take a look at https://lists.openembedded.org/g/bitbake-devel/message/18631
