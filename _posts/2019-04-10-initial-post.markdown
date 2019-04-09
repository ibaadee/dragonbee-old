---
layout: post
title:  "Initial Entry - How I started using Jekyll"
date:   2019-04-10 00:34:00 +0700
categories: post
---
After so many times trying to write blog, and two years figuring out to host my own blog with my own domain. I decided to create brand new blog with new entries, so i could makes a fresh start to bring my stories and my thought through writing. Once, i'd like to create my blog from scratch, but i decided to create this blog with template. My previous blog run on Wordpress and i hosted in shared hosting service in my country. But later, after some project i worked on. I found affordable private hosting at [Digital Ocean][digital-ocean] (about US$5 a month by April 2019), so i decided to run this blog on my server. I also could use this instance to do some experiment with my stuffs. If you are student, you could get $50 [Digital Ocean][digital-ocean] credits from GitHub Student Pack by registering with your student e-mail.

<h1>Prologue</h1>
First thing that i would share to you is, 'How I Build this Blog'. I used Jekyll, a Ruby based static web template for my blog. Yes, I called this a template. This template is very simple and pretty straight forward so i could learn easily about it's structure in a days. You can learn about Jekyll in their website [here][jekyll]. Then, i installed it on my computer with guidance from [Ruby official website][ruby-install]. I followed the macOS installation guide, because my computer run on macOS. Some advice for Ruby installation in macOS, for security purposes the file ownership of Ruby file in your macOS belongs to `root`. Usually on macOS you don't logged on as root. Then you would see error message like this:

`You don't have write permissions for the /Library/Ruby/Gems/2.3.0 directory.`

You could run `sudo` before Ruby package installation. For example `gem install travis`. While `travis` is a package i would install, i run `sudo gem install travis` instead to get `root` access.

<h1>Installation</h1>
Jekyll installation are very easy. But, before we begin, we must make sure that we have installed Ruby in our systems. As a Java Hardcore Programmer (not actually, but almost all project I have done before written in Java Based Framework) i don't have Ruby installed on my computer, so i followed the instruction from [Ruby official website][ruby-install]. 
Then i installed Jekyll by running these script from [Jekyll website][jekyll].
{% highlight bash %}
#Install Jekyll Bundler
$ gem install jekyll bundler

#Initiate our new project
#You can change <projectname> with every name that you wants
$ jekyll new <projectname>

#Execute Jekyll on localhost:4000 (default)
$ cd <projectname>
$ bundle exec jekyll serve
{% endhighlight %}

<h1>Package Override</h1>
By default, latest Jekyll installation use minima as default theme and this theme not shown in our directory yet. So, to override it you could run 
{% highlight bash %}
$ bundle show

#Output (MacOS X 10.14)
/Library/Ruby/Gems/2.3.0/gems/minima-2.5.0
{% endhighlight %}

As i confused with which files that I should override, then i copied every folder in above output directory to project directory. As far as I learned, the directory that begin with underscore like `_include`, `_layouts`, `_posts`, etc. are content of the site that will be built. When you edit the file and Jekyll is serving, then you could refresh your browser and see preview of the site. 

The styling content are located in `_sass` directory. But as today I have limited time, i haven't explored it yet. Later i will go on customising this site with styling.

<h1>Preparing Environment (CentOS + Nginx)</h1>
Jekyll are simple static website and could be hosted on [Github Pages][github-pages]. But, I prefer to use [Digital Ocean][digital-ocean] instead because one username only get one site. I'd like to experiment with another project, so I decided to use private instance. I choose CentOS for OS and Nginx for web server and reverse proxy. 

I followed guideline from [Digital Ocean][digital-ocean] tutorial site about [configuring Nginx on Centos 7][do-centos-nginx]. After it, you can run webserver on Nginx. Then, the Nginx could be encrypted by [Let's Encrypt][lets-encrypt] an open certificate authority by following [this guideline][do-lets-encrypt]. After certbot installed, you could run `sudo certbot --nginx -d <sub1.domain.com> -d <sub2.domain.com>`.  

<h1>Build and Deployment</h1>
Time to share the site to the world. Execute `jekyll build` to build web package. Then deploy the `_site` directory to server.

<h4>Manual Deployment</h4>
There is two option on deploying this site to the server. If you use GitHub Pages, you just easily push the source code to remote repository. But, if you use private instance, you could either copy the `_site` to the home of Nginx home directory (usually on `/var/www/html/`, you could see on `nginx.conf` file at `/etc/nginx/nginx.conf`). Rename the `_site` directory uploaded as you mapped on Nginx conf files.

<h4>Automated Deployment</h4>
Jekyll could be automated easily with [Travis-CI][travis-ci] tools. This tools specifically use for repositories that hosted on GitHub. Also [Jekyll supported deployment][jekyll-deploy] with anothe CI/CD tools like Circle CI and Buddy. I followed tutorial on [Kjaer's Blog to configure Travis][kjaer-travis] for my site. I only need to commit and push, and then my site serve new updates within a minute.

<h1>Conclusion</h1>
Jekyll is a mature and powerfull open source static site template that could be use on many purposes. In the future I plan to learn more about Jekyll and writing content of this site. Hope this site will be useful and I could write frequently about my thought. If reading equals one, then writing two. Writing is all about reading, structuring, comparing, synthetising, validating, and writing itself. 


[jekyll]: https://jekyllrb.com/
[ruby-install]: https://www.ruby-lang.org/id/documentation/installation/
[jekyll-override]: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
[jekyll-minima]: https://github.com/jekyll/minima
[jekyll-deploy]: https://jekyllrb.com/docs/deployment/
[github-pages]: https://pages.github.com
[digital-ocean]: https://m.do.co/c/29a941d89f44
[do-centos-nginx]: https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-centos-7
[do-lets-encrypt]: https://www.digitalocean.com/community/tutorials/how-to-secure-apache-with-let-s-encrypt-on-centos-7
[kjaer-travis]: https://kjaer.io/travis/
[lets-encrypt]: https://letsencrypt.org/
[travis-ci]: https://travis-ci.org/