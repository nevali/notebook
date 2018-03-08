OUTPUT = public_html
OUTPUT_REPO = git@github.com:nevali/notebook.git
OUTPUT_BRANCH = gh-pages
SOURCE = src
SOURCE_REPO = git://github.com/nevali/notebook.wiki.git
SOURCE_BRANCH = master
INCLUDES = includes
STATIC = static
IGNORE_PATTERN = Home.md
INCLUDES_PATTERN = _%.md

SOURCEFILES = $(filter-out $(IGNORE_PATTERN) $(INCLUDES_PATTERN),$(patsubst $(SOURCE)/%,%,$(wildcard $(SOURCE)/*.md)))
INCSRCFILES = $(filter $(INCLUDES_PATTERN),$(patsubst $(SOURCE)/%,%,$(wildcard $(SOURCE)/*.md)))
OUTPUTFILES = $(OUTPUT)/index.html $(patsubst %.md,$(OUTPUT)/%.html,$(SOURCEFILES))
INCFILES = $(patsubst $(INCLUDES_PATTERN),$(INCLUDES)/%.html,$(INCSRCFILES))

export index_PANDOCOPTS = -Mpagetitle:Notebook -A $(INCLUDES)/Sidebar.html

PANDOC ?= pandoc
PANDOCOPTS = -s \
	--data-dir=. \
	-Vlang:en-GB -Vdir:ltr \
	-Mtitle:'Mo McRoberts' \
	-Msubtitle:'Music • Broadcasting • Technology' \
	-c https://neva.li/common/styles.css

LOGPREFIX = $(MAKE)[$(MAKELEVEL)]

all: preflight $(INCFILES) $(OUTPUTFILES)

cleanbuild:
	@$(MAKE) clean
	@$(MAKE) all
	
env:
	@env

autobuild:
	@git clone -b $(SOURCE_BRANCH) $(SOURCE_REPO) $(SOURCE)
	@git clone -b $(OUTPUT_BRANCH) $(OUTPUT_REPO) $(OUTPUT)
	@$(MAKE) clean
	@$(MAKE) all
	@cd $(OUTPUT) && \
		git add -A && \
		if test `git status --porcelain | wc -l` -gt 0 ; then \
			git commit -a -m"Autobuild commit." || exit $? ; \
			git push $(OUTPUT_REPO) gh-pages || exit $? ; \
		else \
			echo "$(LOGPREFIX): No changes to push" >&2 ; \
		fi

clean:
	@echo "$(LOGPREFIX): Cleaning $(OUTPUT)..." >&2
	@rm -f $(OUTPUTFILES)
	@cd $(OUTPUT) && for i in .ignore * ; do \
		case $$i in \
			.*) ;; \
			 *) test -d $$i || rm -f $$i ;; \
		esac ; \
	done
	@echo "$(LOGPREFIX): Cleaning $(INCLUDES)..." >&2
	@rm -f $(INCFILES)

preflight:
	@echo "$(LOGPREFIX): Merging $(STATIC) into $(OUTPUT)..." >&2
	@( cd $(STATIC) && tar cf - . ) | ( cd $(OUTPUT) && tar xf - )

$(INCLUDES)/%.html: $(SOURCE)/_%.md templates/snippet.html5
	@echo "$(LOGPREFIX): Generating snippet $@ from $<" >&2
	@mkdir -p $(INCLUDES)
	@$(PANDOC) $(PANDOCOPTS) -f gfm -t html5 --template=snippet \
		$${$*_PANDOCOPTS} \
		$< | \
		sed -e 's!\[x\]!<input type="checkbox" checked disabled>!g' \
			 -e 's!\[ \]!<input type="checkbox" disabled>!g' \
		> $@

$(OUTPUT)/%.html: $(SOURCE)/%.md templates/wiki.html5 $(INCFILES)
	@echo "$(LOGPREFIX): Generating $@ from $<" >&2
	@default_PANDOCOPTS="-Mpagetitle:$*" ; \
		$(subst .,_,$*)_PANDOCOPTS=$${$(subst .,_,$*)_PANDOCOPTS:-$$default_PANDOCOPTS} ; \
		$(PANDOC) $(PANDOCOPTS) -f gfm -t html5 -s --template=wiki \
		$${$(subst .,_,$*)_PANDOCOPTS} \
		$< | \
		sed -e 's!\[x\]!<input type="checkbox" checked disabled>!g' \
			 -e 's!\[ \]!<input type="checkbox" disabled>!g' \
		> $@

$(OUTPUT)/%.html: $(STATIC)/%.md templates/default.html5 $(INCFILES)
	@echo "$(LOGPREFIX): Generating $@ from $<" >&2
	@default_PANDOCOPTS="-Mpagetitle:$*" ; \
		$*_PANDOCOPTS=$${$*_PANDOCOPTS:-$$default_PANDOCOPTS} ; \
		$(PANDOC) $(PANDOCOPTS) -f gfm -t html5 -s --template=default \
		$${$*_PANDOCOPTS} \
		$< | \
		sed -e 's!\[x\]!<input type="checkbox" checked disabled>!g' \
			 -e 's!\[ \]!<input type="checkbox" disabled>!g' \
		> $@

.PHONY: all clean preflight
.EXPORTALL:
