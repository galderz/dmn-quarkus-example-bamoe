#!/usr/bin/env bash

set -e

# Ignore the expected failure
mvn install -Pnative -DskipTests -Dquarkus.package.quiltflower.enabled || true

javac reproducer.java
java -cp .:./target/quarkus-app/lib/main/io.quarkus.arc.arc-2.16.8.Final.jar:./target/quarkus-app/lib/main/jakarta.enterprise.jakarta.enterprise.cdi-api-2.0.2.jar:./target/quarkus-app/lib/main/com.ibm.bamoe.bamoe-ilmt-compliance-quarkus-dmoe-9.0.0.Final.jar:./target/quarkus-app/quarkus/generated-bytecode.jar reproducer
