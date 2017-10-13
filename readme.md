# t3toolbox

![](https://snag.gy/UdYIwK.jpg)

## How to install

### Add t3toolbox to your composer.json
Run: `composer require bo/t3toolbox`


### Add the following lines to your main composer.json:

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

**Use the "Check" task to see if everything is fine**

## Requirements

### JQ
> jq is a lightweight and flexible command-line JSON processor.

`brew install jq`

https://stedolan.github.io/jq/download/

