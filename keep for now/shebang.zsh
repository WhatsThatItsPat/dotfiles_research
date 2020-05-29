#!/bin/zsh

echo "~~~ Running $0 ~~~"
echo "ZSH_VERSION = $ZSH_VERSION"
echo "The current shell is: $(ps $$ -ocomm=)"


which exists
exists brew && echo "excellent!!!" || echo "bogus"
exists nonexistent && echo "excellent" || echo "bogus!!!"

sleep 10; echo "...done"