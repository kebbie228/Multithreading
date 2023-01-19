package com.company.basic;

public class ThreadDemo extends Thread{

    public static void main(String[] args) {

        System.out.println("Start: " + Thread.currentThread().getName());
        ThreadDemo threadDemo=new ThreadDemo();
        threadDemo.start();

        try {
            threadDemo.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        System.out.println("Finish:" + Thread.currentThread().getName());

            }
    public void run(){

            for (int i = 0; i < 3; i++) {
                System.out.println("Thread : " + Thread.currentThread().getName() + " is running...");
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }

    }
}
