#!/bin/bash

[[ "$(playerctl status 2>/dev/null)" == "Playing" ]] && echo "" || echo ""
