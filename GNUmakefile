OUTPUT = public_html
OUTPUT_REPO = git@github.com:nevali/notebook.git
SOURCE = src
STATIC = static
EXCLUDE = _%.md
SOURCEFILES = $(filter-out $(EXCLUDE),$(patsubst $(SOURCE)/%,%,$(wildcard $(SOURCE)/*.md)))
OUTPUTFILES = $(patsubst %.md,$(OUTPUT)/%.html,$(SOURCEFILES))
PANDOC ?= pandoc
PANDOCOPTS = -s \
	--data-dir=. \
	-Vlang:en-GB -Vdir:ltr \
	-Mtitle:'Mo McRoberts' \
	-Msubtitle:'Music • Broadcasting • Technology' \
	-c https://neva.li/common/styles.css

LOGPREFIX = $(MAKE)[$(MAKELEVEL)]

all: preflight $(OUTPUTFILES)

cleanbuild:
	@$(MAKE) clean
	@$(MAKE) all
	
env:
	@env

autobuild:
	@cd $(OUTPUT) && \
		git reset --hard && \
		git checkout -f gh-pages && \
		git pull origin gh-pages
	@$(MAKE) clean
	@$(MAKE) all
	@cd $(OUTPUT) && \
		git add -A && \
		if test `git status --porcelain | wc -l` -gt 0 ; then \
			git commit -a -m"Autobuild commit." || exit $? ; \
			git push $(OUTPUT_REPO) gh-pages || exit $? ; \
		else \
			echo "$(LOGPREFIX):  No changes to push" >&2 ; \
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

preflight:
	@echo "$(LOGPREFIX):  Merging $(STATIC) into $(OUTPUT)..." >&2
	@( cd $(STATIC) && tar cf - . ) | ( cd $(OUTPUT) && tar xf - )

$(OUTPUT)/%.html: $(SOURCE)/%.md templates/default.html5
	@echo "$(LOGPREFIX):  Generating $@ from $<" >&2
	@$(PANDOC) $(PANDOCOPTS) -f gfm -t html5 -s -Mpagetitle:"$*" $< | \
		sed -e 's!\[x\]!<input type="checkbox" checked disabled>!g' \
			 -e 's!\[ \]!<input type="checkbox" disabled>!g' \
		> $@

.PHONY: all clean preflight
.NOEXPORT:
