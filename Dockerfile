# Documento scritto da Alessandro Chimetto <alessandro.chimetto.it@gmail.com>
# e rilasciato sotto licenza Unlicense <http://unlicense.org/>

FROM homebrew/ubuntu20.04

ENV LANG en_US.UTF-8
ENV HOMEBREW_NO_ANALYTICS 1

RUN apt-get update && apt-get install -y locales
RUN locale-gen

RUN brew update && brew install python opendetex
RUN pip3 install textract

COPY gulpease.py /gulpease.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
