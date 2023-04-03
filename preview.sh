#!/bin/sh

print_help () {
	echo "Usage: ${0} [option]"
	echo
	echo "Options:"
	echo "  --start    Start server and open with \$BROWSER."
	echo "  --stop     Kill hugo to stop the server."
	echo "  --help     Show this help message."
}

case "$1" in
	--start)
		hugo server --buildDrafts -p 1313 "$(dirname "$0")" >/dev/null &
		"$BROWSER" 127.0.0.1:1313
		echo "Server has started."
		;;
	--stop)
		pkill hugo
		echo "Server has been killed."
		;;
	--help|*)
		print_help
		;;
esac
