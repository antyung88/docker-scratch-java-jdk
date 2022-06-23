FROM eclipse-temurin:18-jdk-alpine

# Create a custom Java runtime
RUN apk add binutils --no-cache
RUN $JAVA_HOME/bin/jlink \
         --add-modules java.base,java.compiler,java.datatransfer,java.desktop,java.instrument,java.logging,java.management,java.management.rmi,java.naming,java.net.http,java.prefs,java.rmi,java.scripting,java.se,java.security.jgss,java.security.sasl,java.sql,java.sql.rowset,java.transaction.xa,java.xml,java.xml.crypto,jdk.unsupported,jdk.management,jdk.crypto.ec,java.net \
         --strip-debug \
         --no-man-pages \
         --no-header-files \
         --compress=2 \
         --output /lib/runtime \
         && rm -rf /lib/apk \
         && rm -rf /lib/runtime/legal \
         && rm -rf /lib/runtime/security \
         && strip --strip-unneeded /lib/runtime/lib/server/libjvm.so \
         && cd /lib/runtime/lib;for i in `ls /lib/runtime/lib | grep -i so | awk '{print $1}'`;do strip --strip-unneeded $i;done \
         && rm -rf /tmp/*
