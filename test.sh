#!/bin/bash

set -ox pipefail

curl -H "Cookie:a=b;d=e;" localhost:8080/abc

curl -H "Cookie:a=b;d=e;" localhost:8080/a%20c