package com.mycompany.proyecto;

import java.util.Random;

public class Proyecto {

    public static void main(String[] args) {

        long startTime;
        long finalTime;
        long time;

        startTime = System.currentTimeMillis();

        int talla;
        int matriz[][];

        talla = 1000;
        matriz = new int[talla][talla];

        Random rd = new Random();

        for (int i = 0; i < talla; i++) {
            for (int j = 0; j < talla; j++) {
                matriz[i][j] = rd.nextInt(9 - 1) + 1;
                System.out.print(matriz[i][j] + " ");
            }
            System.out.println("");
        }

        finalTime = System.currentTimeMillis();
        time = finalTime - startTime;

        System.out.println("Tiempo: " + time);
    }
}
