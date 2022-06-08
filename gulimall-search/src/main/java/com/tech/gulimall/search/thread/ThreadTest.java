package com.tech.gulimall.search.thread;

import java.util.concurrent.*;

import static java.lang.Thread.sleep;

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

    public static void main(String[] args) throws Exception{
        System.out.println("main方法开始。。。。");

//        runAsync();
//        supplyAsync();
//        whenComplete();
//        handle();
//        thenRunAsync();
//        thenAcceptAsync();
//        thenApplyAsync();
//        runAfterBothAsync();
//        thenAcceptBothAsync();
//        thenCombineAsync();
//        runAfterEitherAsync();
//        acceptEitherAsync();
//        applyToEitherAsync();
//        allOf();
        anyOf();

        System.out.println("main方法结束。。。。。");
    }

    /**
     * CompletableFuture-多任务组合
     * allOf() 等待所有任务完成
     * @throws ExecutionException
     * @throws InterruptedException
     */
    public static void allOf() throws Exception{
        CompletableFuture<String> futureImg = CompletableFuture.supplyAsync(() -> {
            System.out.println("模拟查询商品的图片信息....");
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            return "phone.jpg";
        }, executor);

        CompletableFuture<String> futureAttr = CompletableFuture.supplyAsync(() -> {
            System.out.println("模拟查询商品的属性信息....");
            try {
                Thread.sleep(20);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            return "黑色 + 256G";
        }, executor);

        CompletableFuture<String> futureDesc = CompletableFuture.supplyAsync(() -> {
            System.out.println("模拟查询商品介绍....");
            try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            return "华为";
        }, executor);

        CompletableFuture<Void> allOf = CompletableFuture.allOf(futureImg, futureAttr, futureDesc);
        // 等待所有结果完成
        System.out.println(allOf.get());
        System.out.println(futureImg.get() + " --> " + futureAttr.get() + " --> " + futureDesc.get());
    }

    /**
     * CompletableFuture-多任务组合
     * anyOf() 等待任意一个任务完成
     * @throws ExecutionException
     * @throws InterruptedException
     */
    public static void anyOf() throws Exception{
        CompletableFuture<String> futureImg = CompletableFuture.supplyAsync(() -> {
            System.out.println("模拟查询商品的图片信息....");
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            return "phone.jpg";
        }, executor);

        CompletableFuture<String> futureAttr = CompletableFuture.supplyAsync(() -> {
            System.out.println("模拟查询商品的属性信息....");
            try {
                Thread.sleep(20);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            return "黑色 + 256G";
        }, executor);

        CompletableFuture<String> futureDesc = CompletableFuture.supplyAsync(() -> {
            System.out.println("模拟查询商品介绍....");
            try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            return "华为";
        }, executor);

        CompletableFuture<Object> anyOf = CompletableFuture.anyOf(futureImg, futureAttr, futureDesc);
        // 任意一个任务完成
        System.out.println(anyOf.get());
    }

    /**
     * CompletableFuture-两任务组合-都要完成，才能开启第三个任务
     * runAfterBothAsync() 不能接收两个任务的参数，且无返回值
     * @throws ExecutionException
     * @throws InterruptedException
     */
    public static void runAfterBothAsync() throws ExecutionException, InterruptedException {
        CompletableFuture<Integer> future01 = CompletableFuture.supplyAsync(() -> {
            System.out.println("任务1线程： " + Thread.currentThread().getId());
            int i = 10 / 2;
            System.out.println("任务1结束");
            return i;
        }, executor);
        CompletableFuture<String> future02 = CompletableFuture.supplyAsync(() -> {
            System.out.println("任务2线程： " + Thread.currentThread().getId());
            System.out.println("任务2结束");
            return "hello";
        }, executor);

        future01.runAfterBothAsync(future02, () -> System.out.println("任务3开始...") , executor);
    }

    /**
     * CompletableFuture-两任务组合-都要完成，才能开启第三个任务
     * runAfterBothAsync() 能接收两个任务的参数，但无返回值
     * @throws ExecutionException
     * @throws InterruptedException
     */
    public static void thenAcceptBothAsync() throws ExecutionException, InterruptedException {
        CompletableFuture<Integer> future01 = CompletableFuture.supplyAsync(() -> {
            System.out.println("任务1线程： " + Thread.currentThread().getId());
            int i = 10 / 2;
            System.out.println("任务1结束");
            return i;
        }, executor);
        CompletableFuture<String> future02 = CompletableFuture.supplyAsync(() -> {
            System.out.println("任务2线程： " + Thread.currentThread().getId());
            System.out.println("任务2结束");
            return "hello";
        }, executor);

        //     void accept(T t);
        future01.thenAcceptBothAsync(future02, (f1, f2) -> System.out.println("任务3开始..." + "\n之前的结果是：" + f1 + " --> " + f2) , executor);
    }


    /**
     * CompletableFuture-两任务组合-都要完成，才能开启第三个任务
     * runAfterBothAsync() 能接收两个任务的参数，且有返回值
     * @throws ExecutionException
     * @throws InterruptedException
     */
    public static void thenCombineAsync() throws ExecutionException, InterruptedException {
        CompletableFuture<Integer> future01 = CompletableFuture.supplyAsync(() -> {
            System.out.println("任务1线程： " + Thread.currentThread().getId());
            int i = 10 / 2;
            System.out.println("任务1结束");
            return i;
        }, executor);
        CompletableFuture<String> future02 = CompletableFuture.supplyAsync(() -> {
            System.out.println("任务2线程： " + Thread.currentThread().getId());
            System.out.println("任务2结束");
            return "hello";
        }, executor);

        //         R apply(T t);
        CompletableFuture<String> future03 = future01.thenCombineAsync(future02, (f1, f2) -> f1 + " : " + f2, executor);

        System.out.println("future03的返回值为--> " + future03.get());
    }

    /**
     * CompletableFuture-两任务组合-任意一个完成，就能开启第三个任务
     * runAfterEitherAsync() 不能接收两个任务的参数，且无返回值
     * @throws ExecutionException
     * @throws InterruptedException
     */
    public static void runAfterEitherAsync() throws ExecutionException, InterruptedException {
        CompletableFuture<Integer> future01 = CompletableFuture.supplyAsync(() -> {
            System.out.println("任务1线程： " + Thread.currentThread().getId());
            int i = 10 / 2;
            try {
                sleep(1000);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            System.out.println("任务1结束");
            return i;
        }, executor);
        CompletableFuture<String> future02 = CompletableFuture.supplyAsync(() -> {
            System.out.println("任务2线程： " + Thread.currentThread().getId());
            System.out.println("任务2结束");
            return "hello";
        }, executor);

        future01.runAfterEitherAsync(future02, () -> System.out.println("任务3开始...") , executor);
    }

    /**
     * CompletableFuture-两任务组合-任意一个完成，就能开启第三个任务
     * acceptEitherAsync() 能接收两个任务的参数，但无返回值
     * @throws ExecutionException
     * @throws InterruptedException
     */
    public static void acceptEitherAsync() throws ExecutionException, InterruptedException {
        CompletableFuture<Object> future01 = CompletableFuture.supplyAsync(() -> {
            System.out.println("任务1线程： " + Thread.currentThread().getId());
            int i = 10 / 2;
            try {
                sleep(1000);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            System.out.println("任务1结束");
            return i;
        }, executor);
        CompletableFuture<Object> future02 = CompletableFuture.supplyAsync(() -> {
            System.out.println("任务2线程： " + Thread.currentThread().getId());
            System.out.println("任务2结束");
            return "hello";
        }, executor);

        //     void accept(T t);
        future01.acceptEitherAsync(future02, (res) -> System.out.println("任务3开始..." + "\n之前的结果是：" + res ) , executor);
    }

    /**
     * CompletableFuture-两任务组合-任意一个完成，就能开启第三个任务
     * applyToEitherAsync() 能接收两个任务的参数，有返回值
     * @throws ExecutionException
     * @throws InterruptedException
     */
    public static void applyToEitherAsync() throws ExecutionException, InterruptedException {
        CompletableFuture<Object> future01 = CompletableFuture.supplyAsync(() -> {
            System.out.println("任务1线程： " + Thread.currentThread().getId());
            int i = 10 / 2;
            try {
                sleep(1000);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            System.out.println("任务1结束");
            return i;
        }, executor);
        CompletableFuture<Object> future02 = CompletableFuture.supplyAsync(() -> {
            System.out.println("任务2线程： " + Thread.currentThread().getId());
            System.out.println("任务2结束");
            return "hello";
        }, executor);

        //         R apply(T t);
        CompletableFuture<String> future03 = future01.applyToEitherAsync(future02, result -> result.toString() + "哈哈", executor);

        System.out.println("future03的返回值为--> " + future03.get());
    }



    /**
     * 线程串行化 thenRun: 不能获取到上一步的执行结果，无返回值
     * @throws ExecutionException
     * @throws InterruptedException
     */
    public static void thenRunAsync() throws ExecutionException, InterruptedException {
        CompletableFuture.supplyAsync(() -> {
            System.out.println("当前线程： " + Thread.currentThread().getId());

            int i = 10 / 4;

            System.out.println("运行结果: " + i);
            return i;
        }, executor).thenRunAsync(() -> {
            System.out.println("任务2启动了...");
        }, executor);
    }

    /**
     * 线程串行化 thenAcceptAsync: 能接收上一步结果，但无返回值
     * @throws ExecutionException
     * @throws InterruptedException
     */
    public static void thenAcceptAsync() throws ExecutionException, InterruptedException {
        CompletableFuture.supplyAsync(() -> {
            System.out.println("当前线程： " + Thread.currentThread().getId());

            int i = 10 / 4;

            System.out.println("运行结果: " + i);
            return i;
        }, executor).thenAcceptAsync((result) -> {
            System.out.println("任务2启动了..." + result);
        }, executor);
    }

    /**
     * 线程串行化 thenApplyAsync: 能接收上一步结果，有返回值
     * @throws ExecutionException
     * @throws InterruptedException
     */
    public static CompletableFuture<String> thenApplyAsync() throws ExecutionException, InterruptedException {
        CompletableFuture<String> future = CompletableFuture.supplyAsync(() -> {
            System.out.println("当前线程： " + Thread.currentThread().getId());

            int i = 10 / 4;

            System.out.println("运行结果: " + i);
            return i;
        }, executor).thenApplyAsync((result) -> {
            System.out.println("任务2启动了..." + result);
            return "hello " + result;
        }, executor);
        System.out.println("返回值为： " + future.get());
        return future;
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

    /**
     * CompletableFuture 带返回值
     * @return
     * @throws ExecutionException
     * @throws InterruptedException
     */
    public static CompletableFuture<Long> supplyAsync() throws ExecutionException, InterruptedException {
        CompletableFuture<Long> future = CompletableFuture.supplyAsync(() -> {
            System.out.println("run start...");
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

    /**
     * CompletableFuture handle最终处理
     * @throws ExecutionException
     * @throws InterruptedException
     */
    public static void handle() throws ExecutionException, InterruptedException {
        CompletableFuture<Integer> future = CompletableFuture.supplyAsync(() -> {
            System.out.println("当前线程： " + Thread.currentThread().getId());

            int i = 10 / 0;

            System.out.println("运行结果: " + i);
            return i;
        }, executor).handle((result, throwable) -> {
            if (null != result) {
                return result * 2;
            }
            if (null != throwable){
                System.out.println(throwable.getMessage());
                return 0;
            }
            return -1;
        });
        System.out.println(future.get());
    }

    /**
     * CompletableFuture 带返回值， 完成回调与异常感知
     * @return
     * @throws ExecutionException
     * @throws InterruptedException
     */
    public static CompletableFuture<Integer> whenComplete() throws ExecutionException, InterruptedException {
        CompletableFuture<Integer> future = CompletableFuture.supplyAsync(() -> {
            System.out.println("当前线程： " + Thread.currentThread().getId());

            int i = 10 / 0;

            System.out.println("运行结果: " + i);
            return i;
        }, executor).whenComplete((result, exception) -> {
            System.out.println("异步任务完成。。。");
            // 虽然能得到异常，但无法修改返回数据
            System.out.println("结果是：" + result + "\t异常是：" + exception);
        }).exceptionally(
                // 可以感知异常，同时返回默认值
                throwable -> 10
        );

        System.out.println("runAsync的返回值为： " + future.get());
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
