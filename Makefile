# ============================================================
#  Author: 凍仁翔 / chusiang.lai (at) gmail.com
#  Blog: http://note.drx.tw
#  Filename: makefile
#  Modified: 2015-10-11 16:16
#  Description: deploy tool for working-on-gnu-linux books.
# =========================================================== 

OS_NAME := $(shell uname)

include  Makefile.target

.PHONY: main html cp2clipboard install build pdf epub mobi update review push clean

main: build review

# 將 *.md 轉成 HTML 並複製到剪貼簿 (clipboard)。
cp2clipboard: $(md)
	markdown_py $(md) > tmp.html
	
	# remove <p> tags.
	sed -i 's/<p>//g' tmp.html
	sed -i 's/<\/p>//g' tmp.html
	
	# remove <pre> tags.
	sed -i 's/<pre>//g' tmp.html
	sed -i 's/<\/pre>//g' tmp.html
	
	# replace <code> to <blockquote> tags.
	sed -i 's/<code>/<blockquote>/g' tmp.html
	sed -i 's/<\/code>/<\/blockquote>/g' tmp.html
	
	# add target="_blank" option into <a> tags.
	sed -i 's/<a\ href/<a\ target="_blank"\ href/g' tmp.html
	
	# copy html to 'clipboard'.
	cat tmp.html | xclip

# 將 *.md 轉成 HTML 並使用 Chromium 開啟。
html: $(md)
	markdown_py $(md) > tmp.html
	chromium tmp.html

install:
	gitbook install .

build:
	gitbook build .

pdf:
	gitbook pdf .

epub:
	gitbook epub .

mobi:
	gitbook mobi .

review:
ifeq (${OS_NAME}, Darwin)
	open _book/index.html
else
	firefox _book/index.html
endif

server:
	gitbook serve

# 移除暫存檔。
clean:
	-rm -rf tmp.html _book/ _books/ book.pdf book.epub book.mobi

