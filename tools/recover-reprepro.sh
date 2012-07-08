#!/bin/bash

# Remove hard coding 'later'

# Manually uncomment this line after looking at what the script does.
exit 1

# Remove the package database(s)
rm /srv/gnewsense/db/references.db
rm /srv/gnewsense/db/packages.db

# Remove the dists files
rm -r /srv/gnewsense/dists

for component in main universe; do
        find /srv/gnewsense/pool/$component -name *.deb -exec reprepro -Vb /srv/gnewsense --component $component includedeb deltah {} \;
        find /srv/gnewsense/pool/$component -name *.udeb -exec reprepro -Vb /srv/gnewsense --component $component includeudeb deltah {} \;
        find /srv/gnewsense/pool/$component -name *.dsc -exec reprepro -Vb /srv/gnewsense --component $component includedsc deltah {} \;
done

