---
layout: default
title:  'Heap dump a live Java process'
date:   2019-05-11 22:04:00 -0700
permalink: /:categories/:title
---

If you want to get a heap dump of a running Java process, you can use the jmap command included in the JDK. The format is

<pre>jmap -dump:live,file=&lt;filename&gt; &lt;pid&gt;</pre>

For example,

{% highlight shell %}
user@some-server:/srv# ps -ef | grep java
user         1     0 99 21:25 ?        00:03:51 java -XX:+UseG1GC -XX:+UseGCOverheadLimit -XX:+UseStringDeduplication -XX:-OmitStackTraceInFastThrow -Dfile.encoding=UTF-8 -XX:+PrintGC -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/tmp/oom.hprof -jar file.jar

user@some-server:/srv# jmap -dump:live,file=/tmp/cheap.bin 1
Dumping heap to /tmp/cheap.bin ...
Heap dump file created
{% endhighlight %}

Now the heap dump will be available at <code class="inline">/tmp/cheap.bin</code>

From here, you can use a variety of heap dump analyzers. I personally use the Eclipse Memory Analyzer, called mat for memory analyzer tool.

<img class="img" src="assets/posts/2019-05-11-heap-dump/graph.png" alt="Pie chart of an example heap dump"/>
<img class="img" src="assets/posts/2019-05-11-heap-dump/dominator.png" alt="Dominator graph of an example heap dump"/>

In this example, this process was used to determine the cause of a continual OutOfMemory error.
