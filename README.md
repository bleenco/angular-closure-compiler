### Angular Closure Compiler Test

This is a demo compiling Angular 4 application using Google Closure Compiler.

The result is really small build size, which means super fast page load.

### Steps

The `npm run build` command executes TypeScript compiler on RxJS library with
configuration to target `es2015` which is needed for Closure Compiler.

When RxJS build is done, compiled library is stored in `vendor/rxjs` and the application bundling
begins from node script which stores configuration for Closure Compiler in `build.js`.

If build is successful it returns build size less than a `100K` and gzipping this
results in `32K` in size!

Note that in build `zone.js` is excluded and included inside `index.html` separately.

#### Run the build

``` shell
$ npm install

$ npm run build

$ npm run server # start the demo build
```

#### Build Size

Results are for basic `app works!` app.

```sh
-rw-r--r--  1 jan  staff    99K Mar 24 17:06 bundle.js
-rw-r--r--  1 jan  staff    32K Mar 24 17:06 bundle.js.gz
```

#### LICENCE

MIT
