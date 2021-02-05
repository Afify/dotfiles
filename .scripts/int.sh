#!/bin/sh

# -avzhe ssh --progress
# rsync -avzher --rsh='ssh -p22' --progress /mnt/data/work/integral/oqooled/wp-content/plugins/insert-php-code-snippet/ integralmea@gator3071.hostgator.com:/home2/integralmea/oqooled.com/wp-content/plugins/insert-php-code-snippet/

rsync -avzher --rsh='ssh -p22' integralmea@gator3071.hostgator.com:/home2/integralmea/oqooled.com/ /mnt/data/work/integral/oqooled/
