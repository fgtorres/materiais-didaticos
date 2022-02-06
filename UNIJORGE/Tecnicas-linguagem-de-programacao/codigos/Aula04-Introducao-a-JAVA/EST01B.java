
package teste;

import java.util.Scanner;

public class EST01B {
    
    public static void main(String[] args) {
        
        //Pedir os cm
        System.out.println("Digite a distancia em centimetros: ");
        Integer cm = new Scanner(System.in).nextInt();
        
        //retornar em km m cm
        Integer km = cm / 100000;
        cm = cm % 100000;
        
        Integer m = cm / 100;
        cm = cm % 100;
        
        System.out.println(km + "KM, " +m + " metros e "+ cm + " cm.");
        
    }
}
