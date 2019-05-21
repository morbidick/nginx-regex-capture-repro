# nginx regex capture group encoding error

nginx regex capture groups seem to urlencode the content as soon as the request uri itself is url encoded.

## Repro

* start nginx inside docker with the attached config via `start.sh`
* `test.sh` runs two requests, one against `/abc` and one against `/a%20c`
* the variable set via regex is urlencoded in the second request