---
layout: post
title: How to configure git using a key created on another machine
date: 2022-06-16 10:54:20
---

Install the needed packages (including those needed for Yubikey)

```
sudo apt-get install pcscd scdaemon gnupg2 pcsc-tools 
```

Import the public key

```
gpg2 --import < public.key
```

With the key-holder (or the card, or the yubikey) connected,
gather the `KEYID` with the command:

```
gpg2 --card-status
```

Next step is to trust the key:

```
gpg2 --edit-key KEYID
trust
choose 5 = I trust ultimately
```

Confirm, add the PIN, and the key is ready to be used by git

Configure git with:

```
git config --global user.signingkey KEYID
```

