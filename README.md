Run: `docker build --platform linux/arm64 -f .\dockerfile -t test .`

Exceptions are not deterministic. Some examples:

```
=> ERROR [4/4] RUN dotnet publish /source/dotnet-crosscompilation.csproj -o /server                                                             10.5s
------                                                                                                                                                 
 > [4/4] RUN dotnet publish /source/dotnet-crosscompilation.csproj -o /server:                                                                         
8.977 qemu: uncaught target signal 11 (Segmentation fault) - core dumped
10.43 Segmentation fault (core dumped)
------
dockerfile:5
--------------------
   3 |     ADD . /source
   4 |     WORKDIR /source
   5 | >>> RUN dotnet publish /source/dotnet-crosscompilation.csproj -o /server
   6 |     
--------------------
ERROR: failed to build: failed to solve: process "/bin/sh -c dotnet publish /source/dotnet-crosscompilation.csproj -o /server" did not complete successfully: exit code: 139
```

```
=> ERROR [4/4] RUN dotnet publish /source/dotnet-crosscompilation.csproj -o /server                                                             13.6s
------                                                                                                                                                 
 > [4/4] RUN dotnet publish /source/dotnet-crosscompilation.csproj -o /server:                                                                         
9.786   Determining projects to restore...                                                                                                             
11.71 Unhandled exception. System.NullReferenceException: Object reference not set to an instance of an object.                                        
11.71    at System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1.AsyncStateMachineBox`1.MoveNext(Thread threadPoolThread)                          
11.71    at System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1.AsyncStateMachineBox`1.MoveNext()                                                 
11.71    at System.Threading.Tasks.AwaitTaskContinuation.RunOrScheduleAction(IAsyncStateMachineBox box, Boolean allowInlining)
11.71 --- End of stack trace from previous location ---
11.71    at System.Threading.Tasks.Task.<>c.<ThrowAsync>b__124_1(Object state)
11.71    at System.Threading.ThreadPoolWorkQueue.Dispatch()
11.71    at System.Threading.PortableThreadPool.WorkerThread.WorkerThreadStart()
11.71    at System.Threading.Thread.StartCallback()Unhandled exception. System.NullReferenceException: Object reference not set to an instance of an object.
11.71    at System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1.AsyncStateMachineBox`1.MoveNext(Thread threadPoolThread)
11.71    at System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1.AsyncStateMachineBox`1.MoveNext()
11.71    at System.Threading.Tasks.AwaitTaskContinuation.RunOrScheduleAction(IAsyncStateMachineBox box, Boolean allowInlining)
11.71 --- End of stack trace from previous location ---
11.71    at System.Threading.Tasks.Task.<>c.<ThrowAsync>b__124_1(Object state)
11.71    at System.Threading.ThreadPoolWorkQueue.Dispatch()
11.71    at System.Threading.PortableThreadPool.WorkerThread.WorkerThreadStart()
11.71    at System.Threading.Thread.StartCallback()
11.71 
11.71 qemu: uncaught target signal 6 (Aborted) - core dumped
13.53 Aborted (core dumped)
------
dockerfile:5
--------------------
   3 |     ADD . /source
   4 |     WORKDIR /source
   5 | >>> RUN dotnet publish /source/dotnet-crosscompilation.csproj -o /server
   6 |     
--------------------
ERROR: failed to build: failed to solve: process "/bin/sh -c dotnet publish /source/dotnet-crosscompilation.csproj -o /server" did not complete successfully: exit code: 134
```

```
 => ERROR [4/4] RUN dotnet publish /source/dotnet-crosscompilation.csproj -o /server                                                                                                                                                                                                                             10.8s
------                                                                                                                                                                                                                                                                                                                 
 > [4/4] RUN dotnet publish /source/dotnet-crosscompilation.csproj -o /server:                                                                                                                                                                                                                                         
9.606 Unhandled exception. System.NullReferenceException: Object reference not set to an instance of an object.                                                                                                                                                                                                        
9.606    at System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1.AsyncStateMachineBox`1.MoveNext(Thread threadPoolThread)                                                                                                                                                                                          
9.606    at System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1.AsyncStateMachineBox`1.MoveNext()                                                                                                                                                                                                                 
9.606    at System.Threading.Tasks.AwaitTaskContinuation.RunOrScheduleAction(IAsyncStateMachineBox box, Boolean allowInlining)                                                                                                                                                                                         
9.606 --- End of stack trace from previous location ---
9.606    at System.Threading.Tasks.Task.<>c.<ThrowAsync>b__124_1(Object state)
9.606    at System.Threading.ThreadPoolWorkQueue.Dispatch()
9.606    at System.Threading.PortableThreadPool.WorkerThread.WorkerThreadStart()
9.606    at System.Threading.Thread.StartCallback()Unhandled exception. System.NullReferenceException: Object reference not set to an instance of an object.
9.606    at System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1.AsyncStateMachineBox`1.MoveNext(Thread threadPoolThread)
9.606    at System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1.AsyncStateMachineBox`1.MoveNext()
9.606    at System.Threading.Tasks.AwaitTaskContinuation.RunOrScheduleAction(IAsyncStateMachineBox box, Boolean allowInlining)
9.606 --- End of stack trace from previous location ---
9.606    at System.Threading.Tasks.Task.<>c.<ThrowAsync>b__124_1(Object state)
9.606    at System.Threading.ThreadPoolWorkQueue.Dispatch()
9.606    at System.Threading.PortableThreadPool.WorkerThread.WorkerThreadStart()
9.606    at System.Threading.Thread.StartCallback()Unhandled exception. System.NullReferenceException: Object reference not set to an instance of an object.
9.606    at System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1.AsyncStateMachineBox`1.MoveNext(Thread threadPoolThread)
9.606    at System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1.AsyncStateMachineBox`1.MoveNext()
9.606    at System.Threading.Tasks.AwaitTaskContinuation.RunOrScheduleAction(IAsyncStateMachineBox box, Boolean allowInlining)
9.606 --- End of stack trace from previous location ---
9.606    at System.Threading.Tasks.Task.<>c.<ThrowAsync>b__124_1(Object state)
9.606    at System.Threading.ThreadPoolWorkQueue.Dispatch()
9.606    at System.Threading.PortableThreadPool.WorkerThread.WorkerThreadStart()
9.606    at System.Threading.Thread.StartCallback()Unhandled exception. System.NullReferenceException: Object reference not set to an instance of an object.
9.606    at System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1.AsyncStateMachineBox`1.MoveNext(Thread threadPoolThread)
9.606    at System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1.AsyncStateMachineBox`1.MoveNext()
9.606    at System.Threading.Tasks.AwaitTaskContinuation.RunOrScheduleAction(IAsyncStateMachineBox box, Boolean allowInlining)
9.606 --- End of stack trace from previous location ---
9.606    at System.Threading.Tasks.Task.<>c.<ThrowAsync>b__124_1(Object state)
9.606    at System.Threading.ThreadPoolWorkQueue.Dispatch()
9.606    at System.Threading.PortableThreadPool.WorkerThread.WorkerThreadStart()
9.606    at System.Threading.Thread.StartCallback()
9.606 
9.606 
9.607 
9.616 qemu: uncaught target signal 6 (Aborted) - core dumped
10.76 Aborted (core dumped)
------
dockerfile:5
--------------------
   3 |     ADD . /source
   4 |     WORKDIR /source
   5 | >>> RUN dotnet publish /source/dotnet-crosscompilation.csproj -o /server
   6 |     
--------------------
ERROR: failed to build: failed to solve: process "/bin/sh -c dotnet publish /source/dotnet-crosscompilation.csproj -o /server" did not complete successfully: exit code: 134
```