all:
	make_all.py

.PHONY: all clean add generate co

clean:
	rm -rf stls assemblies bom deps dxfs
	rm -f *.html *.md *.scad *.png openscad.*

add:
	git add \
	  stls/*.png stls/*.stl \
	  assemblies/*.png \
	  bom/*.txt bom/*.json bom/*.csv \
	  stls/bounds.json \
	  readme.* printme.html
	  # dxfs/*.dxf dxfs/*.png
	git rm -f */*diff.png || true

co:
	git checkout generated
	git rebase main

generate: clean co all add
	git commit -m "update generated"
