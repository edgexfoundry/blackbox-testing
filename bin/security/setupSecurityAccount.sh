#!/bin/bash

option="${1}"

# x86_64 or arm64 for make run option
[ "$(uname -m)" != "x86_64" ] && USE_ARM64="-arm64"

BB_ROOT_DIR=$(cd $(dirname "$0"); cd ..; pwd)
MAKEFILE=$BB_ROOT_DIR/Makefile

case ${option} in
  -useradd)
  echo "Info: Add security account."
  TOKEN=`docker run --rm \
		-e SECRETSERVICE_SERVER=edgex-vault \
		-e KONGURL_SERVER=kong \
		-e SECRETSERVICE_TOKENPATH=/tmp/edgex/secrets/edgex-security-proxy-setup/secrets-token.json \
		-e SECRETSERVICE_CACERTPATH=/tmp/edgex/secrets/ca/ca.pem \
		--network edgex_edgex-network \
		--volume /tmp/edgex/secrets/ca:/tmp/edgex/secrets/ca:ro,z \
		--volume /tmp/edgex/secrets/edgex-security-proxy-setup:/tmp/edgex/secrets/edgex-security-proxy-setup:ro,z \
		nexus3.edgexfoundry.org:10004/docker-edgex-security-proxy-setup-go${USE_ARM64}:master \
		--init=false --useradd=testinguser --group=admin \
		| grep "access token for user testinguser is" | sed 's/.*: \([^.]*\.[^.]*\.[^.]*\).*/\1/'`
  echo TOKEN=$TOKEN
  ;;
  -userdel)
  echo "Info: Delete security account."
  	docker run --rm \
		-e SECRETSERVICE_SERVER=edgex-vault \
		-e KONGURL_SERVER=kong \
		-e SECRETSERVICE_TOKENPATH=/tmp/edgex/secrets/edgex-security-proxy-setup/secrets-token.json \
		-e SECRETSERVICE_CACERTPATH=/tmp/edgex/secrets/ca/ca.pem \
		--network edgex_edgex-network \
		--volume /tmp/edgex/secrets/ca:/tmp/edgex/secrets/ca:ro,z \
		--volume /tmp/edgex/secrets/edgex-security-proxy-setup:/tmp/edgex/secrets/edgex-security-proxy-setup:ro,z \
		nexus3.edgexfoundry.org:10004/docker-edgex-security-proxy-setup-go${USE_ARM64}:master \
		--init=false --userdel=testinguser \
		| grep "successful to delete"
  ;;
  *)
  exit 0
  ;;
esac
