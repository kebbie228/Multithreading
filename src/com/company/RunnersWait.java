package com.company;

//Основной поток останавливает и возобновляет дочерний
public class RunnersWait{
    public static void main(String[] args) {
        Runner runner1 = new Runner("1");
        Thread thread1 =  new Thread(runner1);
        thread1.start();
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        runner1.stopProcess();

        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

runner1.resumeProcess();
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
thread1.interrupt();
    }
}

class Runner implements Runnable{
    String name;
    boolean  flag = false;
    Object mutex = new Object();

    public Runner(String name) {

        this.name
                = name;
    }

    @Override
    public void run() {

        int i = 1;
        while (!Thread.currentThread().isInterrupted()) {
            System.out.printf("Runner %s is running, step: %d%n",name, i++);
            waitProcess();
            try {
                Thread.sleep(100);
            } catch (InterruptedException e) {
             //   e.printStackTrace();
                return;
            }
        }
    }

    public void waitProcess(){
        synchronized (mutex){
            if (flag) {
                try {
                    mutex.wait();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public void resumeProcess(){
        synchronized (mutex){
            if (flag) {
                mutex.notifyAll();
                flag = false;
            }
        }
    }

    public void stopProcess(){
        flag = true;
    }

    public void startProcess(){
        flag = false;
    }
}