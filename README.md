# intro
[![status-badge](https://build.bdeshi.space/api/badges/bdeshi/resume-manpage/status.svg)](https://build.bdeshi.space/bdeshi/resume-manpage)

this is a manpage-like html template, but tbh it's not really a manpage

created with [pug][pug] and [sass][sass], build with [parcel][parcel].

## setup

```bash
  # install dependencies
$ yarn install
  # build the output
$ yarn build
  # build results are here
$ ls dist
```

## contents

`/index.pug`: the starting point of the template.

`/vars.pug`: sample variables. copy it to `/vars.local.pug` and edit it.

`/includes`: template parts are located here.

- `include /somefile` from anywhere will look for `somefile` in project root
- `include ./somefile` will be relative to current pug file.

`/assets`: css/sass, scripts, images etc are located here.

`/assets/styles/index.sass`: the starting point of the sass template.

---

[pug]: https://pugjs.org
[sass]: https://sass-lang.com
[parcel]: https://parceljs.org
