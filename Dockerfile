FROM ubuntu:latest

RUN apt update
RUN apt install -y ubuntu-standard man-db manpages-posix nano vim tree less sudo curl wget bsdmainutils
RUN find / -name "unminimize" 2>/dev/null || echo "NOT FOUND"
