#define  _XOPEN_SOURCE 600
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <time.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <limits.h>

int main(int argc, char ** argv){
  long int n;
  pid_t pidFils;
  int i;
  int status;

  if(argc != 2){
    fprintf(stderr,"erreur: mauvais nombre d'arguments\n***AIDE***\n./proc entiern\n");
    exit(EXIT_FAILURE);
  }
  /*conversion d'un char* en long int*/
  n=strtol(argv[1],argv,0);
  if(n == LONG_MAX || n == LONG_MIN){/*débordement supérieur (overflow) ou inférieur (underflow) */
    if(errno == EINVAL){
      fprintf(stderr,"erreur:La base donnée n'est pas supportée\n");
      exit(EXIT_FAILURE);
    }else if(errno == ERANGE){
      fprintf(stderr,"erreur:La valeur renvoyée est hors limites\n");
      exit(EXIT_FAILURE);
    }
  }

  for(i=1;i<=n;i++){
    /*Création d'un fils*/
    pidFils=fork();
    if(pidFils == -1){
      if(errno == EAGAIN){
        fprintf(stderr,"erreur:fork() ne peut pas allouer assez de mémoire pour copier la table des pages du père et une structure de tâche pour le fils.\n");
        exit(EXIT_FAILURE);
      }else if(errno == ENOMEM){
        fprintf(stderr,"erreur:fork() a échoué car le noyau n'a plus assez de mémoire\n");
        exit(EXIT_FAILURE);
      }
    }else if(pidFils == 0){/*Code exécuté par le fils*/
      srand (time (NULL)+i);/* sans le +i le nombre pseudo aléatoire est le même pour l'ensemble des processus*/
      sleep(rand() % 10);/*gènère une pause en sec*/
      printf("Je suis le fils numéro %d\n",i);
      exit(EXIT_SUCCESS);
    }else{/*Code exécuté par le père*/
      if(wait(&status) == -1){
         if(errno == ECHILD){
           fprintf(stderr,"erreur:Le processus appelant n'a aucun fils à attendre.\n");
           exit(EXIT_FAILURE);
         }else if(errno == EINTR){
           fprintf(stderr,"erreur:WNOHANG n'est pas indiqué, et un signal à intercepter ou SIGCHLD a été reçu.\n");
           exit(EXIT_FAILURE);
         }else if(errno == EINVAL){
           fprintf(stderr,"erreur: L'argument options est invalide.\n");
           exit(EXIT_FAILURE);
         }
      }else if(WIFEXITED(status)){/*renvoie vrai si le fils s'est terminé normalement*/
        printf("Mon fils ayant le  pid %d est mort et son code de sortie est %d \n",pidFils,WEXITSTATUS(status));
      }
    }
  }
  return EXIT_SUCCESS;
}
