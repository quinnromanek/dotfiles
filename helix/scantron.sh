#!/usr/bin/env bash

zellij run -c --direction right -- scantron -c "pnpm vitest run --reporter=junit" $1

