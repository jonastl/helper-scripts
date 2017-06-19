#!/bin/sh
# Wrapper around docker-compose which forwards the arguments provided to
# compose, and ensures all resources created by the compose invocation are
# cleaned up afterward.  The compose exit-code is returned to the caller after
# cleanup.
#
# It is  a workaround for the absence of a flag in compose for cleaning up all
# linked / dependent resources when invoking docker-compose run.  See issue:
# https://github.com/docker/compose/issues/2791
docker-compose "$@"
exit_code=$?
docker-compose down
exit $exit_code
