OPTS=(
  "--language_in=ES6_STRICT"
  "--language_out=ES5"
  "--compilation_level=ADVANCED_OPTIMIZATIONS"
  "--js_output_file=dist/bundle.js"
  "--create_source_map=%outname%.map"
  "--variable_renaming_report=dist/variable_renaming_report"
  "--property_renaming_report=dist/property_renaming_report"
  "--warning_level=QUIET"
  "--rewrite_polyfills=false"
  "--js_module_root=node_modules"
  "--js_module_root=vendor"
  node_modules/zone.js/dist/zone.js
  $(find vendor/rxjs -name "*.js")
  node_modules/@angular/{core,common,compiler,platform-browser}/index.js
  $(find node_modules/@angular/{core,common,compiler,platform-browser}/src -name "*.js")
  $(find aot -name "*.js")
  "--entry_point=./aot/src/main.js"
  "--output_manifest=dist/manifest.MF"
)

JVM_ARGS=""

set -ex
java $JVM_ARGS -jar node_modules/google-closure-compiler/compiler.jar $(echo ${OPTS[*]})

gzip --keep -f dist/bundle.js
ls -alh dist
