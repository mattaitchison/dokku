#!/usr/bin/env bash

case "$CIRCLE_NODE_INDEX" in
  0)
    echo "=====> make unit-tests"
    sudo -E make -e unit-tests
    ;;

  1)
    echo "=====> make deploy-tests (herokuish release)"
    sudo -E make -e deploy-tests
    ;;

  2)
    echo "=====> make deploy-tests (herokuish master)"
    docker rmi -f gliderlabs/herokuish && \
    sudo -E BUILD_STACK=true make -e stack && \
    sudo -E make -e deploy-tests
    ;;
esac
