#!/bin/bash
printf "plain:\n"
curl -H "Cookie:a=b;d=e;" localhost:8080/abc
printf "\n\n"

printf "encoded:\n"
curl -H "Cookie:a=b;d=e;" localhost:8080/a%20c
printf "\n"