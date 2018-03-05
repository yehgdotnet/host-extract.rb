# host-extract.rb
DESCRIPTION
This little ruby script tries to extract all IP/Host patterns in page response of a given URL and JavaScript/CSS files of that URL.

With it, you can quickly identify internal IPs/Hostnames, development IPs/ports, cdn, load balancers, additional attack entries related to your target that are revealed in inline js, css, html comment areas and js/css files.

This is unlike web crawler which looks for new links only in anchor tags (

(you might miss many additional targets if you ever use such web crawler or other GUI-based tools that shows you your main target and its relationship with its linked sub/off-site domains)

In some cases, host-extract may give you false positives when there are some words like - main-site_ver_10.2.1.3.swf.

With -v option, you can ask the tool to output html view-source snippets for each IP/Domain extracted. This will shorten your manual analysis time.

USAGE
```

ruby host-extract.rb URL [option]

Usage: host-extract [options] -a find all ip/host patterns -j scan all js files -c scan all css files -v append view-source html snippet for manual verification

```

A sugguested usage is to feed lists of urls output by your favorite web crawler.

In Win OSes, you can

for /F "tokens=*" %G IN ('type url-list') do ruby host-extract.rb -a -v %G

In Linux platforms, you can

for line in $(cat url-list); do ruby host-extract.rb -a -v $line; done

The run.cmd and run.sh are included to be ready for use.

Windows: run url-list

Linux: sh run.sh url-list

Tutorial Wiki
Thanks to Sebastien Damaye from aldeid.com, you can see a thorough host-extract tutorial with real-world web sites that reveal various juicy info shown inside html/js sources.

http://aldeid.com/index.php/Host-extract

SAMPLE LOG
Scan on allrecipes.com

```

URL: http://allrecipes.com
[*] 1 internal IP(s) found!
192.168.5.163 #view-source: .. B322 LOCAL_IP: 192.168.5.163 REMOTE_IP:

...

```

Scan on gawker.com

```

... [*] searching for IP/domain patterns ... ......

dev.gawker.com:8888
view-source: .. 'host' : 'dev.gawker.com:8888',
......

```

Scan on digg.com

```

URL: http://digg.com
-> http://digg.com | 302
(Redirected to : /news)
############################################
URL: http://digg.com/news
[*] searching for internal IP patterns ...
10.2.129.82

view-source: .. an title="10.2.129.82 build: 210 - fri mar 11 1
[*] 1 internal IP(s) found!
[*] searching for IP/domain patterns ...
cdn1.diggstatic.com

view-source: .. f="http://cdn1.diggstatic.com/img/favicon.a015f25c.ico">
cdn2.diggstatic.com

view-source: .. f="http://cdn2.diggstatic.com/css/two_column/library/global.
..... ```

JUICY SITES
The following sites are those that reveal some juicy info during the testing of host-extract.

http://allrecipes.com

http://auto.ru

http://allabout.co.jp

http://www.yousendit.com

http://gamefaqs.com

http://moneycontrol.com

http://www.qidian.com/Default.aspx

http://technorati.com/

http://ovh.net/

http://www.examiner.com/

http://dmoz.org

http://www.rightnow.com/

http://digg.com

http://gizmodo.com

http://www.gazeta.pl/

http://extratorrent.com

http://www.examiner.com/

http://www.gazeta.pl/

http://gawker.com

http://www.mcafee.com/js/omniture/omniture_profile.js

http://www.metacafe.com/

http://letitbit.net/

http://www.lemonde.fr/

http://www.shutterstock.com/

http://shopping.com

http://www.rightnow.com/

http://tinypic.com