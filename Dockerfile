FROM madnificent/lisp-webservice:0.8.0

RUN chmod a+x /usr/local/bin/sbcl

RUN mkdir /resource-mu-cl
WORKDIR /resource-mu-cl

COPY . ./app
COPY load-config.sh ./load-config.sh
COPY startup-resources.sh ./startup-resources.sh

ENV BOOT=mu-cl-resources
RUN mkdir -p ./config
RUN sbcl --load /usr/src/load.lisp

RUN chmod a+rwx /resource-mu-cl/**/*
RUN mkdir -p /.roswell
RUN chmod a+rwx /.roswell
RUN mkdir -p /.cache
RUN chmod a+rwx /.cache

CMD ["./startup-resources.sh"]
