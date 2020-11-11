package src.homework1;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicInteger;

public class CountDownLatchCalc {

    public static AtomicInteger result = new AtomicInteger();

    public static void main(String[] args) throws InterruptedException {
        long start = System.currentTimeMillis();
        CountDownLatch countDownLatch = new CountDownLatch(1);
        new Thread(new readNum(countDownLatch)).start();
        countDownLatch.await();
        System.out.println("异步计算结果为：" + result.get());
        System.out.println("使用时间：" + (System.currentTimeMillis() - start) + " ms");
        System.out.println("Main thread ending...");
    }

    static class readNum implements Runnable {
        private CountDownLatch latch;


        public readNum(CountDownLatch latch) {
            this.latch = latch;
        }

        @Override
        public void run() {
            synchronized (this) {
                result.set(sum());
                latch.countDown();
            }
        }

        private static int sum() {
            return fibo(36);
        }

        private static int fibo(int a) {
            if (a < 2)
                return 1;
            return fibo(a - 1) + fibo(a - 2);
        }
    }


}