#!/bin/sh
set -e
PRG="$0"
while [ -h "$PRG" ] ; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
        PRG="$link"
    else
        PRG=`dirname "$PRG"`/"$link"
    fi
done
SAVED="`pwd`"
cd "`dirname \"$PRG\"`/" >/dev/null
APP_HOME="`pwd -P`"
cd "$SAVED" >/dev/null
APP_NAME="Gradle"
APP_BASE_NAME=`basename "$0"`
DEFAULT_JVM_OPTS='"-Xmx64m" "-Xms64m"'
MAX_FD="maximum"
warn () { echo "$*"; }
die () { echo; echo "$*"; echo; exit 1; }
cygwin=false; msys=false; darwin=false; nonstop=false
case "`uname`" in
  CYGWIN* ) cygwin=true ;;
  Darwin* ) darwin=true ;;
  MINGW* | MSYS* ) msys=true ;;
  NONSTOP* ) nonstop=true ;;
esac
CLASSPATH=$APP_HOME/gradle/wrapper/gradle-wrapper.jar
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        JAVACMD="$JAVA_HOME/jre/sh/java"
    else
        JAVACMD="$JAVA_HOME/bin/java"
    fi
    if [ ! -x "$JAVACMD" ] ; then
        die "ERROR: JAVA_HOME invalid: $JAVA_HOME"
    fi
else
    JAVACMD="java"
    which java >/dev/null 2>&1 || die "ERROR: JAVA_HOME not set"
fi
if ! "$cygwin" && ! "$darwin" && ! "$nonstop" ; then
    case $MAX_FD in max*) MAX_FD=$( ulimit -H -n ) || warn "Could not query fd limit" ;; esac
    case $MAX_FD in '' | soft) ;; *) ulimit -n "$MAX_FD" || warn "Could not set fd limit" ;; esac
fi
set -- org.gradle.wrapper.GradleWrapperMain "$@"
if ! command -v xargs >/dev/null 2>&1; then die "xargs not available"; fi
JVM_OPTS_FILE=$(mktemp)
trap 'rm -f "$JVM_OPTS_FILE"' EXIT
echo "$DEFAULT_JVM_OPTS $JAVA_OPTS $GRADLE_OPTS" > "$JVM_OPTS_FILE"
xargs -n1 < "$JVM_OPTS_FILE" 2>/dev/null | while IFS= read -r arg; do [ -n "$arg" ] && set -- "$arg" "$@"; done
save () { for i do printf %s\\n "$i" | sed "s/'/'\\\\''/g;1s/^/'/;\$s/$/' \\\\/" ; done; }
APP_ARGS=$(save "$@")
eval set -- $APP_ARGS
[ "$(uname)" = "Darwin" ] && [ -z "$JAVA_HOME" ] && cd "$(dirname "$0")"
exec "$JAVACMD" "$@"
