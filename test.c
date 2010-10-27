#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <strings.h>
#include <stdlib.h>
#include <stdio.h>

void error(char *msg)
{
    printf("ERROR %s", msg);
    exit(1);
}

int main() {
    int sockfd, conn, conn_len, n;
    struct sockaddr_in serv_addr, conn_addr;
    char buffer[256];

    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd < 0) 
        error("opening socket");

    bzero((char *) &serv_addr, sizeof(serv_addr));

    inet_pton(AF_INET, "0.0.0.0", (struct sockaddr_in*) &serv_addr);
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_addr.s_addr = INADDR_ANY;
    serv_addr.sin_port = htons(8000);
    if (bind(sockfd, (struct sockaddr *) &serv_addr,
            sizeof(serv_addr)) < 0) 
            error("on binding");
        listen(sockfd, 1);

    while(1) {
        conn_len = sizeof(conn_addr);
        conn = accept(sockfd, (struct sockaddr *) &conn_addr, (socklen_t*) &conn_len);

        if (conn < 0) 
            error("on accept");

        bzero(buffer,256);
        n = read(conn, buffer, 255);
        if (n < 0)
            error("ERROR reading from socket");
        n = write(conn, "<html><body>Hello, from the C socket world!</body></html>\n",59);
        close(conn);
    }

    return 0;
}