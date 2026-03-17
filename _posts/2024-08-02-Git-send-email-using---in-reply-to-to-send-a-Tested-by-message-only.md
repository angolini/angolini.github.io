---
title: "Git send-email using --in-reply-to to send a Tested-by message only"
date: 2024-08-02 11:13:00 +0000
tags: ["git"]
---
Ok, it’s easy to find the command line to use when you have the patch you want to reply `--in-reply-to`, but I was struggling to understand what I was supposed to add to the `/path/to/YOUR_REPLY` to style it properly. As it was not an answer, it was a `Tested-by` tag.

And all the top-posting thing.

This post helped me to understand. 

<aside>
<img src="https://www.notion.so/icons/link_green.svg" alt="https://www.notion.so/icons/link_green.svg" width="40px" /> https://paldan.altervista.org/kernel-mailing-list-replies-for-linux-with-lore-git-and-gmail/?doing_wp_cron=1722607161.9830200672149658203125

</aside>

You add the text from the original message with `>` at the end of each line which is *quoted* (now that I know it is obvious), then you add your text.

Exactly how you would make if you were using any email client.

Writing it here so myself from future will not forget.

My file end up being like this:

```bash
daiane@lola:~/gitsend$ cat reply.txt 
Subject: [PATCH] tty: vt: conmakehash: cope with abs_srctree no longer in env

> conmakehash uses getenv("abs_srctree") from the environment to strip
> the absolute path from the generated sources.
> However since commit e2bad142bb3d ("kbuild: unexport abs_srctree and
> abs_objtree") this environment variable no longer gets set.
> Instead use basename() to indicate the used file in a comment of the
> generated source file.
> 
> Fixes: 3bd85c6c97b2 ("tty: vt: conmakehash: Don't mention the full path of the input in output")
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

Tested-by: Daiane Angolini <daiane.angolini@foundries.io>

```

---

<aside>
<img src="https://www.notion.so/icons/drafts_green.svg" alt="https://www.notion.so/icons/drafts_green.svg" width="40px" /> **Home** **•**  [Pages](https://www.notion.so/Pages-66946fdd3188404796eada6badf1245d?pvs=21) **•**  [e-mail](mailto:angolini@gmail.com) **•**  [github](http://www.github.com/angolini) **•**

</aside>

---