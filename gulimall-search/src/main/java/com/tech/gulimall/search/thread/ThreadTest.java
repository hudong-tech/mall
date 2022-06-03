package com.tech.gulimall.search.thread;

import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * 线程测试
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2022-06-03 17:04:03
 **/
public class ThreadTest {

   // 当前系统中池只能有一两个，每个异步任务，提交给线程池让他自己去执行。
   public static  ExecutorService executorService = Executors.newFixedThreadPool(10);

    public static void main(String[] args) throws ExecutionException, InterruptedException {

        /**
         * 初始化线程的4种方式：
         *
         * 1. 继承Thread
         *         System.out.println("main方法开始。。。。");
         *         Thread01 thread = new Thread01();
         *         thread.start();
         *         System.out.println("main方法结束。。。。。");
         * 2. 实现Runnable接口
         *         System.out.println("main方法开始。。。。");
         *         Runnable01 runnable01 = new Runnable01();
         *         new Thread(runnable01).start();
         *         System.out.println("main方法结束。。。。。");
         * 3. 实现Callable接口 + FutureTask （可以拿到返回结果，可以处理异常）   jdk1.5之后
         *         System.out.println("main方法开始。。。。");
         *         FutureTask<Integer> futureTask = new FutureTask<>(new Callable01());
         *         new Thread(futureTask).start();
         *         // 阻塞等待整个线程执行完成，获取返回结果
         *         Integer integer = futureTask.get();
         *         System.out.println("main方法结束。。。。。" + integer);
         * 4. 线程池
         *      给线程池直接提交任务
         *
         * 总结：
         *      在业务代码里，前三种启动线程的方式都不会用。【应该将所有的多线程异步任务都交给线程池执行】
         *
         * 区别：
         *      1，2 不能得到返回值，3 可以获取返回值
         *      1，2，3都不能控制资源
         *      4可以控制资源，性能稳定。
         * @param args
         */
        System.out.println("main方法开始。。。。");
        // executorService.submit(task); 可以获取返回值  executorService.execute(task); 没有返回值
        executorService.execute(new Thread01());
        System.out.println("main方法结束。。。。。");
    }

    public static class Thread01 extends Thread {
        @Override
        public void run() {
            System.out.println("当前线程：" + Thread.currentThread().getId());
            int i = 10 / 2;
            System.out.println("运行结果：" + i);
        }
    }

    public static class Runnable01 implements Runnable {
        @Override
        public void run() {
            System.out.println("当前线程：" + Thread.currentThread().getId());
            int i = 10 / 2;
            System.out.println("运行结果：" + i);
        }
    }

    public static class Callable01 implements Callable<Integer> {
        @Override
        public Integer call() throws Exception {
            System.out.println("当前线程：" + Thread.currentThread().getId());
            int i = 10 / 2;
            System.out.println("运行结果：" + i);
            return i;
        }
    }
}
