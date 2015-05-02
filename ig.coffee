#!/usr/bin/env coffee

fs = require "fs"

posts = require("./instagram.json").data

articles =
  for post, i in posts when post.type is "image"
    fs.writeFileSync "./_posts/2015-04-29-post-#{i}.markdown", """---
    layout: post
    title:  "Welcome to Jekyll!"
    date:   2015-04-29 23:15:55
    src: #{post.images.thumbnail.url}
    ---
    #{post.caption?.text ? ""}
    """, "utf8"
  # console.log post.images.thumbnail.url, post.caption?.text