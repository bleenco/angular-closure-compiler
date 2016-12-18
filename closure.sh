OPTS=(
  "--language_in=ES6_STRICT"
  "--language_out=ES5"
  "--compilation_level=ADVANCED_OPTIMIZATIONS"
  "--js_output_file=dist/bundle.js"
  "--create_source_map=%outname%.map"
  "--variable_renaming_report=dist/variable_renaming_report"
  "--property_renaming_report=dist/property_renaming_report"
  "--rewrite_polyfills=false"
  "--js_module_root=node_modules"
  "--js_module_root=vendor"
  "node_modules/zone.js/dist/zone.js"
  $(find vendor/rxjs -name "*.js")
  $(find node_modules/@angular/{core,common,compiler,platform-browser}/index.js)
  $(find node_modules/@angular/{core,common,compiler,platform-browser}/src -name "*.js")
  $(find built -name "*.js")
  "--entry_point=./built/src/main.aot.js"
)

set -ex
java -jar node_modules/google-closure-compiler/compiler.jar $(echo ${OPTS[*]})
rm -rf aot built
gzip --keep -f dist/bundle.js
bro --force --quality 10 --input dist/bundle.js --output dist/bundle.js.brotli
ls -lh dist/bundle*
