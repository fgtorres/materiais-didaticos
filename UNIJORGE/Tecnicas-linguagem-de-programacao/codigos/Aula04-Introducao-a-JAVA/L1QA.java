//Pacote que esse codigo esta organizado
package meuapp;

import java.util.Scanner;
//Declaracao da classe MeuApp

public class L1QA{

    //Metodo principal
    public static void main(String[] args) {
        int idade = 0;
        System.out.println("digite sua idade");
        idade = new Scanner(System.in).nextInt();
        
        if(idade < 18){
            System.out.println("infelizmente você não tem idade para dirigir");
        }else {
            System.out.println("Parabéns você tem idade para dirigir");
        }
        
        
    }

}
