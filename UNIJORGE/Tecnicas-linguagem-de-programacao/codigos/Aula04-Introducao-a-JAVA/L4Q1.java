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
public class L4Q1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       
       // Questao 1
       Double soma, numero, cont, media;
       cont = 0.0;
       soma = 0.0;
       numero = 0.0;
       media = 0.0;
       
       while(true){
            System.out.print("Digite um numero: ");
            numero = new Scanner(System.in).nextDouble();
            
            if (numero == 0.0){
                media = soma / cont;
                System.out.println(" A média dos números é " + media.toString());
                break;
            }else{
                soma += numero;
                cont++;
            }
            
       }
    }
    
}
