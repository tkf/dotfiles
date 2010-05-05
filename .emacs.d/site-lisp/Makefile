ORG_VER=6.35i

all: \
django-mode.el revive.el revive.el windows.el winhist.el key-chord.el \
org org-extension.el pysmell.el auto-complete.el \
gist-el doctest-mode.el howm yaml-mode.el

howm/: howm-1.3.8/
	ln -s howm-1.3.8 howm

howm-1.3.8/: howm-1.3.8.tar.gz
	tar zxf $<

howm-1.3.8.tar.gz:
	wget http://howm.sourceforge.jp/a/howm-1.3.8.tar.gz

doctest-mode.el:
	wget 'http://python-mode.svn.sourceforge.net/viewvc/*checkout*/python-mode/trunk/python-mode/doctest-mode.el?revision=460' --progress=dot -O $@

gist-el:
	git clone git://github.com/defunkt/gist.el.git gist-el

org-extension.el:
	wget http://www.emacswiki.org/emacs/download/org-extension.el

python-mode.el:
	wget http://launchpadlibrarian.net/21781107/python-mode.el
#	wget http://launchpad.net/python-mode/trunk/5.1.0/+download/python-mode.el

ipython.el:
	wget http://ipython.scipy.org/dist/ipython.el

pysmell.el:
	wget http://github.com/orestis/pysmell/raw/beea16c18e57e09aa41c3175d9126cff5f59f853/pysmell.el

auto-complete.el:
	wget http://www.cx4a.org/pub/auto-complete.el

org: org-${ORG_VER}/lisp/org-install.elc
	ln -s org-${ORG_VER} org

org-${ORG_VER}/lisp/org-install.elc: org-${ORG_VER}/
	cd org-${ORG_VER} && make

org-${ORG_VER}/: org-${ORG_VER}.tar.gz
	tar zxf $<

org-${ORG_VER}.tar.gz:
	wget http://orgmode.org/org-${ORG_VER}.tar.gz

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
	wget http://code.unicoders.org/search/export/117/hacks/trunk/django-mode.el

revive.el:
	wget http://www.gentei.org/~yuuji/software/revive.el

windows.el:
	wget http://www.gentei.org/~yuuji/software/windows.el

color-theme-6.6.0/: get-color-theme.sh
	sh get-color-theme.sh

yaml-mode.el: yaml-mode-0.0.6/yaml-mode.el
	cp $< .

yaml-mode-0.0.6/yaml-mode.el: yaml-mode-0.0.6.tar.gz
	tar zxf $<

yaml-mode-0.0.6.tar.gz:
	wget http://github.com/downloads/yoshiki/yaml-mode/yaml-mode-0.0.6.tar.gz
