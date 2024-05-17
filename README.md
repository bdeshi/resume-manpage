# intro
[![status-badge](https://build.bdeshi.space/api/badges/bdeshi/resume-manpage/status.svg)](https://build.bdeshi.space/bdeshi/resume-manpage)

Look!

it's a pdf!

it's a manpage!

no, it's my online resume! 🦸

created with [pug][pug] and [sass][sass], build with [parcel][parcel].

## setup

```bash
  # select node version
$ nvm install
$ nvm use
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

`/meta`: additional resources that aren't directly used to build the template.

- `/meta/iac`: terraform iac config for the backend services hosting the rendered site.

---

[pug]: https://pugjs.org
[sass]: https://sass-lang.com
[parcel]: https://parceljs.org
