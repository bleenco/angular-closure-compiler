OPTS=(
  "--language_in=ES6_STRICT"
  "--language_out=ES5"
  "--compilation_level=ADVANCED_OPTIMIZATIONS"
  "--js_output_file=dist/bundle.js"
  "--create_source_map=%outname%.map"
  "--warning_level=QUIET"
  "--rewrite_polyfills=false"
  "--js_module_root=node_modules/@angular/core"
  "--js_module_root=node_modules/@angular/common"
  "--js_module_root=node_modules/@angular/compiler"
  "--js_module_root=node_modules/@angular/platform-browser"
  "--js_module_root=vendor"
  node_modules/zone.js/dist/zone.js
  node_modules/@angular/core/@angular/core.js
  node_modules/@angular/common/@angular/common.js
  node_modules/@angular/compiler/@angular/compiler.js
  node_modules/@angular/platform-browser/@angular/platform-browser.js
  $(find vendor/rxjs -name "*.js")
  $(find lib -name "*.js")
  "--entry_point=./lib/main.js"
)

JVM_ARGS=""

set -ex
closureFlags=$(mktemp)
echo ${OPTS[*]} > $closureFlags
java $JVM_ARGS -jar node_modules/google-closure-compiler/compiler.jar --flagfile $closureFlags

gzip --keep -f dist/bundle.js
ls -alh dist
