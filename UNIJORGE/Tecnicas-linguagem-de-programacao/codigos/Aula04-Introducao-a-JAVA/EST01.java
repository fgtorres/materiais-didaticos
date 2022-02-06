
package teste;

import java.util.Scanner;

public class EST01 {
    
    public static void main(String[] args) {
        
        //Declaracao de variaveis
        Double salariobase, comissao, imposto, totalvendas, salariofinal; 
        Integer contjet=0, contwind=0;
        
        //Coletar dados do funcionario
        System.out.println("Digite o seu salario base: R$");
        salariobase = new Scanner(System.in).nextDouble();
        
        System.out.println("Digite quantas unidades de jetski foram vendidas:");
        contjet = new Scanner(System.in).nextInt();
        
        System.out.println("Digite quantas unidades de pranchas de Wind surf foram vendidas:");
        contwind = new Scanner(System.in).nextInt();
        
        
        //Calcular a comissao
        // Wind surf = R$20 por unidade.
        // Jetski = < 3 = R$50 e >=3 = R$80
        comissao = (contwind * 20.0) + ((contjet<3)? (contjet*50.0):(contjet*80.0));
        totalvendas = (contwind * 4000.0) + (contjet*16000.0);
        
        //Calcular imposto de renda de 12% para salarios maiores que 1800
        salariofinal = salariobase+comissao;
        imposto = (salariofinal>1800) ? salariofinal * 0.12 : 0.0;
        salariofinal-= imposto;
        
        //Informar o salario final, total de vendas
        System.out.println("Seu salário final é R$"+(salariofinal) );
        System.out.println("Seu total de vendas é R$"+(totalvendas) );
        
        //Se ele vendeu mais que 8 equipamentos sera promovido
        System.out.println((contjet+contwind)>8 ? "Você será promovido, parabéns!" : " ");
        
    }
}
