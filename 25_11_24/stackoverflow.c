#include <stdio.h>
#include <stdlib.h>
#include <string.h>


char * gets(char*);


char * login() {
char * username = (char*)malloc(32);
printf("Username: ");
username = gets(username);
return username;
}

int main() {
    char * username = login();
    printf("User: %s\n", username);
}