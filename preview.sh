#!/bin/sh

defaultPort=1313
extraArgs="--buildDrafts"

start_server () {
	set -e
	hugo server ${extraArgs} -p ${defaultPort} "$(dirname "$0")"
	"$BROWSER" localhost:${defaultPort}
	echo "🟢 Hugo server is up."
}

stop_server () {
	set -e
	pkill hugo
	echo "🔴 Hugo server is down."
}

print_help () {
	echo "Usage: $0 [OPTION]"
	echo "Enable Hugo live preview and open it in the default browser."
	echo
	echo "uptions:"
	echo "  -s, --start  start server and open in default browser."
	echo "  -p, --stop   kill hugo to stop the server."
	echo "  -h, --help   show this help message."
}

invalid_argument () {
	echo "$0: invalid option -- '$1'" >&2
	echo "Try '$0 --help' for more information."
	exit 2
}

hugo_not_available () {
	echo "$0: hugo not installed" >&2
	exit 2
}

if ! command -v hugo &> /dev/null; then
	hugo_not_available
fi

if [ $# -eq 0 ]; then
	echo "$0: missing operand." >&2
	echo "Try '$0 --help' for more information."
	exit 2
fi

case "$1" in
	-s|--start)
		start_server
		;;
	-p|--stop)
		stop_server
		;;
	-h|--help)
		print_help
		;;
	*)
		invalid_argument "$1"
		;;
esac
