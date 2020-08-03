#!/bin/bash

echo $SWIFT_VERSION > /usercode/version

exec 1> "/usercode/log"
exec 2> "/usercode/errors"

$@ /usercode/main.swift

mv /usercode/log /usercode/completed
