---
layout: post
title:  "Blogging using Github "
date:   2018-10-14 12:18:50 +0100
categories: jekyll update
---
This blog uses Github to serve the blog posts.

For this, first I had to update gnupg, rvm and ruby and then install jekyll.

{% highlight bash %}
brew upgrade gnupg                                    # update gnu pg
curl -sSL https://rvm.io/mpapis.asc  | gpg --import   # get key
rvm get stable --auto-dotfiles                        # update rvm
rvm install ruby 2.5.1                                # install ruby
gem install jekyll bundler                            # install jekyll
{% endhighlight %}

Then create the blog and serve locally 

{% highlight bash %}
jekyll new myblog                                     # create blog
cd myblog                                             # go to blog directory
bundle exec jekyll serve                              # serve locally
{% endhighlight %}


Information on [Github pages][gpages]
Information on [Jekyll docs][jdocs]. 

Information on [rvm][rvm] 


[gpages]: https://pages.github.com/
[jdocs]: https://jekyllrb.com/docs/
[rvm]: https://rvm.io/


