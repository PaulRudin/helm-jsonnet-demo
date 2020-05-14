#!/bin/bash
yq r - -d'*' -j -c | jsonnet driver.jsonnet |yq r - -d'*' --prettyPrint

