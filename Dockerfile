FROM cm2network/steamcmd:latest

ARG APP_ID
ARG STEAM_USER
ARG GAME_PATH

EXPOSE 16261/udp
EXPOSE 16262/udp

RUN pwd

RUN mkdir -p "${GAME_PATH}"

VOLUME ["${GAME_PATH}"]

RUN ./steamcmd.sh +login ${STEAM_USER} +app_update ${APP_ID} validate +quit

ENTRYPOINT [ "${GAME_PATH}/start-server.sh" ]
