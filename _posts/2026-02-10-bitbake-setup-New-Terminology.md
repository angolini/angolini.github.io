---
title: "bitbake-setup: New Terminology"
date: 2026-02-10 00:00:00 +0000
tags: ["Yocto", "bitbake", "bitbake-setup"]
---
## Overview

With the introduction of `bitbake-setup`, the Yocto Project brings a set of new terms that are important to understand before diving into the tool. These terms are documented in the [BitBake User Manual - Environment Setup](https://git.openembedded.org/bitbake/tree/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst) chapter.

| Term                    | What it is                                                                              | Related settings                                                                     |
|-------------------------|-----------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| Top Directory           | The workspace root, by default it's `bitbake-builds`                                    | `top-dir-prefix`, `top-dir-name`                                                     |
| Setup                   | A build environment created by `bitbake-setup init`                                     | `setup-dir-name`                                                                     |
| Configuration Template  | A `.conf.json` file that serves as a template for creating a Setup                      |                                                                                      |
| Configuration Instance  | The configuration stored in `setup-1/config/`, combining the template with user choices |                                                                                      |
| Registry                | A location where Configuration Templates are stored and discovered                      |                                                                                      |

Let's go through each one.

## Top Directory

The Top Directory is the working directory of `bitbake-setup`, where its outputs end up (unless otherwise configured by settings).

It contains one or more Setup directories and a shared `site.conf` file.

The location is defined by two settings:
- `top-dir-prefix`: the leftmost path component
- `top-dir-name`: the rightmost path component

The resulting path is `<top-dir-prefix>/<top-dir-name>`. For example:

```
./bitbake-builds/
├── site.conf
├── setup-1/
└── setup-2/
```

By default, `top-dir-name` is `bitbake-builds`.

## Setup

A Setup is the result of the `bitbake-setup init` command. It is constructed from a Configuration Template combined with the choices made during initialization.

The name of the Setup directory can be customized with the `setup-dir-name` setting. By default, the name is derived from the choices made during `init` (e.g., `poky-master-poky-distro_poky-machine_qemux86-64`) or can be set directly in the Configuration Template file.

Each Setup directory contains three subdirectories:

```
setup-name/
├── build/    # BitBake Build: where BitBake operates and stores configuration
├── config/   # Configuration Instance: a Git repository tracking configuration state
└── layers/   # Sources: managed repositories including layers
```

This means every time `bitbake-setup init` is run, all the layers are cloned again.

## Configuration Template

A Configuration Template is a file in JSON format containing a template to create a Setup. It is the starting point used by the `bitbake-setup init` command and may prompt the user for additional choices during initialization.

Key characteristics:
- Files must end with the `.conf.json` suffix
- Stored in Registries (see below)
- Define which sources and git hashes to clone. Remember, the source code available defines which configuration fragments are available. One cannot use a configuration fragment that is not cloned locally.
- Can be listed using `bitbake-setup list` (when you have a registry configured properly)

The Configuration Template specifies the structure and options for a build environment, but the final configuration depends on the choices made during `init`.

As of today, I'm still not sure how much of a template can be fixed (and not a choice during `init`). I'm still exploring this area and waiting for how the community will continue with the development.

## Configuration Instance

The Configuration Instance is stored in the `config/` directory within a Setup. It embeds both the Configuration Template and the choices made during initialization.

This directory is a Git repository, which means it maintains a history of the configuration over time, including updates applied through the `bitbake-setup update` command.

In short: the Configuration Template is the generic starting point, while the Configuration Instance is the specific configuration for a Setup, reflecting both the template and the user's choices.

But remember, this `config` folder reflects the `bitbake-setup` configuration, not the `build/conf` configuration! If you enable or disable a fragment, it will not change a file here -- the file affected when you run `bitbake-config-build` is `build/conf/toolcfg.conf`.

## Registry

A Registry is a place where one or more Configuration Templates are stored. The directory structure of the registry can be anything -- `bitbake-setup` finds files ending with `.conf.json`.

The registry location is configured through the `registry` setting and supports multiple URI types:
- Local directories
- Git repository URLs
- Any URI supported by BitBake's fetcher

The default registry is located at `./bitbake/default-registry/` within the BitBake repository.

## Sources

- [BitBake User Manual - Environment Setup](https://git.openembedded.org/bitbake/tree/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst)
- [BitBake Repository](https://git.openembedded.org/bitbake/)
