# Custom nvim setup with lazy.nvim
## Prerequisites 

### Windows Specific
Make sure make/cmake & a c compiler like gcc is installed

For gcc, use chocolately to installs MINGW
```
choco install mingw
```


### General
Mason requires a compression tool like **7-zip** (download from the official webpage) and a file finder like **sharkdp.fd** (don't forget to add its location to the $PATH variable)
```
winget install sharkdp.fd
```

To make sure that markdown previewer works, you need to install the treesitter CLI. This can be done system wide but the easiest is to install it with Mason in Neovim.

```
:Mason
```

This opens the menu, then navigate to `tree-sitter-cli` and press `i`.
