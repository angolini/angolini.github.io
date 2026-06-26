---
layout: post
title: "Four editions, twelve years, one project: what writing the Yocto book taught me about time"
date: 2026-06-26 09:00:00
tags: [yocto, embedded-linux, open-source, book, career]
---

![Embedded Linux Development Using Yocto Project, Fourth Edition](/images/yocto-book-4th-edition.png)

The fourth edition of [Embedded Linux Development Using Yocto Project](https://www.amazon.com/Embedded-Linux-Development-Using-Project/dp/1806695073/) is now available for pre-order. Otavio Salvador and I have been working on it for the past months, and it covers Yocto Project 6.0 (Wrynose), the latest LTS release.

But I want to talk about what it means to be on the fourth edition of anything.

Every time Packt asks us to start a new edition, I feel that surprise again: is a new edition really needed? Then I start trying to convince myself there is a good reason to spend my precious time doing the same thing again.

Inevitably, I end up listing the differences between the current version and the one covered by the last edition. And inevitably, I end up also noticing the differences in my life, in the project, and in the world.

It is a strange form of review. To put it in perspective, here are the years and the Yocto versions we covered:

| Edition                                                                                        | Year | Yocto Project release |
|------------------------------------------------------------------------------------------------|------|-----------------------|
| [1st Edition](https://www.amazon.com/Embedded-Linux-Development-Yocto-Project/dp/1783282339)   | 2014 | Daisy                 |
| [2nd Edition](https://www.amazon.com/Embedded-Linux-Development-using-Projects/dp/178847046X)  | 2017 | Rocko                 |
| [3rd Edition](https://www.amazon.com/Embedded-Linux-Development-Using-Project/dp/1804615064)   | 2023 | Kirkstone (LTS)       |
| [4th Edition](https://www.amazon.com/Embedded-Linux-Development-Using-Project/dp/1806695073)   | 2026 | Wrynose (LTS)         |

**First edition, 2014.**  I had "just started" working with Yocto. This "just started" means the Yocto Project was already three years old. Toaster was called Hob. I had just created the "Yocto Training", a series of 10 tasks on "how to learn Yocto", because at that time, nobody knew Yocto (of course saying nobody is a generalization, but we were still introducing the project.) My first `meta-freescale` commit was in 2012. I was at that time still working for Freescale. It was really hard to write this book, and I appreciate every single co-writing call I had with Otavio, because writing a book alone would be really hard. I remember we wrote all the chapters and then we decided to ask for feedback from a community member and he was so sharp and precise that we reorganized the whole book. But the result was much much better!

**Second edition, 2017.** Three years later, Yocto had grown considerably. But we were still introducing the project to many people. By then, Freescale had become NXP, and the Yocto Training was still there. Today I tried to find the Yocto Training page, but a community migration made the metadata disappear and I absolutely don't remember when it was published. But I received a lot of feedback on that post. And I remember during the second edition we were much more confident to write about Yocto, mainly because feedback from the first edition gave us that confidence. It was much easier to write that edition.

**Third edition, 2023.** This time we were talking about an LTS version, and I remember discussing LTS strategy with Otavio for hours and hours. In this edition we also introduced the **eSDK** concept and we spent unending hours to grasp how to cover this, how to understand the path the community was trying to follow, how people would adopt `devtool` and eSDK. I was working for Foundries.io. It was much easier to work on this edition; the only hard part was the eSDK concept. By then, we started to see the Yocto Project as already part of that set of common tools for embedded Linux development. We were still writing with the newcomer in mind, that was always the target audience, but this time we were sure people already knew Yocto, so it was more natural to write about it.

**Fourth edition, 2026.** The second edition for an LTS release. The Release Notes manual is absolutely different from when we first started. I remember checking the release notes for Kirkstone, but I don't remember checking it for Daisy or Rocko. The main topic of discussion between me and Otavio this time is `bitbake-setup`. We are still writing for the newcomer, but now everybody seems to know Yocto. It's almost boring to think about how the tool is part of every project, it's not only normal, it's expected. And looking back, this project evolved a lot during these 12 years. Now I work for Qualcomm, the world is completely different. And still, I'm here typing in the same home office where I wrote the first edition. And I'm very grateful that Otavio is my partner in this journey.

After every single edition we wrote, I ended the work with a feeling: "I will never write about it ever again". But then, the next edition came and we started again. And although it's again about Yocto, everything is different.

What I find interesting about this rhythm -- 2014, 2017, 2023, 2026 -- is that each edition is also a snapshot of where I was professionally and personally. The first edition was written by someone who had been using Yocto for a few years and wanted to document what she knew. The fourth edition is written by someone who has spent twelve years watching the project evolve, contributing to it, teaching it, and occasionally arguing with it.

I am not the same person. The project is not the same project. The industry is not the same industry.

But the core problem has not changed: building reliable, reproducible, maintainable embedded Linux systems is still genuinely hard, and it is still worth doing carefully.

If you work with embedded Linux, or if you are thinking about adopting the Yocto Project, the fourth edition is the most complete version of this book we have written. It covers Yocto Project 6.0 from first principles to production workflows.

You can pre-order it now:

- [Amazon](https://www.amazon.com/Embedded-Linux-Development-Using-Project/dp/1806695073/)
- [Packt Direct](https://www.packtpub.com/en-us/product/embedded-linux-development-using-yocto-project-9781806695065) -- the eBook is available for $9.99 as part of the Summer Sale, until the end of June

I might write more about the specific technical changes in a later post. For now I just wanted to mark this moment, because twelve years is a long time to keep working on anything, and it deserves at least a paragraph.
