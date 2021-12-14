# TODO
 - Generate a home page that looks like quranerkotha.com/index in mobile view
 - Make each post & page look like the oriignal site in mobile view. make a minimal css
 - Nice header and footer
 - Previous and Next article navigation bottom of each post, as in the original site
 - Facebook like box at the end of each post as in the original site
 - Make github actions to publish the site when there's a push repository
 - Google analytics as in the original site
 - Discus comment section at the end of each post
 - Ensure the pages are also coming as in the original site. e.g. /pdf /about /reference
 - Create github pages actions so that when a modified/added file is pushed to repo, the github pages site refreshes with latest content
 - map quranerkotha.com DNS to github pages
 - Ensure sharing a page on twitter, linkedin, facebook renders correct preview


# Getting started

Follow installation guide on https://jekyllrb.com/

Then run
```
bundle install
```
Installs all dependencies.

```
bundle exec jekyll build --watch
```
on another terminal
```
bundle exec jekyll serve
```

TO start a local webserver

## First time

Export a wordpress site into an wordpress.xml.
Run import-wordpress.sh to generate _posts markdown files
