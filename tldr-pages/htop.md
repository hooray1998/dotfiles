# 进程控制

## htop

**进程搜索 / 选择**

按键  | 描述
:-    | :-
数字  | 增量搜索进程
\     | 过滤
/     | 搜索
P     | sort by cpu
M     | sort by memory
T     | sort by time
u     | 选择显示的用户
space | 选择当前进程
c     | 选择所有子进程
U     | 撤销选择
t     | 树型显示进程

**进程控制**
按键  | 描述
:-    | :-
e     | 进程的环境变量
l     | 打开的文件 by lsof
s     | 追踪系统调用 **strace**
a     | set cpu affinity
F7    | 减小 nice 值
F8    | 增加 nice 值
p     | toggle program path
k     | kill 进程

## 进程优先级

Name | Desc
:-   | :-
PRI  | 进程优先权 | 值越小优先级越高`PRI=PRI(old)+NI`
NI   | 进程 nice 值 | 进程的修正数值

### Title

Name    | Desc
:-      | :-
PID     | It describes the Process ID number.
USER    | It describes the process owner.
PRI     | It describes the process priority as viewed by the Linux kernel.
N       | It describes the process priority reset by the user or root.
VIR     | It describes the virtual memory that a process is consuming.
RES     | It describes the physical memory that a process is consuming.
SHR     | It describes the shared memory that a process is consuming.
S       | It describes the current state of a process.
CPU%    | It describes the percentage of CPU consumed by each process.
MEM%    | It describes the percentage of Memory consumed by each process.
TIME+   | It displays the time since process execution has started.
Command | It displays the full command execution in parallel to each process.

### CPU Color

Color   | Desc
:-      | :-
Blue    | Display percentage of CPU used by low priority processes. (nice > 0)
Green   | Displays percentage of CPU used for processes owned by normal users.
Red     | Displays percentage of CPU used by system processes.
Orange  | Displays percentage of CPU used by IRQ time.
Magenta | Displays percentage of CPU consumed by Soft IRQ time.
Grey    | Displays percentage of CPU consumed by IO Wait time.
Cyan    | Displays percentage of CPU consumed by Steal time.

### Mem Color

Color  | Desc
:-     | :-
Green  | Displays percentage of RAM consumed by memory pages
Blue   | Displays percentage of RAM consumed by buffer pages
Orange | Displays percentage of RAM consumed by cache pages

### Task status

Name | Desc              | Note
:-   | :-                | :-
R    | Running           | Refers to the processes actively using CPU.
T/S  | Traced/Stopped    | Refers to the processes currently in stopped (paused) state.
Z    | Zombie or defunct | The process that has completed execution (via the exit system call) but still has an entry in the process table.
S    | Sleeping          | Most common state for many processes. Generally, processes are in the sleep state for most of the time and perform small checks at a constant interval of time, or wait for user input before it comes back to running state.

## 进程管理

`watch  -n 10 sh  test.sh  &   每 10s 在后台执行一次 test.sh 脚本`
后台任务与后台运行

1. 一、&
2. 二、ctrl + z
3. 三、jobs
4. 四、fg
5. 五、bg
6. 六、kill
7. 七、nohup
8. ps
9. top

### 后台任务与后台运行

linux 后台运行和关闭、查看后台任务

`fg、bg、jobs、&、nohup、ctrl+z、ctrl+c 命令`

### 一、&

加在一个命令的最后，可以把这个命令放到后台执行，如
`watch  -n 10 sh  test.sh  &  #每 10s 在后台执行一次 test.sh 脚本`

### 二、ctrl + z

可以将一个正在前台执行的命令放到后台，并且处于暂停状态。

### 三、jobs

查看当前有多少在后台运行的命令

`jobs -l`选项可显示所有任务的 PID，jobs 的状态可以是`running, stopped, Terminated`。但是如果任务被终止了（kill），shell 从当前的 shell 环境已知的列表中删除任务的进程标识。

### 四、fg

`将后台中的命令调至前台继续运行`。如果后台中有多个命令，可以用`fg %jobnumber`（是命令编号，不是进程号）将选中的命令调出。

### 五、bg

`将一个在后台暂停的命令变成在后台继续执行`。如果后台中有多个命令，可以用`bg %jobnumber`将选中的命令调出。

### 六、kill

1. 通过 jobs 命令查看 job 号（假设为 num），然后执行 kill %num
2. 通过 ps 命令查看 job 的进程号（PID，假设为 pid），然后执行 kill pid
3. 前台进程的终止：Ctrl+c

### 七、nohup

如果让程序`始终在后台执行，即使关闭当前的终端也执行`（之前的 & 做不到），这时候需要 nohup。
该命令可以在你退出帐户 / 关闭终端之后继续运行相应的进程。关闭终端后，在另一个终端 jobs 已经无法看到后台跑得程序了，此时利用 ps（进程查看命令）

`ps -aux | grep "test.sh"  #a: 显示所有程序 u: 以用户为主的格式来显示 x: 显示所有程序，不以终端机来区分`
