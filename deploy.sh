hexo clean
hexo generate
hexo deploy
curl -H 'Content-Type:text/plain' --data-binary @public/baidu_urls.txt "http://data.zz.baidu.com/urls?site=inspiring26.github.io&token=JMyArMCJxaWhxWbj"
