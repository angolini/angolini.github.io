#!/bin/sh
#
# Shell script for creating post
# based on jekyll's layout format

# get created date
date=`date +%Y-%m-%d`
datetime=`date "+%Y-%m-%d %H:%M:%S"`

# get file title from command line
echo "The Post Title is the text used to create the URL, be wise"
read -p "   Post Title: " title

# create file title
title_=$(echo $title | sed -e 's/ /_/g')
filetitle=$date-$title_.md

# create file
touch _posts/$filetitle

# write default layout to the file
echo '---' >> _posts/$filetitle
echo 'layout: post' >> _posts/$filetitle
echo 'title: '$title >> _posts/$filetitle
echo 'date: '$datetime >> _posts/$filetitle
echo '---' >> _posts/$filetitle

