FROM node

RUN echo "Installing MMA.."

ENV MMA_INSTALL_URL https://github.com/Microsoft/OMS-Agent-for-Linux/releases/download/v1.1.0-28/omsagent-1.1.0-28.universal.x64.sh
ENV MMA_WORKSPACE_ID << add key >>
ENV MMA_WORKSPACE_KEY << add key >>

RUN apt-get update && apt-get install sudo \ 
&& wget -L "$MMA_INSTALL_URL" \
&& sha256sum ./omsagent-1.1.0-28.universal.x64.sh \
&& sudo sh ./omsagent-1.1.0-28.universal.x64.sh --upgrade -w $MMA_WORKSPACE_ID  -s $MMA_WORKSPACE_KEY

COPY .  /usr/src

WORKDIR /usr/src

CMD ["node", "index.js"]
