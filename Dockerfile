FROM node

RUN echo "Installing MMA.."

ENV MMA_INSTALL_URL https://github.com/Microsoft/OMS-Agent-for-Linux/releases/download/v1.1.0-28/omsagent-1.1.0-28.universal.x64.sh
ENV MMA_WORKSPACE_ID 23c99b7f-2c7d-4184-8a07-df3eced4d0ee
ENV MMA_WORKSPACE_KEY sMwYTst60nDvXhQ2n1mFrzR+BH5tu6ZsjMMvqa1T0lsRIqCN2rdM6IirQ39eYm5/JqIB47qRr4dUIyS2Wpty/Q==

RUN apt-get update && apt-get install sudo \ 
&& wget -L "$MMA_INSTALL_URL" \
&& sha256sum ./omsagent-1.1.0-28.universal.x64.sh \
&& sudo sh ./omsagent-1.1.0-28.universal.x64.sh --upgrade -w $MMA_WORKSPACE_ID  -s $MMA_WORKSPACE_KEY

COPY .  /usr/src

WORKDIR /usr/src

CMD ["node", "index.js"]