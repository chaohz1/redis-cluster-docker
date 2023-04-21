FROM gcc:7
WORKDIR /apps/predixy
COPY predixy /apps/predixy
RUN chmod +x /apps/predixy
RUN [ "make" ]
RUN [ "cp", "/apps/predixy/src/predixy", "/bin" ]
EXPOSE 7617
