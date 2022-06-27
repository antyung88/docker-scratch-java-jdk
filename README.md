# docker-scratch-java-jdk [![Release Github Packages](https://github.com/antyung88/docker-scratch-java-jdk/actions/workflows/release.yml/badge.svg)](https://github.com/antyung88/docker-scratch-java-jdk/actions/workflows/release.yml)
Java jdk in scratch 

# Usage

```
FROM scratch

# Export Path
ENV PATH="/lib/runtime/bin:${PATH}"

# JDK Java Runtime
COPY --from=ghcr.io/antyung88/scratch-jdk:stable /lib /lib
COPY --from=ghcr.io/antyung88/scratch-jdk:stable /tmp /tmp

CMD ["/lib/runtime/bin/java", "-jar","/app.jar"]
```
