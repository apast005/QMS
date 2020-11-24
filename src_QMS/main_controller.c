#include <stdio.h>
#include <signal.h>
#include <unistd.h>
#include <stdlib.h>

void repo_clone();
void menu_options();

int main(int argc, char** argv)
{
    static int loop = 1;
    int tty = open("/dev/tty", 2);
    int pid, w;
    int status = 0;

    if (tty == -1)
    {
      fprintf(stderr, "Can't open /dev/tty\n" );
      return -1;
    }

    if ((pid = fork()) == 0)
    {
      close(0); dup(tty);
      close(1); dup(tty);
      close(2); dup(tty);
      close(tty);

      while(loop)
      {
        menu_options();
        char choice = getchar();
        switch(choice)
        {
          case 'c':
          repo_clone();
          break;
          case 'e':
          loop = 0;
          break;
        }
      }

    }
    close(tty);
    while ((w = wait(&status)) != pid && w != -1);
    if (w == -1) status = -1;
    return status;
}


void menu_options()
{
  printf("Input c for repo_clone directory.\n");
  printf("Input e to exit program.\n");
}

void repo_clone()
{
  chdir("repo_clone/");
  system("./test_script.sh");
  chdir("../");
  system("pwd");
}
