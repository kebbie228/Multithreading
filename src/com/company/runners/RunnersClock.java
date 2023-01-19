package com.company.runners;

//Потоки выполняются определенное время
public class RunnersClock {
    public static void main(String[] args) {
        Thread thread1=new Thread(new Runner("Alex"));
        Thread thread2=new Thread(new Runner("Taylor"));

        thread1.setPriority(1);
        thread1.start();

        thread2.setPriority(10);
        thread2.start();
    }
}
class Runner implements Runnable{
private String name;

    public Runner(String name) {
        this.name = name;
    }

    @Override
    public void run() {
        int i=1;
        long start = System.currentTimeMillis();
        while (System.currentTimeMillis() < start + 1020) {

                System.out.printf("Runner %s is running, step:%d\n ", name, i++);
                try {
                    Thread.sleep(100);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }

        }
    }
}