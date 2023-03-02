#!/bin/bash
sed -e '1s/^/[/' -e 's/$/]/' tag >> hosts
