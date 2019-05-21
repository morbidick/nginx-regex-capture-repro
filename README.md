# nginx regex capture group encoding error

nginx regex capture groups seem to urlencode the content as soon as the request uri itself is url encoded.

## Repro

* start nginx inside docker with the attached config via `start.sh`
* `test.sh` runs two requests, one against `/abc` and one against `/a%20c`
* the variable set via regex is urlencoded in the second request

### output

```bash
$ curl -H 'Cookie:a=b;d=e;' localhost:8080/abc
 Request uri: /abc 
 Cookie: a=b;d=e; 
 captured: a=b;d=e; 
 direct: a=b;d=e; 

$ curl -H 'Cookie:a=b;d=e;' localhost:8080/a%20c
 Request uri: /a%20c 
 Cookie: a=b;d=e; 
 captured: a=b%3Bd=e%3B # <- url encoded broken
 direct: a=b;d=e; 
```

### workaround

by using [named capture groups](nginx.conf#L19) this behaviour can be prevented.
