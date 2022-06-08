package com.tech.gulimall.search.thread;

import java.util.concurrent.*;

/**
 * 线程测试
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2022-06-03 17:04:03
 **/
public class ThreadTest {

   // 当前系统中池只能有一两个，每个异步任务，提交给线程池让他自己去执行。
   public static  ExecutorService executor = Executors.newFixedThreadPool(10);

    public static void main(String[] args) throws ExecutionException, InterruptedException {
        System.out.println("main方法开始。。。。");

//        runAsync();
        supplyAsync();

        System.out.println("main方法结束。。。。。");
    }

    /**
     * CompletableFuture 不带返回值
     * @return CompletableFuture<Void>
     * @throws ExecutionException
     * @throws InterruptedException
     */
    public static CompletableFuture<Void> runAsync() throws ExecutionException, InterruptedException {
        CompletableFuture<Void> future = CompletableFuture.runAsync(() -> {
            System.out.println("当前线程： " + Thread.currentThread().getId());

            int i = 10 / 2;

            System.out.println("运行结果: " + i);
        }, executor);

        System.out.println("runAsync的返回值为： " + future.get());
        return future;
    }

    public static CompletableFuture<Long> supplyAsync() throws ExecutionException, InterruptedException {
        CompletableFuture<Long> future = CompletableFuture.supplyAsync(() -> {
            System.out.println("当前线程： " + Thread.currentThread().getId());

            try {
                TimeUnit.SECONDS.sleep(1);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            System.out.println("run end...");
            return  System.currentTimeMillis();
        }, executor);

        System.out.println("supplyAsync的返回值为：" + future.get());

        return future;
    }

    public static void thread(String[] args) throws ExecutionException, InterruptedException {

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
         * 4. 线程池 【ExecutorService】
         *      给线程池直接提交任务
         *      1、创建：
         *          1）、 Executors.newFixedThreadPool(10)
         *          2）、 new ThreadPoolExecutor(corePoolSize, maximumPoolSize, keepAliveTime, TimeUnit unit, workQueue, threadFactory, handler);
         *               七大参数：
         *                  @corePoolSize 核心线程数【一直存在，除非设置allowCoreThreadTimeOut参数】，线程池创建好以后就准备就绪的线程数量，就等待来接收异步任务去执行。
         *                                  相当于 Thread thread = new Thread(10); 当提交任务后 进行thread.start();
         *                  @maximumPoolSize 最大线程数量。控制资源
         *                  @keepAliveTime 非核心线程（maximumPoolSize - corePoolSize）的最大等待接收任务时间，若maximumPoolSize > corePoolSize才会触发
         *                  @TimeUnit unit 超时时间单位
         *                  @workQueue 阻塞队列。 当任务数量大于 maximumPoolSize 时， 就会将目前多的任务放在阻塞队列里，只要有空闲，就会去队列里面取出新任务继续执行
         *                                          new LinkedBlockingDeque<>() : 默认大小为Integer的最大值（即2^31 - 1）个队列。可能会导致内存不够，实际中会根据业务峰值去判断队列大小。
         *                  @threadFactory 线程的创建工厂，使用了工厂模式     使用默认线程工厂 ： Executors.defaultThreadFactory()
         *                  @handler 如果阻塞队列满了，按照指定的拒绝策略拒绝执行任务【RejectedExecutionHandler handler】
         *                                  private static final RejectedExecutionHandler defaultHandler = new AbortPolicy(); 默认直接丢弃
         *
         *             ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(10, 200, 10, TimeUnit.SECONDS, new LinkedBlockingDeque<>(100000), Executors.defaultThreadFactory(), new ThreadPoolExecutor.AbortPolicy());
         *     2、 CompletableFuture
         *          1）、 Future 可以获取到异步结构
         *
         *  运行流程：
         *      1、线程池创建，准备好 corePoolSize 数量的核心线程，准备接受任务
         *      2、新的任务进来，用 corePoolSize 准备好的空闲线程执行
         *          1）、corePoolSize 满了，就将再进来的任务放入阻塞队列中。空闲的 corePoolSize 就会自己去阻塞队列获取任务执行。
         *          2）、阻塞队列满了,就直接开新线程执行，最大只能开到 maximumPoolSize 指定的数量
         *          3）、maximumPoolSize 都执行好了，(maximumPoolSize - corePoolSize) 数量空闲的线程会在keepAliveTime 指定的时间后自动销毁。最终保持到 corePoolSize 大小
         *          4）、如果线程开到 maximumPoolSize 的数量，还有新任务进来，就会使用 RejectedExecutionHandler 指定的拒绝策略进行处理。
         *      3、所有的线程都是由指定的factory创建的。
         *
         *  面试：
         *      【面试题】 一个线程池 core:7  max:20 queue:50。 100个并发进来怎么分配的。
         *      【解 答】 7个会立即得到执行，50个会立即进入queue，再开13个线程进行执行。剩下的30个就使用拒绝策略【默认为直接丢弃 AbortPolicy】。
         *              如果不想直接丢弃，使用【同步方式执行 CallerRunsPolicy】 或 【丢弃执行时间最长的 DiscardOldestPolicy】
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

        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(10,
                200,
                10,
                TimeUnit.SECONDS,
                new LinkedBlockingDeque<>(100000),
                Executors.defaultThreadFactory(),
                new ThreadPoolExecutor.AbortPolicy());

        // 也可以使用 Executors 快速创建 线程池
        // 4种常见线程池
        // 创建一个可缓存线程池，如果线程池长度超过处理需要，可灵活回收空闲线程，若无可回收，则新建线程。 core = 0, 所有都可回收
        ExecutorService executorService1 = Executors.newCachedThreadPool();
        // 创建一个定长线程池，可控制线程最大并发数，超出的线程会在队列中等待。   core = max, 都不可回收
        ExecutorService executorService2 = Executors.newFixedThreadPool(10);
        // 创建一个定长线程池，支持定时及周期性任务执行。  定时任务的线程池
        ScheduledExecutorService scheduledExecutorService = Executors.newScheduledThreadPool(10);
        // 创建一个单线程化的线程池，它只会用唯一的工作线程来执行任务，保证所有任务串行化。
        ExecutorService executorService3 = Executors.newSingleThreadExecutor();

        System.out.println("main方法开始。。。。");
        // executorService.submit(task); 可以获取返回值  executorService.execute(task); 没有返回值
        executor.execute(new Thread01());
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
