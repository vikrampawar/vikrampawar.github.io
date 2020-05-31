---
layout: post
title:  "Java Streams operate on the whole set"
date:   2020-05-31 16:00:00 +0000
categories: Java Streams
---

Streams can help us do a lot of processing that we would traditionally do using Collections. However, there are some crucial differences between the two.

Collections operate on memory. By the time we use collections, all the elements of the collection are already in memory and are accessible. Streams operate on a set of elements all of which are not yet in memory. Streams can be infinite as well.

Collection operations are imperative. They work on one item at a time. Stream operations work on the whole set. It's a bit amusing that, although the whole collection is in memory, collection operations work on one item at a time, whereas, the Stream operations work on the whole set, although not all of the items are in memory. 

Consider the below java code. It produces the Pythogorean triplets in a given range of integers. These are numbers that satisfy the equation `a*a + b*b = c*c`. 

```java
IntStream.rangeClosed(1, 10)
	.boxed() 
	.flatMap(a -> IntStream.rangeClosed(a, 15) 
			.mapToObj( b -> new double[]{a, b, Math.sqrt(a*a + b*b)}))  
	.filter(t -> t[2] % 1 == 0)
	.forEach(t ->  System.out.println(t[0] + ", " + t[1] + ", " + t[2]));

```

First, obtain a stream of the range of integers using `IntStream.rangeClosed(1, 10)`. 

From this, obtain a stream of Integers using `boxed()`.

From this, obtain all possible triplets using `flatMap()`. (See a demo of the [flatMap](https://vikrampawar.github.io/java/streams/flatmap/2020/05/31/Java-Streams-Flatmap.html)

Then, filter only those that satisfy the equation.

Note that after each operation, we end up with a stream. We don't operate on individual elements, but the whole set. The below program shows the output after each step.

Also, in the complete program below, note the suble difference in the two ways the final filter can be applied. In the first version, the filter is applied after the `flatMap` operation and in the second version, the filter is applied within the `flatMap` operation. The final result is the same in both cases.

The complete program.

```java
import java.util.stream.IntStream;

public class PythogoreanTriplets {

	public static void main(String[] args) {
		
		System.out.println("\n\nStep 1 - Get stream of Integers 1 to 10 \n------");		
		IntStream.rangeClosed(1, 10)
				.boxed()
				.forEach(e -> System.out.print(e + " "));

		System.out.println("\n\nStep 2 - Get possible triplets \n------");		
		IntStream.rangeClosed(1, 10)
				.boxed()
				.flatMap(a -> IntStream.rangeClosed(a, 10)
						.mapToObj( b -> new double[]{a, b, Math.sqrt(a*a + b*b)}))						
						.forEach(t ->  System.out.println(t[0] + ", " + t[1] + ", " + t[2]))
				;
			
		System.out.println("\n\nStep 3a - Filter the right ones, one way \n------");
		IntStream.rangeClosed(1, 10)
				.boxed() 
				.flatMap(a -> IntStream.rangeClosed(a, 15) 
						.mapToObj( b -> new double[]{a, b, Math.sqrt(a*a + b*b)}))  
				.filter(t -> t[2] % 1 == 0)
				.forEach(t ->  System.out.println(t[0] + ", " + t[1] + ", " + t[2]));

		System.out.println("\n\nStep 3b - Filter the right ones, another way \n------");
		IntStream.rangeClosed(1, 10)
				.boxed() 
				.flatMap(a -> IntStream.rangeClosed(a, 15) 
						.mapToObj( b -> new double[]{a, b, Math.sqrt(a*a + b*b)})  
						.filter(t -> t[2] % 1 == 0))
				.forEach(t ->  System.out.println(t[0] + ", " + t[1] + ", " + t[2]));

	}
	
}
```

The output will be 

```


Step 1 - Get stream of Integers 1 to 10 
------
1 2 3 4 5 6 7 8 9 10 

Step 2 - Get possible triplets 
------
1.0, 1.0, 1.4142135623730951
1.0, 2.0, 2.23606797749979
1.0, 3.0, 3.1622776601683795
1.0, 4.0, 4.123105625617661
1.0, 5.0, 5.0990195135927845
1.0, 6.0, 6.082762530298219
1.0, 7.0, 7.0710678118654755
1.0, 8.0, 8.06225774829855
1.0, 9.0, 9.055385138137417
1.0, 10.0, 10.04987562112089
2.0, 2.0, 2.8284271247461903
2.0, 3.0, 3.605551275463989
2.0, 4.0, 4.47213595499958
2.0, 5.0, 5.385164807134504
2.0, 6.0, 6.324555320336759
2.0, 7.0, 7.280109889280518
2.0, 8.0, 8.246211251235321
2.0, 9.0, 9.219544457292887
2.0, 10.0, 10.198039027185569
3.0, 3.0, 4.242640687119285
3.0, 4.0, 5.0
3.0, 5.0, 5.830951894845301
3.0, 6.0, 6.708203932499369
3.0, 7.0, 7.615773105863909
3.0, 8.0, 8.54400374531753
3.0, 9.0, 9.486832980505138
3.0, 10.0, 10.44030650891055
4.0, 4.0, 5.656854249492381
4.0, 5.0, 6.4031242374328485
4.0, 6.0, 7.211102550927978
4.0, 7.0, 8.06225774829855
4.0, 8.0, 8.94427190999916
4.0, 9.0, 9.848857801796104
4.0, 10.0, 10.770329614269007
5.0, 5.0, 7.0710678118654755
5.0, 6.0, 7.810249675906654
5.0, 7.0, 8.602325267042627
5.0, 8.0, 9.433981132056603
5.0, 9.0, 10.295630140987
5.0, 10.0, 11.180339887498949
6.0, 6.0, 8.48528137423857
6.0, 7.0, 9.219544457292887
6.0, 8.0, 10.0
6.0, 9.0, 10.816653826391969
6.0, 10.0, 11.661903789690601
7.0, 7.0, 9.899494936611665
7.0, 8.0, 10.63014581273465
7.0, 9.0, 11.40175425099138
7.0, 10.0, 12.206555615733702
8.0, 8.0, 11.313708498984761
8.0, 9.0, 12.041594578792296
8.0, 10.0, 12.806248474865697
9.0, 9.0, 12.727922061357855
9.0, 10.0, 13.45362404707371
10.0, 10.0, 14.142135623730951


Step 3a - Filter the right ones, one way 
------
3.0, 4.0, 5.0
5.0, 12.0, 13.0
6.0, 8.0, 10.0
8.0, 15.0, 17.0
9.0, 12.0, 15.0


Step 3b - Filter the right ones, another way 
------
3.0, 4.0, 5.0
5.0, 12.0, 13.0
6.0, 8.0, 10.0
8.0, 15.0, 17.0
9.0, 12.0, 15.0


```


The example is based on an example from the book [Modern Java Development](https://www.amazon.co.uk/Modern-Java-Action-functional-programming/dp/1617293563/ref=sr_1_1?dchild=1&keywords=modern+java+development&qid=1590920080&sr=8-1)

