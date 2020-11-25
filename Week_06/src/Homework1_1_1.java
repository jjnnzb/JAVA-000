package src;

import com.google.common.collect.Lists;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

/**
 * @author Jiang Jining
 * @date 2020/11/25 20:54
 */
public class Homework1_1_1 {
    public static void main(String[] args) {
        Student student1 = Student.builder().age(17).name("Tom").build();
        Student student2 = Student.builder().age(15).name("Jerry").build();
        Student student3 = Student.builder().age(22).name("Andy").build();
        Student student4 = Student.builder().age(19).name("Kate").build();
        Student student5 = Student.builder().age(16).name("Jim").build();
        Student student6 = Student.builder().age(19).name("Jack").build();
        Student student7 = Student.builder().age(21).name("Wilson").build();
        Student student8 = Student.builder().age(21).name("Beata").build();
        ArrayList<Student> studentArrayList = Lists.newArrayList(student1, student2, student3, student4, student5, student6, student7, student8);
        System.out.println("=========学生列表=========");
        print(studentArrayList);
        studentArrayList.sort(Comparator.comparing(Student::getAge));
        System.out.println("=========按年龄升序排列后的学生列表=========");
        print(studentArrayList);
        System.out.println("=========按名字降序排列后的学生列表=========");
        studentArrayList.sort(Comparator.comparing(Student::getName).reversed());
        print(studentArrayList);
        System.out.println("=========未成年的学生数量=========");
        System.out.println(studentArrayList.stream().filter(student -> student.getAge() < 18).count());
        System.out.println("=========已成年的学生列表=========");
        print(studentArrayList.stream().filter(student -> student.getAge() >= 18).collect(Collectors.toList()));
        System.out.println("=========按年龄降序，名字字母表升序的学生信息=========");
        studentArrayList.sort((s1, s2) -> {
            Integer age1 = s1.getAge();
            Integer age2 = s2.getAge();
            String name1 = s1.getName();
            String name2 = s2.getName();
            if (age1 < age2) {
                return 1;
            } else if (age1.equals(age2)) {
                if (name1.compareToIgnoreCase(name2) > 0) {
                    return 1;
                }
                if (name1.equals(name2)) {
                    return 0;
                }
                return -1;
            }
            return -1;
        });
        print(studentArrayList);
    }
    
    private static void print(List<Student> studentList) {
        AtomicInteger atomicInteger = new AtomicInteger();
        if (studentList != null && studentList.size() > 0) {
            studentList.forEach(student -> {
                int index = atomicInteger.addAndGet(1);
                System.out.println("序号:" + index + "," + "信息:" + student);
            });
        }
    }
}
