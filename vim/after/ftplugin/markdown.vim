" see https://github.com/preservim/vim-markdown/issues/138
syn clear htmlTag
"syn region htmlTag start=+<[[:alnum:]]+ end=+>+ fold contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent,htmlCssDefinition,@htmlPreproc,@htmlArgCluster
"                          ^^^^^^^^^^^ redefined this part
