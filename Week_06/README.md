# 学习笔记
笔记见src/Java训练营第六周.xmind

# 作业题
## 周四
1/2.尝试使用 Lambda/Stream/Guava 优化之前作业/工作的代码。
- Lombok和Lambda在平常工作里已经很习惯用了，毕竟匿名内部类整体代码写起来就很臃肿。
常见用到的地方是集合的排序，如ArrayList的sort()方法和集合类的forEach遍历方法，样例代码见src/homework1_1.java。 
- Optional经常会使用，业务代码里面经常需要写分页接口，不传页码数和每页条数默认第1页，每页10条，
分页接参类
```java
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageParam {
    private Long id;
    private Integer pageSize;
    private Integer pageNum;
}
```
接参赋默认值代码：
```text
int pageNum = Optional.ofNullable(pageParam.getPageNum()).orElse(1);
int pageSize = Optional.ofNullable(pageParam.getPageSize()).orElse(10);
```
- Guava在平常工作里使用的还不多，有待进一步研究。代码本地缓存的实现需要读一下源码。

4.（选做）根据课上提供的材料，深入了解 Google 和 Alibaba 编码规范，并根据这些规范，检查自己写代码是否符合规范，有什么可以改进的。
- 阿里巴巴规范有对应的p3c插件，平常就有装，平常写代码过程里就有很注意，主要可以优化的地方大概是变量的命名了，
不考虑充分了，很容易引起歧义，导致前台甚至部分时候自己都会纠结。
- 谷歌规范和唯品会的规范还未看完，后续研究完了，再补充。

## 周六
2.（必做）基于电商交易场景（用户、商品、订单），设计一套简单的表结构，提交 DDL 的 SQL 文件到 Github（后面 2 周的作业依然要是用到这个表结构）。
见src/homework2_2.sql