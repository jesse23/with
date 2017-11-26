# With FZF on Windows
##Description

A helper batch for [fzf](https://github.com/junegunn/fzf) on Windows.

On Linux, the common practice for `fzf` is:

```bash
vim $(fzf)
```

On Windows platform, we can use pipe to achieve same approach.

## Preview

###Windows Prompt

![Preview](./doc/preview.gif?raw=true "Preview")

### MSYS2

![Preview_Msys2](./doc/preview_msys2.gif?raw=true "Preview_Msys2")

## Installation

1. Download fzf binary from [here](https://github.com/junegunn/fzf/releases) and put it to `C:\windows`.
2. Get  `bin/with.bat` and put it to `C:\windows` too.
3. For msys/cygwin get `bin/win` and put it to any localtion in `$PATH`.

## Usage

### Windows Prompt

1. by `with <app>`, it will call file search function provided by `fzf` and pick the last selection and pass to `app` as parameter.

2. by `wtih` only, it will call `start <param>` which will do default open to the selection.

3. by `<command> | with <app>` you get the complete filter and execute function.

4. For application which does not provide command line access directly, create a batch on `C:\windows` by following example below:

   ```shell
   :: C:\Windows\typora.bat 
   @echo off
   start "dummy" "C:\Program Files\Typora\Typora.exe" %*
   ```

### MSYS2/Cygwin

Same as windows prompt but 2 limitations:

1. `vim` only has 16 colors since it cannot be captured by `conEmu`. It may presents different with `Gvim` and common `vim` callo.
2. `pipe` is not usable(because of `winpty`).

###With Fd

The default file finder in fzf windows is `dir /s /b`. by using [fd](https://github.com/sharkdp/fd), you can get a decent improvement. For using it, just need to:

1. Get `fd` binary and put it to `c:\windows`.

2. Modify `with.bat` to enable it:

   ```shell
   :: Do FZF Setting Here
   set FZF_DEFAULT_COMMAND=fd -a -j 4
   ```

## Test

![Test](./doc/Test.png?raw=true "Test")

## Trouble Shoot

### "D:\xxxxxx\xxxx" Illegal file name in vim/Gvim

I don't know what is the root cause for this for now, but it is no impact to any functionality.

### zsh: command not found: with

Make sure the location of script is in `$PATH`.

## Reference

https://superuser.com/questions/343288/windows-batch-file-usebackq-quotes-within-quotes

https://stackoverflow.com/questions/3062100/piping-to-findstrs-input
