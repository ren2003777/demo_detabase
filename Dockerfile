FROM maven:3-eclipse-temurin-17 AS build 
COPY . .//ファイルをコピー
RUN mvn clean package -Dmaven.test.skip=true//アプリケーションの実行と、テストのスキップ。
FROM eclipse-temurin:17-alpine//新しいビルドステージの開始
COPY --from=build /target/demo-0.0.1-SNAPSHOT.jar demo.jar//前のビルドステージからビルドされたjarファイル(demo.jar)を新しいビルドステージにコピー
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "demo.jar"]//実行するファイル(demo.jar)を指定