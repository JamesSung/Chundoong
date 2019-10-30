# Chundoong
Chundoong - Object Relational Mapping Tool (JAVA Project) <br/>

This procject focusd on maximizing performance.
When we create objects that hold data from many different tables(like 50 or more), <br/>
JDBC usually sends many SQLs to DBMS to get all the data, <br/>
because that is the way JDBC works.  <br/>
Due to DBMS call is RFC(Remote Function Call), it is expencive in terms of performance.  <br/>
Chundoong introduced DBMS procesures to handle this problem. <br/>
By using Chudoong, we can get datas from multiful tables by making single call to DBMS. <br/>

You might need to add some open source libraries to build path. <br/>

1. /xstream-1.4.9.jar  <br/>
2. /commons-lang-2.6.jar  <br/>
3. /commons-logging-1.2.jar  <br/>
4. /xmlpull-1.1.3.1.jar  <br/>







