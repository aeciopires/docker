#!/bin/bash

set -e

echo "=> Starting and running Grafana..."
service grafana-server restart
