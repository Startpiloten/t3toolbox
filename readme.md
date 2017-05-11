# t3toolbox

## composer.json
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
After you have added this lines please run `composer install` or `composer update`

## How to use
If you use PHPStorm go to `vendor/bo/t3toolbox`. Rightclick on the `gulpfile.js` and show gulp taks. 

## Requirements

### JQ
> jq is a lightweight and flexible command-line JSON processor.

`brew install jq`

https://stedolan.github.io/jq/download/

