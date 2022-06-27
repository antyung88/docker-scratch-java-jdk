# docker-scratch-java-jdk
Java jdk in scratch

# Usage

```
# Export Path
ENV PATH="/lib/runtime/bin:${PATH}"

# JDK Java Runtime
COPY --from=ghcr.io/antyung88/scratch-jdk:stable /lib /lib
COPY --from=ghcr.io/antyung88/scratch-jdk:stable /tmp /tmp

CMD ["/lib/runtime/bin/java", "-jar","/app.jar"]
```
