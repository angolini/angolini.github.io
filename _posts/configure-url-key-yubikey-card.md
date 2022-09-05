---
layout: post
title: How to fetch public key from keyserver
date: 2022-09-05 14:00:00
---

I have just updated my card to add the link to the my online public key.

Maybe, fetching online is easier.

```
$ gpg2 --card-edit

<YOUR INFO>

gpg/card> admin
Admin commands are allowed

gpg/card> URL
URL to retrieve public key: https://keys.openpgp.org/URL


gpg/card> fetch
gpg: requesting key from 'https://keys.openpgp.org/URL'
gpg: key 1234567890123456: "NAME(NAME IDENTITY) <EMAIL>"
```