#!/bin/bash
if [[-d .git]] && [[ "$AUTO_UPDATE" == "1" ]]; then
    echo "\033[0;32m+ \033[0mUpdating repositories.."
    git pull "https://$USERNAME:$PASSWORD@$INSTALL_REPO";
fi
if [ -f "/home/container/package.json" ]; then
    echo "\033[0;32m+ \033[0mInstalling prerequisite packages.."
    /usr/local/bin/npm install --production;
fi
if [[ ! -z "$NODE_PACKAGES" ]]; then
    echo "\033[0;32m+ \033[0mInstalling and updating add-on packages.."
    /usr/local/bin/npm install "$NODE_PACKAGES";
fi
echo "\033[0;32m+ \033[0mStarting runtime.. (SIGSTART)"
/usr/local/bin/node "/home/container/$BOT_JS_FILE"