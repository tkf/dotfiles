all: \
django-mode.el revive.el revive.el windows.el winhist.el key-chord.el \
weblogger org-6.28d

#org-6.28d/lisp/org-install.elc: org-6.28d/
#	make -f org-6.28d/Makefile

org-6.28d: org-6.28d.tar.gz
	tar zxf $<
	echo "Please make org-6.28. Do this: \n% cd org-6.28\n% make"

org-6.28d.tar.gz:
	wget http://orgmode.org/org-6.28d.tar.gz

key-chord.el:
	wget http://www.emacswiki.org/cgi-bin/wiki/download/key-chord.el

weblogger: weblogger.tar.gz
	tar zxvf weblogger.tar.gz

weblogger.tar.gz:
	wget http://nethazard.net/weblogger.tar.gz

#winring.el:
#	wget http://www.python.org/emacs/winring/winring.el

winhist.el:
	wget http://www.bookshelf.jp/elc/winhist.el

rst-mode.el:
	wget http://www.merten-home.de/FreeSoftware/rst-mode/rst-mode.el

rst.el:
	wget http://svn.berlios.de/viewcvs/*checkout*/docutils/tags/docutils-0.5/tools/editors/emacs/rst.el

django-mode.el:
	wget http://code.unicoders.org/export/117/hacks/trunk/django-mode.el

revive.el:
	wget http://www.gentei.org/~yuuji/software/revive.el

windows.el:
	wget http://www.gentei.org/~yuuji/software/windows.el

color-theme-6.6.0/: get-color-theme.sh
	sh get-color-theme.sh
