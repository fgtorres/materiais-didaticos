
package meuapp;

import java.util.Scanner;

public class L1QB {
    
    public static void main(String[] args) {
        System.out.println("Sua temperatura atual:");
        float temp = Float.parseFloat(new Scanner(System.in).nextLine());
        
        System.out.println(temp > 37 ? "Você está com febre" : "Você está saudável");
    }
}
