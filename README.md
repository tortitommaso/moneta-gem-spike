# moneta-gem-spike

https://github.com/minad/moneta

## File Cache Expiration Note

Please note the expires: true params in:
```
Moneta::Expires.new(Moneta.new(:File, dir: "/tmp/moneta-gem-spike"), __{expires: true}__ )
```
and the expiration in seconds param when storing values: 
```
store(key, value, __expires: seconds__)
```