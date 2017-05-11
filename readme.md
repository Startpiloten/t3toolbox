# t3toolbox

##composer.json
Add the following lins to your main composer.json:

```
"scripts": {
    "post-update-cmd": [
      "cd vendor/bo/t3toolbox && npm update --silent"
    ],
    "post-install-cmd": [
      "cd vendor/bo/t3toolbox && npm update --silent"
    ]
  }
``` 

##Requirements

###JQ
> jq is a lightweight and flexible command-line JSON processor.

`brew install jq`

https://stedolan.github.io/jq/download/



