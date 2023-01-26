package com.company.philosofers;

import java.util.concurrent.locks.ReentrantLock;

public class DiningPhilosophers {
    private static ReentrantLock mutex=new ReentrantLock();

    public static void main(String[] args) {
        int count=3;

Philosophers[] philosophers=new Philosophers[count];
Object[] forks=new Object[count];
for(int i=0;i<count;i++)
    forks[i]=new Object();
for (int i=0;i<count;i++) {
    philosophers[i] = new Philosophers(mutex,forks[i], forks[(i + 1) % count]);
new Thread(philosophers[i],"Philosopher"+(i+1)).start();

}
    }
}
class Philosophers implements Runnable{
    ReentrantLock mutex;
    private Object leftFork;
    private Object rightFork;

    public Philosophers(ReentrantLock mutex,Object leftFork, Object rightFork) {
        this.mutex=mutex;
        this.leftFork = leftFork;
        this.rightFork = rightFork;
    }

    @Override

        public void run() {
            try {
                while (true) {
                    // thinking
                    doAction(": Thinking");
                    mutex.lock();
                    synchronized (leftFork) {
                        doAction(": Picked up left fork");
                        synchronized (rightFork) {
                            // eating
                            doAction(": Picked up right fork - eating");
                            mutex.unlock();
                            doAction(": Put down right fork");
                        }
                        // Back to thinking
                        doAction(": Put down left fork. Back to thinking");
                    }
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                return;
            }
        }

    private void doAction(String action) throws InterruptedException {
        System.out.println(Thread.currentThread().getName() + " " + action);
        Thread.sleep(((int) (Math.random() * 100)));
    }
}