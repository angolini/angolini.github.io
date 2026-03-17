---
title: "bitbake-setup: Preparing for Wrynose"
date: 2026-02-02 00:00:00 +0000
tags: ["yocto", "bitbake", "bitbake-setup"]
---
## Introduction

`bitbake-setup` has been around since YP 5.3 (Whinlatter). Although it is still under development, the goal is to have a tool to automate the initialization and management of Yocto Project build environments, and of course, a way to better share local configurations.

Let's see the main changes that `bitbake-setup` will bring to Yocto Project 6.0 (Wrynose).

### New Scripts

Basically:
- `bitbake-setup`: to initialize the setup
- `bitbake-config-build`: to configure the build environment (enable and disable builds)

### A New Configuration File (`.conf.json`)

This file is a template used to describe the setup and available options. It lists the sources and provides a template for the available configuration. The parts of this document are:
- sources: list of git repositories to clone
- distros: list of available distros (or the list of distros I want to include in the template)
- machines: list of available machines (or the list of machines I want to include in the template; depending on the BSP meta-layer, it can have dozens of machines, but the template can include only a few of them)
- BitBake configurations: a set of fragments or other configuration to include in the setup

### Fragments

We already have the concept of fragments to configure kernel, U-Boot, and BusyBox, for example. Now, with `bitbake-setup`, we can group BitBake configurations into fragments that can be enabled or disabled.

I personally like the idea of fragments as we can group variable settings into one fragment and then enable or disable it as needed. I'm sure there will be confusion about what a fragment is versus what a distro is, but after getting used to the new concepts it will become clearer.

### Suggested New Directory Structure and Configuration Organization

The new workspace layout proposed by the Yocto Project through the use of `bitbake-setup` is as follows:

```
Top Directory
├── site.conf
├── Setup 1
│   ├── build/
│   ├── config/
│   └── layers/
└── Setup 2
    ├── build/
    ├── config/
    └── layers/
```

After running `bitbake-setup init` with default choices, the created layout looks like:

```
./bitbake-builds/
├── site.conf
└── poky-master-poky-distro_poky-machine_qemux86-64/
    ├── build/
    ├── config/
    └── layers/
```

Where:
- **build/**: where BitBake stores configuration and build outputs
- **config/**: holds specific configuration embedding generic configuration and initialization choices
- **layers/**: stores layers and repositories managed by bitbake-setup
- **site.conf**: BitBake configuration file with site-specific settings shared across setups

(as documented in the BitBake User Manual)

For me, this means the Yocto Project decided to suggest a directory structure for different builds. If you are used to building and maintaining only one configuration, this will not change much. But if you are used to maintaining multiple configurations, the suggested structure not only organizes the directories, but also indicates that not only the build folder is different per configuration, but the source code will be cloned per configuration as well (there are ways to avoid this, but this is the default behavior).

## Compatibility Notes

**Important:** As far as I understand, `bitbake-setup` is not backport compatible and will **not work on Scarthgap** or earlier releases.

However, if you already have an existing repository setup or are using tools like `kas` or `repo`, your current workflow will work as usual.

Fragments are a new optional concept - you are not required to use them. Your existing configurations will continue to work.
