#!/bin/sh
set -eu
if [ -x "./gradle/wrapper/gradle-wrapper.jar" ]; then
  exec java -classpath "./gradle/wrapper/gradle-wrapper.jar" org.gradle.wrapper.GradleWrapperMain "$@"
fi
echo "Gradle wrapper JAR is missing. Generate it with 'gradle wrapper' using Gradle 8.7+." >&2
exit 1
