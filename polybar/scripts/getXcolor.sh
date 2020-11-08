xrdb -query all | grep "*$1:" | cut -d':' -f2 | xargs
