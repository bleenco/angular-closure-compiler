### Angular Closure Compiler Test

This demo uses Google Closure Compiler for compiling Angular 4 applications.

It produces a super optimized build size which results in a fast page load.

### Prerequisites

* Node.js 6.0.0+
* Java SDKs (the best latest)

### Steps

The `npm run build` command executes TypeScript compiler with RxJS library and targets `es2015` that is needed by Closure Compiler.

The successful RxJS build stores the library to `vendor/rxjs`. A node script starts an application bundling and stores the Closure Compiler configuration in `build.js`.

A successful build amounts to less than `100K` in size and the final gzipped build has only `32K`!

We include `zone.js` in `index.html`.

#### Run the build

```sh
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
