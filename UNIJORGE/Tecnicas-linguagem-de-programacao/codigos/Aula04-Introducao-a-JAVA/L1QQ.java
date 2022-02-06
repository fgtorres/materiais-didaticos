/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

import java.util.Scanner;

/**
 *
 * @author fgtorres
 */
public class L1QQ {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       
       // Questao Q
       System.out.print("Digite o valor: R$");
       Integer valor = 0;
       valor = new Scanner(System.in).nextInt();
       
       // Decompondo o valor
       Integer resto, notas;
       
       //notas 100
       notas = valor / 100;
       resto = valor % 100;
       System.out.println( notas + " notas de R$100" );
       
       
       //notas 50
       notas = resto / 50;
       resto = resto % 50;
       System.out.println( notas + " notas de R$50" );
        
       
       //notas 10
       notas = resto / 10;
       resto = resto % 10;
       System.out.println( notas + " notas de R$10" );
        
       
       //notas 5
       notas = resto / 5;
       resto = resto % 5;
       System.out.println( notas + " notas de R$5" );
        
       
       //notas 1
       notas = resto / 1;
       resto = resto % 1;
       System.out.println( notas + " notas de R$1" );
        
    }
    
}
