########################
### Local deployment ###
########################

build:
	hugo

# FIXME
deploy: build
	rsync -avz -e ssh public/ wesleyjrz@wesleyjrz.com:/var/www/wesleyjrz.com/
