# Stage 1: Build LanguageTool from source and strip unused language modules
FROM maven:3.9.16-eclipse-temurin-21-alpine AS builder
ARG LT_VERSION=6.7

RUN apk add --no-cache git unzip

WORKDIR /src

RUN git clone --depth 1 --branch v${LT_VERSION} \
    https://github.com/languagetool-org/languagetool.git /src/languagetool

WORKDIR /src/languagetool

RUN mvn -T 8 -pl languagetool-standalone -am -DskipTests package \
    && unzip languagetool-standalone/target/LanguageTool-${LT_VERSION}.zip -d /dist

# Keep only English and Spanish language modules
RUN find /dist/LanguageTool-${LT_VERSION} -name "*.jar" \
    | grep -E "language-" \
    | grep -Ev "language-(en|es|detector)" \
    | xargs rm -f

# Stage 2: Production image (no shell, minimal attack surface)
FROM gcr.io/distroless/java21-debian13 AS languagetool

ARG LT_VERSION=6.7

ENV JAVA_TOOL_OPTIONS="-XX:MaxRAMPercentage=75.0 -XX:+UseG1GC -XX:MaxGCPauseMillis=100 -XX:+UseStringDeduplication"

COPY --from=builder /dist/LanguageTool-${LT_VERSION}/ /languagetool/
COPY server.properties /languagetool/server.properties

WORKDIR /languagetool

USER nonroot

EXPOSE 8010

CMD ["languagetool-server.jar", \
     "--config", "server.properties", \
     "--port", "8010", \
     "--public", \
     "--allow-origin", "*"]
