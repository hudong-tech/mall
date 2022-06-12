package com.tech.gulimall.search.thread;

/**
 * 模拟死锁
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2022-06-13 00:07:58
 **/
public class DeadLock {

    // 资源1
    private static final Object resource1 = new Object();
    // 资源2
    private static final Object resource2 = new Object();

    public static void main(String[] args) {
        deadLockDemo();
    }

    public static void deadLockDemo(){
        new Thread(() -> {
            synchronized (resource1) {
                System.out.println("get resource1");
                try {
                    // 模拟业务
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
                System.out.println("waiting get resource2");
                synchronized (resource2) {
                    System.out.println("get resource2");
                }
            }
        }, "线程1").start();

        new Thread(() -> {
            synchronized (resource2) {
                System.out.println("get resource2");
                try {
                    // 模拟业务
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
                System.out.println("waiting get resource1");

                synchronized (resource1) {
                    System.out.println("get resource1");
                }
            }
        }, "线程2").start();

    }
}
