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

From this, obtain all possible triplets using `flatMap()`. (See a demo of the (flatMap)[https://vikrampawar.github.io/java/streams/flatmap/2020/05/31/Java-Streams-Flatmap.html]

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

The example is based on an example from the book (Modern Java Development)[https://www.amazon.co.uk/Modern-Java-Action-functional-programming/dp/1617293563/ref=sr_1_1?dchild=1&keywords=modern+java+development&qid=1590920080&sr=8-1]

