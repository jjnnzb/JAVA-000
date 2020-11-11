学习笔记
#### 作业1 思考有多少种方式，在 main 函数启动一个新线程，运行一个方法，拿到这个方法的返回值后，退出主线程？
方法一：join()方式。见src.homework1.JoinCalc
方法二：线程池方式1。见src.homework1.ThreadPoolCalc
方法三：线程池方式2，利用invokeAll()。见src.homework1.ThreadPoolCallableInvokeCalc
方法四：Semaphore方式。见src.homework1.SemaphoreCalc
方法五：CyclicBarrier方式。见src.homework1.CyclicBarrierCalc
方法六：CountDownLatch方式。见src.homework1.CountDownLatchCalc
方法七：Future方式。见src.homework1.FutureCalc
方法八：FutureTask方式。见src.homework1.FutureTaskCalc

#### 作业2 把多线程和并发相关知识带你梳理一遍，画一个脑图，截图上传到 Github 上。
见src/homework2/Java多线程与并发.xmind

