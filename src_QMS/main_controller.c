#include <stdio.h>
#include <signal.h>
#include <unistd.h>
#include <stdlib.h>

// Function Categorizing Scripts to run
void validate_bash();
void ModelSim_libraries();
void ModelSim_setup();
void repo_clone();
void menu_options();

int main(int argc, char** argv)
{
    static int loop = 1;
    int tty = open("/dev/tty", 2);
    int pid, w, choice;
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
      }
    }

    close(tty);
    while ((w = wait(&status)) != pid && w != -1);
    if (w == -1) status = -1;
    return status;

}


void menu_options()
{
  printf("QMS script menu\n");
  printf("Please enter the integer besides the script you wish to run\n");
  printf("\n---------------------------------------------------\n");

  printf("1.) Check if my system is ready for QMS.\n", );
  printf("2.) ModelSim 32bit libraries installation.\n");
  printf("3.) ModelSim initial setup.\n");
  printf("4.) Clone repositories.\n");
  printf("0.) To exit QMS program.\n");

  printf("\n---------------------------------------------------\n");
  scanf(%d, choice);
  switch(choice)
  {
    case 1:
    validate_bash();
    break;
    case 2:
    ModelSim_libraries();
    break;
    case 3:
    ModelSim_setup();
    break;
    case 4:
    repo_clone();
    break;
    case 0:
    loop = 0;
    break;
  }
}

void validate_bash()
{
  chdir("install/");
  system("./validate_bash.sh");
  chdir("../");
  system("pwd");
}

void ModelSim_libraries()
{
  chdir("install/");
  system("./32bit_libraries.sh");
  chdir("../");
  system("pwd");
}

void ModelSim_setup()
{
  chdir("install/");
  system("./ModelSim_setup.sh");
  chdir("../");
  system("pwd");
}

void repo_clone()
{
  chdir("repo_clone/");
  system("./repo_clone_validate.sh");
  chdir("../");
  system("pwd");
}
