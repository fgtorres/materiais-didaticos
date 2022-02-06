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
public class L1QI {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       
       // Questao I
       System.out.print("Digite o seu cargo (programador ou outros): ");
       String cargo = "";
       cargo = new Scanner(System.in).nextLine();
       
       System.out.print("Digite o seu salario: R$");
       Double salario;
       salario  = new Scanner(System.in).nextDouble();
       
       //Calculando o novo salario
       Double novosalario;
       if (cargo.toLowerCase().equals("programador")){
           novosalario = salario * 1.3;
           System.out.print("Sua taxa de aumento é 30%. ");
           
       }else{
           novosalario = salario * 1.1;
           System.out.print("Sua taxa de aumento é 10%. ");
       }
       
       System.out.println("Seu novo salário é R$" + String.valueOf(novosalario));
       
    }
    
}
