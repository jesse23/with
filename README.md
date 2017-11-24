# with for fzf
A helper batch for [fzf](https://github.com/junegunn/fzf) on Windows.

![Preview](./doc/preview.gif?raw=true "Preview")


On Linux, the common practice for `fzf` is:

```bash
vim $(fzf)
```

On Windows platform, we can use pip to achieve same approach.

## Installation

1. Download fzf binary from [here](https://github.com/junegunn/fzf/releases) and put it to `C:\windows`.
2. Get batch and put it to `C:\windows` too.

## Usage

1. by `with <app>`, it will call file search function provided by `fzf` and pick the last selection and pass to `app` as parameter.
2. by `wtih` only, it will call `start <param>` which will do default open to the selection.
3. by `<command> | with <app>` you get the complete filter and execute function.

## Test

<iframe src="./doc/with_test.htm" frameborder="0" scrolling="no"></iframe>

## Reference

https://superuser.com/questions/343288/windows-batch-file-usebackq-quotes-within-quotes

https://stackoverflow.com/questions/3062100/piping-to-findstrs-input