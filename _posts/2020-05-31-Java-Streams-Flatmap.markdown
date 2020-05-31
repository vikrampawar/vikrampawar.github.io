---
layout: post
title:  "Java Streams flatMap"
date:   2020-05-31 10:03:00 +0000
categories: Java Streams Flatmap
---

The below example shows how we can use `flatMap()` to get the unique combination of two integers for all integers up to n. For n=3, this would be
(1, 1) (1, 2) (1, 3) (2, 2) (2, 3) (3, 3).

To obtain a stream of 3 integers (1, 2, 3) use `IntStream.rangeClosed(1, 3)`

Map works with a stream of types, so convert this to a stream of 3 Integers by using `.boxed()`.

Now starting from 1, we want to make a combination of that number with each  integer following it. 

So for each `i` we can obtain another stream by `IntStream.rangeClosed(i, n)`.

If we use `map()`, as below, we'll end up with a stream of streams. 

```
map(a -> IntStream.rangeClosed(a, 3)
	.mapToObj( b -> new double[]{a, b}))
```

This would be a stream of 3 streams. The first stream will have [1, 1] [1, 2] [1, 3], the second will have [2, 2] and [2, 3]. The third will have [3, 3].


If instead, we use `flatMap()` as below, we'll end up with one stream.

```
flatMap(a -> IntStream.rangeClosed(a, 3)
	.mapToObj( b -> new double[]{a, b}))
```

This would be the stream
[1, 1] [1, 2] [1, 3] [2, 2] [2, 3] [3, 3].


```java
		System.out.println("\n\nStep 1 one primitive integer stream \n------");		
		IntStream.rangeClosed(1, 3)  // one stream
			.forEach(t -> System.out.print(t + " - primitive " +  ", "));
		
		System.out.println("\n\nStep 2 boxed to Integer stream \n------");		
		IntStream.rangeClosed(1, 3).boxed()  // one stream
			.forEach(t -> System.out.print(t + " - " + t.getClass().getTypeName() + ", "));

		System.out.println("\n\nStep 3 Print stream Regular map \n------");		
		IntStream.rangeClosed(1, 3)
			.boxed()
			.map(a -> IntStream.rangeClosed(a, 3)                  // regular map, stream of streams
				.mapToObj( b -> new int[]{a, b}))
			.forEach(t ->  System.out.println(t  +  " - contains " + t.count()));

		System.out.println("\n\nStep 4 Print stream Flat map \n------");		
		IntStream.rangeClosed(1, 3)
			.boxed()
			.flatMap(a -> IntStream.rangeClosed(a, 3)				// flat map, one stream
				.mapToObj( b -> new int[]{a, b}))
			.forEach(t ->  System.out.println(t + " - " + t.getClass().getTypeName() + " Contents: " + t[0] + ", " + t[1]));


```

The output will be 

```
Step 1 one primitive integer stream 
------
1 - primitive , 2 - primitive , 3 - primitive , 

Step 2 boxed to Integer stream 
------
1 - java.lang.Integer, 2 - java.lang.Integer, 3 - java.lang.Integer, 

Step 3 Print stream Regular map 
------
java.util.stream.IntPipeline$1@6aceb1a5 - contains 3
java.util.stream.IntPipeline$1@4c75cab9 - contains 2
java.util.stream.IntPipeline$1@1ef7fe8e - contains 1

Step 4 Print stream Flat map 
------
[I@6979e8cb - int[] Contents: 1, 1
[I@763d9750 - int[] Contents: 1, 2
[I@5c0369c4 - int[] Contents: 1, 3
[I@2be94b0f - int[] Contents: 2, 2
[I@d70c109 - int[] Contents: 2, 3
[I@17ed40e0 - int[] Contents: 3, 3


```