
put this project in ~/dev-env.


## Run
run `run --dry` to see what it runs by default. 

You probably want to run `run ordered --extras --dry` first.  

`ordered` runs things in the right ... order.  But it isn't run by default because `run` is set up to run a particular script in `/runs`.  `--extras` enables the ability to use these excluded-by-default scripts.



## Dotfiles

run `dotfiles` to copy my dotfiles to where they need to be. This requires that this project be in ~/dot-env.  (see top of dot-zshrc)


you can run `dotfiles --dry` if you want to see what it will do.


