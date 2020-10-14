FROM oracle/graalvm-ce:20.2.0-java11 as graalvm
RUN gu install native-image

COPY . /home/app/mvsvc-ntv
WORKDIR /home/app/mvsvc-ntv

RUN native-image -cp target/mvsvc-ntv-*.jar

FROM frolvlad/alpine-glibc
RUN apk update && apk add libstdc++
EXPOSE 8080
COPY --from=graalvm /home/app/mvsvc-ntv/mvsvc-ntv /app/mvsvc-ntv
ENTRYPOINT ["/app/mvsvc-ntv"]
