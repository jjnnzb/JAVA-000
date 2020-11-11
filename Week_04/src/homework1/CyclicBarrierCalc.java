package src.homework1;

import java.util.concurrent.BrokenBarrierException;
import java.util.concurrent.CyclicBarrier;
import java.util.concurrent.atomic.AtomicInteger;

public class CyclicBarrierCalc {

    public static AtomicInteger result = new AtomicInteger();

    public static void main(String[] args) throws BrokenBarrierException, InterruptedException {
        long start = System.currentTimeMillis();
        CyclicBarrier cyclicBarrier = new CyclicBarrier(1, new Runnable() {
            @Override
            public void run() {
                result.set(sum());
            }
        });
        cyclicBarrier.await();
        System.out.println("异步计算结果为：" + result.get());
        System.out.println("使用时间：" + (System.currentTimeMillis() - start) + " ms");
        System.out.println("Main thread ending...");
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