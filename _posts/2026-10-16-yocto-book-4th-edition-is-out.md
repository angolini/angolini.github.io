---
layout: post
title: "The fourth edition of the Yocto book is out"
date: 2026-10-16 09:00:00
tags: [yocto, embedded-linux, open-source, book]
---

![The four editions of Embedded Linux Development Using Yocto Project, side by side](/images/yocto-book-four-editions.jpg)

The fourth edition of [Embedded Linux Development Using Yocto Project](https://www.amazon.com/Embedded-Linux-Development-Using-Project/dp/1806695073/) is out, and the printed copy is finally in my hands.

Four editions, twelve years, and the same two authors since 2014:

| Edition | Year | Yocto Project release |
|---------|------|-----------------------|
| 1st     | 2014 | Daisy                 |
| 2nd     | 2017 | Rocko                 |
| 3rd     | 2023 | Kirkstone (LTS)       |
| 4th     | 2026 | Wrynose (LTS)         |

Back in June, when the book went into pre-order, I wrote a long post about [what four editions and twelve years taught me about time]({% post_url 2026-06-26-four-editions-of-the-yocto-book %}).

## What is in this edition

This edition covers Yocto Project 6.0 (Wrynose), the current LTS release. The subtitle says it well: *Build production-grade embedded Linux products with the Yocto Project 6.0*.

It is a substantial revision, not a refresh. The highlights:

- **A new setup workflow.** `bitbake-setup` now creates and manages the build workspace, and `bitbake-config-build` manages the configuration inside it through BitBake Configuration Templates and Fragments. This replaces the manual clone-and-source routine the earlier editions taught.
- **A new chapter: *Managing BitBake Configuration*.** The new workflow is important enough to deserve a chapter of its own, covering configuration fragments, layer management, and how to turn all of it into something a whole team can reproduce.
- **VS Code and the BitBake extension.** The chapter on graphical build tooling now covers the Yocto Project BitBake extension for Visual Studio Code. We chose it because we believe it will be useful to a larger share of our readers.
- **License compliance grew into SBOM.** The chapter is now called *License Compliance and Software Bill of Materials*. Besides the copyleft material, it covers SBOM generation, SBOM-based vulnerability scanning, and how to declare the terms of your own proprietary recipes. Compliance becomes a build output, not an audit exercise.
- **Board examples updated to `bitbake-setup`.** The hardware chapter now brings up every board with the new setup workflow, so you go from an empty directory to a booting image on the BeagleBone Black, Raspberry Pi 4 and 5, VisionFive 2, and the newly added Arduino UNO Q.
- **Everything regenerated.** Examples, command output, and documentation links were regenerated against Wrynose rather than carried forward from the previous edition.

## The foreword

We are honored to have the foreword written by **Ross Burton**, Yocto Project TSC member and Principal Engineer at Arm. Ross has been around the project for as long as I can remember, and having his words open the book means a lot to both of us. Thank you, Ross.

## Thank you

A book is never only the work of the people whose names are on the cover. Thanks to Khem Raj, Vanessa Maegima, and Sergio Prado, whose technical review made this a better book. Thanks also to the Packt team and to every reader who sent us feedback on the previous editions. A lot of what is in the fourth edition exists because someone, somewhere, told us what was missing in the third.

And thank you, Otavio. Again, and again, and again, and again.

## Where to get it

- [Amazon](https://www.amazon.com/Embedded-Linux-Development-Using-Project/dp/1806695073/)
- [Packt](https://www.packtpub.com/en-us/product/embedded-linux-development-using-yocto-project-9781806695065)

If you read it, I would love to hear what you think, especially if you are new to the Yocto Project. That was always the reader we had in mind, from the first edition to this one.
