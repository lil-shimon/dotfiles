# Cheat Sheet

## Normal Mode
- `:call dein#install()`  :  plugin install
- `:call dein#update()`  :  plugin update
- `:call {plugin name}#Status()`  : check plugin install correctly 
- `:PreviewMarkdown` : preview markdown using mdr
- `:h UltiSnips`  :  UltiSnips (snippets) help
- `:UltiSnipsEdit`  :  create the base of snippets file
- `:hi`  :  show what colors are you use on vim
- `.`  :  前回の動作を再度使う (vim-repeat)
- `K`  :  カーソル上の文字の説明をみる
- `gd`  : search word on cursor (go to definition)
- `gh`  : lsp-saga lsp finder
- `<C-j>`  : lsp-saga diagnostic_jump_next
- `space b`  :  open browser smart search by key word on cursor
- `<leader>j`  :  auto import (React)
- `<C-w>left`  :  resize window
- `<C-w>right`  :  resize window
- `<C-w>up`  :  resize window
- `<C-w>down`  :  resize window
- `ss`  :  split window (horizontal)
- `sv`  :  split window (vertical)
- `<silent>K`  :  display (hover_doc) diagnostic (lsp-saga)
- `<silent><C-j>`  : jump diagnostic (lsp-saga)
- `<silent>gh`  : display the cursor word's references and definitions. to exit, press q
- `:TSInstallInfo`  : get a list of all available languages and their installation status (TreeSitter)
- `<silent> <C-P>` : Telescope discover files
- `<silent> <C-L>` : Telescope grep
- `<silent> \\` : Telescope buffers
- `<silent> ;;` : Telescope help
- `<leader>f` : formatter
- `<Tab>` : normal: indent. luasnip: jump to next. compe: complete
- `<s-Tab>f` : luasnip: jump to prev. compe: select from bottom
- `<C-u> : scroll up smoothly
- `<C-d> : scroll down smoothly
- `<zz> : scroll screen center
- `<zt> : scroll screen top
- `<zb> : scroll screen bottom


## Insert Mode 

- `<C-d>`  :  BS
- `<C-h>`  :  Left
- `<C-l>`  :  Right
- `<C-k>`  :  Up
- `<C-j>`  :  Down
- `>`  :  close tag
- `>>`  :  close tag and enter
- `<C-j>`  :  next (UltiSnips)
- `<C-k>`  :  before (UltiSnips)


## Visual Mode
- `.`  :  前回の動作を再度使う (vim-repeat)
- `gaip   = `  : = の位置で揃える (vim-easy-align)
- `gaip  *= `  : = の位置で揃える (vim-easy-align)
- `gaip* *= `  : = の位置で揃える


## ale linter

- `C-k`  :  前の警告へジャンプ
- `C-j`  :  後ろの警告へジャンプ



## coc

- `CocCommend flutter.run`  :  run flutter runJ
- `CocList`  :  open coc list
- `CocExtension`  :  open coc extension settings
- `CocUninstall [plug name]`  :  remove extension


## fzf command

 `<C-p>`  :  search files
- `<leader>ag`  :  search words in all files (:Ag)


## nerdtree command

- `<C-a>`  :  show nerdtree
- `m`  :  dir actions
- `m + a`  :  add file or directory
- `m + d`  :  delete file
- `m + m`  :  move file

## config keymap

- `space .`  :  open init.vim


## terminal on nvim

- `:Tnew`        :  open terminal
- `T {command}`  :  execute command
- `C-w`          :  exit terminal mode


## vim-plug commands

- `PlugInstall`    :  install plugin


## React snippets

- `clg`        :  console.log
- `imp`        :  import {} from ""
- `imr`        :  import React from 'react'
- `ecr`        :  export const func
- `ustl`        :  useStyles
- `styl`        :  styled-components
- `reactbase`        :  my react base component format
- `classes`        :  classes declaration for useStyles
- `cm`        :  block comment
- `cme`        :  expend block comment
- `immakestyles`        :  import makeStyles
- `rf`        :  react fragment
- `jsx`        :  html in jsx
- `className`        :  className def
- `us`        :  useState
- `ue`        :  useState
- `handler`        :  handler (w/ return)
- `setarr`        :  setState for array
- `sw`        :  switch 
- `cdir`        :  console.dir 


## toml snippets

- `plu`        :  plugin install format (basic)
- `cm`        :  comment for toml


## php (laravel) snippets

- `func`        :  basic function
- `furcr`        :  simple return function
- `mdl`        :  basic model
- `fr`        :  foreach
- `trans`        :  transaction
- `class`        :  simple class temp
- `routefunc`        :  simple route func temp
- `route`        :  simple route temp
- `pri`        :  private variable declaration
- `join`        :  join
- `where`        :  simple where
- `wherejsoncontains` : whereJsonContains
- `empty` : isEmpty method
- `notempty` : isNotEmpty method
- `typeof` : getType method.
- `date` : date()
- `modify` : date modify
- `datecalcstr` : temp of string date calc



## dart snippets

- `cls`        :  dart class (basic)
- `cm`        :  dart comment that is like ///
- `fi`        :  define final 
- `stt`        :  static define
- `stc`        :  call static defined
- `route`        :  simple route for materialApp in dart (flutter)
- `material`        :  import package:flutter/material.dart
- `_cs`        :  constructor
- `reqd`        :  simply use for @required
- `named`        :  Navigator.pushNamed
- `press`        :  onPressed


## scss snippets

- `sc`        :  base css format
- `var`        :  declare variable
- `if`        :  if statement
- `ife`        :  if else statement
- `elif`        :  if else else if
- `cm`        :  comment
- `and`        :  &__--


## python snippets

- `imr`        :  from import
- `cls`        :  class statement (basic)
- `dev`        :  def statement (basic)


## blade snippets

- `if`        :  if else
- `ifel`        :  if elseif else
- `push`        :  define push


---


# luasnip snippets


## React

- `imr`        :  import React from 'react'
- `im`        :  import statement snip
- `cm`        :  oneline comment


## java

- `fn`        :  basic function statement


## rust

- `fn`        :  basic function statement


---


## fish keymap

- `<C-R>` : peco ( search history )

