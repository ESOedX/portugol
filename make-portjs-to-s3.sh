eval `opam config env`
rm -r src/{portjs.js,portjs.zip,portjs.byt}
cd src/
make js
js_of_ocaml portjs.byt
cd ..
s3cmd del s3://eso-ocaml/portjs.zip
zip src/portjs.zip src/portjs.js
s3cmd put src/portjs.zip s3://eso-ocaml

