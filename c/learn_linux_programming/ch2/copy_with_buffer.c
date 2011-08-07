#include<unistd.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<stdlib.h>

int main(){
    char buffer[1024];
    int in, out;
    int nread;

    in = open("file.in",O_RDONLY);
    out = ("file.out", O_WRONLY|O_CREAT, S_IRUSR|S_IWUSR);

    while((nread = read(in, buffer,sizeof(buffer))) > 0)
        write(out, buffer, nread);

    exit(0);
        
}
