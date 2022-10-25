
bin/kernel：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
void kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

void
kern_init(void){
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 18             	sub    $0x18,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	b8 88 0d 11 00       	mov    $0x110d88,%eax
  10000b:	2d 16 fa 10 00       	sub    $0x10fa16,%eax
  100010:	83 ec 04             	sub    $0x4,%esp
  100013:	50                   	push   %eax
  100014:	6a 00                	push   $0x0
  100016:	68 16 fa 10 00       	push   $0x10fa16
  10001b:	e8 39 33 00 00       	call   103359 <memset>
  100020:	83 c4 10             	add    $0x10,%esp

    cons_init();                // init the console
  100023:	e8 4f 15 00 00       	call   101577 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100028:	c7 45 f4 00 35 10 00 	movl   $0x103500,-0xc(%ebp)
    cprintf("%s\n\n", message);
  10002f:	83 ec 08             	sub    $0x8,%esp
  100032:	ff 75 f4             	push   -0xc(%ebp)
  100035:	68 1c 35 10 00       	push   $0x10351c
  10003a:	e8 cb 02 00 00       	call   10030a <cprintf>
  10003f:	83 c4 10             	add    $0x10,%esp

    print_kerninfo();
  100042:	e8 c1 07 00 00       	call   100808 <print_kerninfo>

    grade_backtrace();
  100047:	e8 79 00 00 00       	call   1000c5 <grade_backtrace>

    pmm_init();                 // init physical memory management
  10004c:	e8 c7 29 00 00       	call   102a18 <pmm_init>

    pic_init();                 // init interrupt controller
  100051:	e8 76 16 00 00       	call   1016cc <pic_init>
    idt_init();                 // init interrupt descriptor table
  100056:	e8 d7 17 00 00       	call   101832 <idt_init>

    clock_init();               // init clock interrupt
  10005b:	e8 d8 0c 00 00       	call   100d38 <clock_init>
    intr_enable();              // enable irq interrupt
  100060:	e8 cf 15 00 00       	call   101634 <intr_enable>

    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    lab1_switch_test();
  100065:	e8 4f 01 00 00       	call   1001b9 <lab1_switch_test>

    /* do nothing */
    while (1);
  10006a:	eb fe                	jmp    10006a <kern_init+0x6a>

0010006c <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  10006c:	55                   	push   %ebp
  10006d:	89 e5                	mov    %esp,%ebp
  10006f:	83 ec 08             	sub    $0x8,%esp
    mon_backtrace(0, NULL, NULL);
  100072:	83 ec 04             	sub    $0x4,%esp
  100075:	6a 00                	push   $0x0
  100077:	6a 00                	push   $0x0
  100079:	6a 00                	push   $0x0
  10007b:	e8 d2 0b 00 00       	call   100c52 <mon_backtrace>
  100080:	83 c4 10             	add    $0x10,%esp
}
  100083:	90                   	nop
  100084:	c9                   	leave  
  100085:	c3                   	ret    

00100086 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100086:	55                   	push   %ebp
  100087:	89 e5                	mov    %esp,%ebp
  100089:	53                   	push   %ebx
  10008a:	83 ec 04             	sub    $0x4,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  10008d:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  100090:	8b 55 0c             	mov    0xc(%ebp),%edx
  100093:	8d 5d 08             	lea    0x8(%ebp),%ebx
  100096:	8b 45 08             	mov    0x8(%ebp),%eax
  100099:	51                   	push   %ecx
  10009a:	52                   	push   %edx
  10009b:	53                   	push   %ebx
  10009c:	50                   	push   %eax
  10009d:	e8 ca ff ff ff       	call   10006c <grade_backtrace2>
  1000a2:	83 c4 10             	add    $0x10,%esp
}
  1000a5:	90                   	nop
  1000a6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000a9:	c9                   	leave  
  1000aa:	c3                   	ret    

001000ab <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000ab:	55                   	push   %ebp
  1000ac:	89 e5                	mov    %esp,%ebp
  1000ae:	83 ec 08             	sub    $0x8,%esp
    grade_backtrace1(arg0, arg2);
  1000b1:	83 ec 08             	sub    $0x8,%esp
  1000b4:	ff 75 10             	push   0x10(%ebp)
  1000b7:	ff 75 08             	push   0x8(%ebp)
  1000ba:	e8 c7 ff ff ff       	call   100086 <grade_backtrace1>
  1000bf:	83 c4 10             	add    $0x10,%esp
}
  1000c2:	90                   	nop
  1000c3:	c9                   	leave  
  1000c4:	c3                   	ret    

001000c5 <grade_backtrace>:

void
grade_backtrace(void) {
  1000c5:	55                   	push   %ebp
  1000c6:	89 e5                	mov    %esp,%ebp
  1000c8:	83 ec 08             	sub    $0x8,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000cb:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000d0:	83 ec 04             	sub    $0x4,%esp
  1000d3:	68 00 00 ff ff       	push   $0xffff0000
  1000d8:	50                   	push   %eax
  1000d9:	6a 00                	push   $0x0
  1000db:	e8 cb ff ff ff       	call   1000ab <grade_backtrace0>
  1000e0:	83 c4 10             	add    $0x10,%esp
}
  1000e3:	90                   	nop
  1000e4:	c9                   	leave  
  1000e5:	c3                   	ret    

001000e6 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  1000e6:	55                   	push   %ebp
  1000e7:	89 e5                	mov    %esp,%ebp
  1000e9:	83 ec 18             	sub    $0x18,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  1000ec:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  1000ef:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  1000f2:	8c 45 f2             	mov    %es,-0xe(%ebp)
  1000f5:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  1000f8:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  1000fc:	0f b7 c0             	movzwl %ax,%eax
  1000ff:	83 e0 03             	and    $0x3,%eax
  100102:	89 c2                	mov    %eax,%edx
  100104:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100109:	83 ec 04             	sub    $0x4,%esp
  10010c:	52                   	push   %edx
  10010d:	50                   	push   %eax
  10010e:	68 21 35 10 00       	push   $0x103521
  100113:	e8 f2 01 00 00       	call   10030a <cprintf>
  100118:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  cs = %x\n", round, reg1);
  10011b:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10011f:	0f b7 d0             	movzwl %ax,%edx
  100122:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100127:	83 ec 04             	sub    $0x4,%esp
  10012a:	52                   	push   %edx
  10012b:	50                   	push   %eax
  10012c:	68 2f 35 10 00       	push   $0x10352f
  100131:	e8 d4 01 00 00       	call   10030a <cprintf>
  100136:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ds = %x\n", round, reg2);
  100139:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10013d:	0f b7 d0             	movzwl %ax,%edx
  100140:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100145:	83 ec 04             	sub    $0x4,%esp
  100148:	52                   	push   %edx
  100149:	50                   	push   %eax
  10014a:	68 3d 35 10 00       	push   $0x10353d
  10014f:	e8 b6 01 00 00       	call   10030a <cprintf>
  100154:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  es = %x\n", round, reg3);
  100157:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10015b:	0f b7 d0             	movzwl %ax,%edx
  10015e:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100163:	83 ec 04             	sub    $0x4,%esp
  100166:	52                   	push   %edx
  100167:	50                   	push   %eax
  100168:	68 4b 35 10 00       	push   $0x10354b
  10016d:	e8 98 01 00 00       	call   10030a <cprintf>
  100172:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ss = %x\n", round, reg4);
  100175:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  100179:	0f b7 d0             	movzwl %ax,%edx
  10017c:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100181:	83 ec 04             	sub    $0x4,%esp
  100184:	52                   	push   %edx
  100185:	50                   	push   %eax
  100186:	68 59 35 10 00       	push   $0x103559
  10018b:	e8 7a 01 00 00       	call   10030a <cprintf>
  100190:	83 c4 10             	add    $0x10,%esp
    round ++;
  100193:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100198:	83 c0 01             	add    $0x1,%eax
  10019b:	a3 20 fa 10 00       	mov    %eax,0x10fa20
}
  1001a0:	90                   	nop
  1001a1:	c9                   	leave  
  1001a2:	c3                   	ret    

001001a3 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001a3:	55                   	push   %ebp
  1001a4:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
    asm volatile (         //禁止优化
  1001a6:	16                   	push   %ss
  1001a7:	54                   	push   %esp
  1001a8:	cd 78                	int    $0x78
  1001aa:	89 ec                	mov    %ebp,%esp
    	"int %0 \n"        //int指令 去IDT获取第n个中断描述符
    	"movl %%ebp, %%esp"//栈顶赋值给栈底  (置esp于刚运行的状态)
    	:                  //输出操作数 
    	: "i"(T_SWITCH_TOU) //输入操作数
    );
}
  1001ac:	90                   	nop
  1001ad:	5d                   	pop    %ebp
  1001ae:	c3                   	ret    

001001af <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001af:	55                   	push   %ebp
  1001b0:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
    asm volatile (
  1001b2:	cd 79                	int    $0x79
  1001b4:	89 ec                	mov    %ebp,%esp
    	"int %0 \n"  // 在内核栈调用中断处理并返回内核态 无需预留空间给ss esp
    	"movl %%ebp, %%esp \n"
    	:
    	: "i"(T_SWITCH_TOK) // 必须得是DPL = 3
    );
}
  1001b6:	90                   	nop
  1001b7:	5d                   	pop    %ebp
  1001b8:	c3                   	ret    

001001b9 <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001b9:	55                   	push   %ebp
  1001ba:	89 e5                	mov    %esp,%ebp
  1001bc:	83 ec 08             	sub    $0x8,%esp
    lab1_print_cur_status();
  1001bf:	e8 22 ff ff ff       	call   1000e6 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001c4:	83 ec 0c             	sub    $0xc,%esp
  1001c7:	68 68 35 10 00       	push   $0x103568
  1001cc:	e8 39 01 00 00       	call   10030a <cprintf>
  1001d1:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_user();
  1001d4:	e8 ca ff ff ff       	call   1001a3 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001d9:	e8 08 ff ff ff       	call   1000e6 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001de:	83 ec 0c             	sub    $0xc,%esp
  1001e1:	68 88 35 10 00       	push   $0x103588
  1001e6:	e8 1f 01 00 00       	call   10030a <cprintf>
  1001eb:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_kernel();
  1001ee:	e8 bc ff ff ff       	call   1001af <lab1_switch_to_kernel>
    lab1_print_cur_status();
  1001f3:	e8 ee fe ff ff       	call   1000e6 <lab1_print_cur_status>
}
  1001f8:	90                   	nop
  1001f9:	c9                   	leave  
  1001fa:	c3                   	ret    

001001fb <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  1001fb:	55                   	push   %ebp
  1001fc:	89 e5                	mov    %esp,%ebp
  1001fe:	83 ec 18             	sub    $0x18,%esp
    if (prompt != NULL) {
  100201:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100205:	74 13                	je     10021a <readline+0x1f>
        cprintf("%s", prompt);
  100207:	83 ec 08             	sub    $0x8,%esp
  10020a:	ff 75 08             	push   0x8(%ebp)
  10020d:	68 a7 35 10 00       	push   $0x1035a7
  100212:	e8 f3 00 00 00       	call   10030a <cprintf>
  100217:	83 c4 10             	add    $0x10,%esp
    }
    int i = 0, c;
  10021a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100221:	e8 6f 01 00 00       	call   100395 <getchar>
  100226:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100229:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10022d:	79 0a                	jns    100239 <readline+0x3e>
            return NULL;
  10022f:	b8 00 00 00 00       	mov    $0x0,%eax
  100234:	e9 82 00 00 00       	jmp    1002bb <readline+0xc0>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100239:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  10023d:	7e 2b                	jle    10026a <readline+0x6f>
  10023f:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100246:	7f 22                	jg     10026a <readline+0x6f>
            cputchar(c);
  100248:	83 ec 0c             	sub    $0xc,%esp
  10024b:	ff 75 f0             	push   -0x10(%ebp)
  10024e:	e8 dd 00 00 00       	call   100330 <cputchar>
  100253:	83 c4 10             	add    $0x10,%esp
            buf[i ++] = c;
  100256:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100259:	8d 50 01             	lea    0x1(%eax),%edx
  10025c:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10025f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100262:	88 90 40 fa 10 00    	mov    %dl,0x10fa40(%eax)
  100268:	eb 4c                	jmp    1002b6 <readline+0xbb>
        }
        else if (c == '\b' && i > 0) {
  10026a:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  10026e:	75 1a                	jne    10028a <readline+0x8f>
  100270:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100274:	7e 14                	jle    10028a <readline+0x8f>
            cputchar(c);
  100276:	83 ec 0c             	sub    $0xc,%esp
  100279:	ff 75 f0             	push   -0x10(%ebp)
  10027c:	e8 af 00 00 00       	call   100330 <cputchar>
  100281:	83 c4 10             	add    $0x10,%esp
            i --;
  100284:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  100288:	eb 2c                	jmp    1002b6 <readline+0xbb>
        }
        else if (c == '\n' || c == '\r') {
  10028a:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  10028e:	74 06                	je     100296 <readline+0x9b>
  100290:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  100294:	75 8b                	jne    100221 <readline+0x26>
            cputchar(c);
  100296:	83 ec 0c             	sub    $0xc,%esp
  100299:	ff 75 f0             	push   -0x10(%ebp)
  10029c:	e8 8f 00 00 00       	call   100330 <cputchar>
  1002a1:	83 c4 10             	add    $0x10,%esp
            buf[i] = '\0';
  1002a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1002a7:	05 40 fa 10 00       	add    $0x10fa40,%eax
  1002ac:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1002af:	b8 40 fa 10 00       	mov    $0x10fa40,%eax
  1002b4:	eb 05                	jmp    1002bb <readline+0xc0>
        c = getchar();
  1002b6:	e9 66 ff ff ff       	jmp    100221 <readline+0x26>
        }
    }
}
  1002bb:	c9                   	leave  
  1002bc:	c3                   	ret    

001002bd <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1002bd:	55                   	push   %ebp
  1002be:	89 e5                	mov    %esp,%ebp
  1002c0:	83 ec 08             	sub    $0x8,%esp
    cons_putc(c);
  1002c3:	83 ec 0c             	sub    $0xc,%esp
  1002c6:	ff 75 08             	push   0x8(%ebp)
  1002c9:	e8 da 12 00 00       	call   1015a8 <cons_putc>
  1002ce:	83 c4 10             	add    $0x10,%esp
    (*cnt) ++;
  1002d1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002d4:	8b 00                	mov    (%eax),%eax
  1002d6:	8d 50 01             	lea    0x1(%eax),%edx
  1002d9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002dc:	89 10                	mov    %edx,(%eax)
}
  1002de:	90                   	nop
  1002df:	c9                   	leave  
  1002e0:	c3                   	ret    

001002e1 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  1002e1:	55                   	push   %ebp
  1002e2:	89 e5                	mov    %esp,%ebp
  1002e4:	83 ec 18             	sub    $0x18,%esp
    int cnt = 0;
  1002e7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  1002ee:	ff 75 0c             	push   0xc(%ebp)
  1002f1:	ff 75 08             	push   0x8(%ebp)
  1002f4:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1002f7:	50                   	push   %eax
  1002f8:	68 bd 02 10 00       	push   $0x1002bd
  1002fd:	e8 c7 28 00 00       	call   102bc9 <vprintfmt>
  100302:	83 c4 10             	add    $0x10,%esp
    return cnt;
  100305:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100308:	c9                   	leave  
  100309:	c3                   	ret    

0010030a <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  10030a:	55                   	push   %ebp
  10030b:	89 e5                	mov    %esp,%ebp
  10030d:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100310:	8d 45 0c             	lea    0xc(%ebp),%eax
  100313:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100316:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100319:	83 ec 08             	sub    $0x8,%esp
  10031c:	50                   	push   %eax
  10031d:	ff 75 08             	push   0x8(%ebp)
  100320:	e8 bc ff ff ff       	call   1002e1 <vcprintf>
  100325:	83 c4 10             	add    $0x10,%esp
  100328:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10032b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10032e:	c9                   	leave  
  10032f:	c3                   	ret    

00100330 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100330:	55                   	push   %ebp
  100331:	89 e5                	mov    %esp,%ebp
  100333:	83 ec 08             	sub    $0x8,%esp
    cons_putc(c);
  100336:	83 ec 0c             	sub    $0xc,%esp
  100339:	ff 75 08             	push   0x8(%ebp)
  10033c:	e8 67 12 00 00       	call   1015a8 <cons_putc>
  100341:	83 c4 10             	add    $0x10,%esp
}
  100344:	90                   	nop
  100345:	c9                   	leave  
  100346:	c3                   	ret    

00100347 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  100347:	55                   	push   %ebp
  100348:	89 e5                	mov    %esp,%ebp
  10034a:	83 ec 18             	sub    $0x18,%esp
    int cnt = 0;
  10034d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  100354:	eb 14                	jmp    10036a <cputs+0x23>
        cputch(c, &cnt);
  100356:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  10035a:	83 ec 08             	sub    $0x8,%esp
  10035d:	8d 55 f0             	lea    -0x10(%ebp),%edx
  100360:	52                   	push   %edx
  100361:	50                   	push   %eax
  100362:	e8 56 ff ff ff       	call   1002bd <cputch>
  100367:	83 c4 10             	add    $0x10,%esp
    while ((c = *str ++) != '\0') {
  10036a:	8b 45 08             	mov    0x8(%ebp),%eax
  10036d:	8d 50 01             	lea    0x1(%eax),%edx
  100370:	89 55 08             	mov    %edx,0x8(%ebp)
  100373:	0f b6 00             	movzbl (%eax),%eax
  100376:	88 45 f7             	mov    %al,-0x9(%ebp)
  100379:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  10037d:	75 d7                	jne    100356 <cputs+0xf>
    }
    cputch('\n', &cnt);
  10037f:	83 ec 08             	sub    $0x8,%esp
  100382:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100385:	50                   	push   %eax
  100386:	6a 0a                	push   $0xa
  100388:	e8 30 ff ff ff       	call   1002bd <cputch>
  10038d:	83 c4 10             	add    $0x10,%esp
    return cnt;
  100390:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  100393:	c9                   	leave  
  100394:	c3                   	ret    

00100395 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  100395:	55                   	push   %ebp
  100396:	89 e5                	mov    %esp,%ebp
  100398:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  10039b:	90                   	nop
  10039c:	e8 37 12 00 00       	call   1015d8 <cons_getc>
  1003a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1003a4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003a8:	74 f2                	je     10039c <getchar+0x7>
        /* do nothing */;
    return c;
  1003aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1003ad:	c9                   	leave  
  1003ae:	c3                   	ret    

001003af <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1003af:	55                   	push   %ebp
  1003b0:	89 e5                	mov    %esp,%ebp
  1003b2:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1003b5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003b8:	8b 00                	mov    (%eax),%eax
  1003ba:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1003bd:	8b 45 10             	mov    0x10(%ebp),%eax
  1003c0:	8b 00                	mov    (%eax),%eax
  1003c2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1003c5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1003cc:	e9 d2 00 00 00       	jmp    1004a3 <stab_binsearch+0xf4>
        int true_m = (l + r) / 2, m = true_m;
  1003d1:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1003d4:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1003d7:	01 d0                	add    %edx,%eax
  1003d9:	89 c2                	mov    %eax,%edx
  1003db:	c1 ea 1f             	shr    $0x1f,%edx
  1003de:	01 d0                	add    %edx,%eax
  1003e0:	d1 f8                	sar    %eax
  1003e2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1003e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1003e8:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1003eb:	eb 04                	jmp    1003f1 <stab_binsearch+0x42>
            m --;
  1003ed:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  1003f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003f4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1003f7:	7c 1f                	jl     100418 <stab_binsearch+0x69>
  1003f9:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1003fc:	89 d0                	mov    %edx,%eax
  1003fe:	01 c0                	add    %eax,%eax
  100400:	01 d0                	add    %edx,%eax
  100402:	c1 e0 02             	shl    $0x2,%eax
  100405:	89 c2                	mov    %eax,%edx
  100407:	8b 45 08             	mov    0x8(%ebp),%eax
  10040a:	01 d0                	add    %edx,%eax
  10040c:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100410:	0f b6 c0             	movzbl %al,%eax
  100413:	39 45 14             	cmp    %eax,0x14(%ebp)
  100416:	75 d5                	jne    1003ed <stab_binsearch+0x3e>
        }
        if (m < l) {    // no match in [l, m]
  100418:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10041b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10041e:	7d 0b                	jge    10042b <stab_binsearch+0x7c>
            l = true_m + 1;
  100420:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100423:	83 c0 01             	add    $0x1,%eax
  100426:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100429:	eb 78                	jmp    1004a3 <stab_binsearch+0xf4>
        }

        // actual binary search
        any_matches = 1;
  10042b:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100432:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100435:	89 d0                	mov    %edx,%eax
  100437:	01 c0                	add    %eax,%eax
  100439:	01 d0                	add    %edx,%eax
  10043b:	c1 e0 02             	shl    $0x2,%eax
  10043e:	89 c2                	mov    %eax,%edx
  100440:	8b 45 08             	mov    0x8(%ebp),%eax
  100443:	01 d0                	add    %edx,%eax
  100445:	8b 40 08             	mov    0x8(%eax),%eax
  100448:	39 45 18             	cmp    %eax,0x18(%ebp)
  10044b:	76 13                	jbe    100460 <stab_binsearch+0xb1>
            *region_left = m;
  10044d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100450:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100453:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100455:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100458:	83 c0 01             	add    $0x1,%eax
  10045b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10045e:	eb 43                	jmp    1004a3 <stab_binsearch+0xf4>
        } else if (stabs[m].n_value > addr) {
  100460:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100463:	89 d0                	mov    %edx,%eax
  100465:	01 c0                	add    %eax,%eax
  100467:	01 d0                	add    %edx,%eax
  100469:	c1 e0 02             	shl    $0x2,%eax
  10046c:	89 c2                	mov    %eax,%edx
  10046e:	8b 45 08             	mov    0x8(%ebp),%eax
  100471:	01 d0                	add    %edx,%eax
  100473:	8b 40 08             	mov    0x8(%eax),%eax
  100476:	39 45 18             	cmp    %eax,0x18(%ebp)
  100479:	73 16                	jae    100491 <stab_binsearch+0xe2>
            *region_right = m - 1;
  10047b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10047e:	8d 50 ff             	lea    -0x1(%eax),%edx
  100481:	8b 45 10             	mov    0x10(%ebp),%eax
  100484:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  100486:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100489:	83 e8 01             	sub    $0x1,%eax
  10048c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10048f:	eb 12                	jmp    1004a3 <stab_binsearch+0xf4>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  100491:	8b 45 0c             	mov    0xc(%ebp),%eax
  100494:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100497:	89 10                	mov    %edx,(%eax)
            l = m;
  100499:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10049c:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  10049f:	83 45 18 01          	addl   $0x1,0x18(%ebp)
    while (l <= r) {
  1004a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1004a6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1004a9:	0f 8e 22 ff ff ff    	jle    1003d1 <stab_binsearch+0x22>
        }
    }

    if (!any_matches) {
  1004af:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1004b3:	75 0f                	jne    1004c4 <stab_binsearch+0x115>
        *region_right = *region_left - 1;
  1004b5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004b8:	8b 00                	mov    (%eax),%eax
  1004ba:	8d 50 ff             	lea    -0x1(%eax),%edx
  1004bd:	8b 45 10             	mov    0x10(%ebp),%eax
  1004c0:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  1004c2:	eb 3f                	jmp    100503 <stab_binsearch+0x154>
        l = *region_right;
  1004c4:	8b 45 10             	mov    0x10(%ebp),%eax
  1004c7:	8b 00                	mov    (%eax),%eax
  1004c9:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1004cc:	eb 04                	jmp    1004d2 <stab_binsearch+0x123>
  1004ce:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  1004d2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004d5:	8b 00                	mov    (%eax),%eax
  1004d7:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1004da:	7e 1f                	jle    1004fb <stab_binsearch+0x14c>
  1004dc:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004df:	89 d0                	mov    %edx,%eax
  1004e1:	01 c0                	add    %eax,%eax
  1004e3:	01 d0                	add    %edx,%eax
  1004e5:	c1 e0 02             	shl    $0x2,%eax
  1004e8:	89 c2                	mov    %eax,%edx
  1004ea:	8b 45 08             	mov    0x8(%ebp),%eax
  1004ed:	01 d0                	add    %edx,%eax
  1004ef:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004f3:	0f b6 c0             	movzbl %al,%eax
  1004f6:	39 45 14             	cmp    %eax,0x14(%ebp)
  1004f9:	75 d3                	jne    1004ce <stab_binsearch+0x11f>
        *region_left = l;
  1004fb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004fe:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100501:	89 10                	mov    %edx,(%eax)
}
  100503:	90                   	nop
  100504:	c9                   	leave  
  100505:	c3                   	ret    

00100506 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  100506:	55                   	push   %ebp
  100507:	89 e5                	mov    %esp,%ebp
  100509:	83 ec 38             	sub    $0x38,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  10050c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10050f:	c7 00 ac 35 10 00    	movl   $0x1035ac,(%eax)
    info->eip_line = 0;
  100515:	8b 45 0c             	mov    0xc(%ebp),%eax
  100518:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  10051f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100522:	c7 40 08 ac 35 10 00 	movl   $0x1035ac,0x8(%eax)
    info->eip_fn_namelen = 9;
  100529:	8b 45 0c             	mov    0xc(%ebp),%eax
  10052c:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  100533:	8b 45 0c             	mov    0xc(%ebp),%eax
  100536:	8b 55 08             	mov    0x8(%ebp),%edx
  100539:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  10053c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10053f:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100546:	c7 45 f4 2c 3e 10 00 	movl   $0x103e2c,-0xc(%ebp)
    stab_end = __STAB_END__;
  10054d:	c7 45 f0 8c bc 10 00 	movl   $0x10bc8c,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100554:	c7 45 ec 8d bc 10 00 	movl   $0x10bc8d,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  10055b:	c7 45 e8 03 e6 10 00 	movl   $0x10e603,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100562:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100565:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100568:	76 0d                	jbe    100577 <debuginfo_eip+0x71>
  10056a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10056d:	83 e8 01             	sub    $0x1,%eax
  100570:	0f b6 00             	movzbl (%eax),%eax
  100573:	84 c0                	test   %al,%al
  100575:	74 0a                	je     100581 <debuginfo_eip+0x7b>
        return -1;
  100577:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10057c:	e9 85 02 00 00       	jmp    100806 <debuginfo_eip+0x300>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100581:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100588:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10058b:	2b 45 f4             	sub    -0xc(%ebp),%eax
  10058e:	c1 f8 02             	sar    $0x2,%eax
  100591:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  100597:	83 e8 01             	sub    $0x1,%eax
  10059a:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  10059d:	ff 75 08             	push   0x8(%ebp)
  1005a0:	6a 64                	push   $0x64
  1005a2:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1005a5:	50                   	push   %eax
  1005a6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1005a9:	50                   	push   %eax
  1005aa:	ff 75 f4             	push   -0xc(%ebp)
  1005ad:	e8 fd fd ff ff       	call   1003af <stab_binsearch>
  1005b2:	83 c4 14             	add    $0x14,%esp
    if (lfile == 0)
  1005b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005b8:	85 c0                	test   %eax,%eax
  1005ba:	75 0a                	jne    1005c6 <debuginfo_eip+0xc0>
        return -1;
  1005bc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1005c1:	e9 40 02 00 00       	jmp    100806 <debuginfo_eip+0x300>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1005c6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005c9:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1005cc:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1005cf:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1005d2:	ff 75 08             	push   0x8(%ebp)
  1005d5:	6a 24                	push   $0x24
  1005d7:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1005da:	50                   	push   %eax
  1005db:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1005de:	50                   	push   %eax
  1005df:	ff 75 f4             	push   -0xc(%ebp)
  1005e2:	e8 c8 fd ff ff       	call   1003af <stab_binsearch>
  1005e7:	83 c4 14             	add    $0x14,%esp

    if (lfun <= rfun) {
  1005ea:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1005ed:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1005f0:	39 c2                	cmp    %eax,%edx
  1005f2:	7f 78                	jg     10066c <debuginfo_eip+0x166>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  1005f4:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1005f7:	89 c2                	mov    %eax,%edx
  1005f9:	89 d0                	mov    %edx,%eax
  1005fb:	01 c0                	add    %eax,%eax
  1005fd:	01 d0                	add    %edx,%eax
  1005ff:	c1 e0 02             	shl    $0x2,%eax
  100602:	89 c2                	mov    %eax,%edx
  100604:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100607:	01 d0                	add    %edx,%eax
  100609:	8b 10                	mov    (%eax),%edx
  10060b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10060e:	2b 45 ec             	sub    -0x14(%ebp),%eax
  100611:	39 c2                	cmp    %eax,%edx
  100613:	73 22                	jae    100637 <debuginfo_eip+0x131>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  100615:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100618:	89 c2                	mov    %eax,%edx
  10061a:	89 d0                	mov    %edx,%eax
  10061c:	01 c0                	add    %eax,%eax
  10061e:	01 d0                	add    %edx,%eax
  100620:	c1 e0 02             	shl    $0x2,%eax
  100623:	89 c2                	mov    %eax,%edx
  100625:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100628:	01 d0                	add    %edx,%eax
  10062a:	8b 10                	mov    (%eax),%edx
  10062c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10062f:	01 c2                	add    %eax,%edx
  100631:	8b 45 0c             	mov    0xc(%ebp),%eax
  100634:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100637:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10063a:	89 c2                	mov    %eax,%edx
  10063c:	89 d0                	mov    %edx,%eax
  10063e:	01 c0                	add    %eax,%eax
  100640:	01 d0                	add    %edx,%eax
  100642:	c1 e0 02             	shl    $0x2,%eax
  100645:	89 c2                	mov    %eax,%edx
  100647:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10064a:	01 d0                	add    %edx,%eax
  10064c:	8b 50 08             	mov    0x8(%eax),%edx
  10064f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100652:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100655:	8b 45 0c             	mov    0xc(%ebp),%eax
  100658:	8b 40 10             	mov    0x10(%eax),%eax
  10065b:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  10065e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100661:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  100664:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100667:	89 45 d0             	mov    %eax,-0x30(%ebp)
  10066a:	eb 15                	jmp    100681 <debuginfo_eip+0x17b>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  10066c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10066f:	8b 55 08             	mov    0x8(%ebp),%edx
  100672:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  100675:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100678:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  10067b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10067e:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  100681:	8b 45 0c             	mov    0xc(%ebp),%eax
  100684:	8b 40 08             	mov    0x8(%eax),%eax
  100687:	83 ec 08             	sub    $0x8,%esp
  10068a:	6a 3a                	push   $0x3a
  10068c:	50                   	push   %eax
  10068d:	e8 3b 2b 00 00       	call   1031cd <strfind>
  100692:	83 c4 10             	add    $0x10,%esp
  100695:	8b 55 0c             	mov    0xc(%ebp),%edx
  100698:	8b 4a 08             	mov    0x8(%edx),%ecx
  10069b:	29 c8                	sub    %ecx,%eax
  10069d:	89 c2                	mov    %eax,%edx
  10069f:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006a2:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1006a5:	83 ec 0c             	sub    $0xc,%esp
  1006a8:	ff 75 08             	push   0x8(%ebp)
  1006ab:	6a 44                	push   $0x44
  1006ad:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1006b0:	50                   	push   %eax
  1006b1:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1006b4:	50                   	push   %eax
  1006b5:	ff 75 f4             	push   -0xc(%ebp)
  1006b8:	e8 f2 fc ff ff       	call   1003af <stab_binsearch>
  1006bd:	83 c4 20             	add    $0x20,%esp
    if (lline <= rline) {
  1006c0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1006c3:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1006c6:	39 c2                	cmp    %eax,%edx
  1006c8:	7f 24                	jg     1006ee <debuginfo_eip+0x1e8>
        info->eip_line = stabs[rline].n_desc;
  1006ca:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1006cd:	89 c2                	mov    %eax,%edx
  1006cf:	89 d0                	mov    %edx,%eax
  1006d1:	01 c0                	add    %eax,%eax
  1006d3:	01 d0                	add    %edx,%eax
  1006d5:	c1 e0 02             	shl    $0x2,%eax
  1006d8:	89 c2                	mov    %eax,%edx
  1006da:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006dd:	01 d0                	add    %edx,%eax
  1006df:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  1006e3:	0f b7 d0             	movzwl %ax,%edx
  1006e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006e9:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1006ec:	eb 13                	jmp    100701 <debuginfo_eip+0x1fb>
        return -1;
  1006ee:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1006f3:	e9 0e 01 00 00       	jmp    100806 <debuginfo_eip+0x300>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  1006f8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1006fb:	83 e8 01             	sub    $0x1,%eax
  1006fe:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  100701:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100704:	8b 45 e4             	mov    -0x1c(%ebp),%eax
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100707:	39 c2                	cmp    %eax,%edx
  100709:	7c 56                	jl     100761 <debuginfo_eip+0x25b>
           && stabs[lline].n_type != N_SOL
  10070b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10070e:	89 c2                	mov    %eax,%edx
  100710:	89 d0                	mov    %edx,%eax
  100712:	01 c0                	add    %eax,%eax
  100714:	01 d0                	add    %edx,%eax
  100716:	c1 e0 02             	shl    $0x2,%eax
  100719:	89 c2                	mov    %eax,%edx
  10071b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10071e:	01 d0                	add    %edx,%eax
  100720:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100724:	3c 84                	cmp    $0x84,%al
  100726:	74 39                	je     100761 <debuginfo_eip+0x25b>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100728:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10072b:	89 c2                	mov    %eax,%edx
  10072d:	89 d0                	mov    %edx,%eax
  10072f:	01 c0                	add    %eax,%eax
  100731:	01 d0                	add    %edx,%eax
  100733:	c1 e0 02             	shl    $0x2,%eax
  100736:	89 c2                	mov    %eax,%edx
  100738:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10073b:	01 d0                	add    %edx,%eax
  10073d:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100741:	3c 64                	cmp    $0x64,%al
  100743:	75 b3                	jne    1006f8 <debuginfo_eip+0x1f2>
  100745:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100748:	89 c2                	mov    %eax,%edx
  10074a:	89 d0                	mov    %edx,%eax
  10074c:	01 c0                	add    %eax,%eax
  10074e:	01 d0                	add    %edx,%eax
  100750:	c1 e0 02             	shl    $0x2,%eax
  100753:	89 c2                	mov    %eax,%edx
  100755:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100758:	01 d0                	add    %edx,%eax
  10075a:	8b 40 08             	mov    0x8(%eax),%eax
  10075d:	85 c0                	test   %eax,%eax
  10075f:	74 97                	je     1006f8 <debuginfo_eip+0x1f2>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  100761:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100764:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100767:	39 c2                	cmp    %eax,%edx
  100769:	7c 42                	jl     1007ad <debuginfo_eip+0x2a7>
  10076b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10076e:	89 c2                	mov    %eax,%edx
  100770:	89 d0                	mov    %edx,%eax
  100772:	01 c0                	add    %eax,%eax
  100774:	01 d0                	add    %edx,%eax
  100776:	c1 e0 02             	shl    $0x2,%eax
  100779:	89 c2                	mov    %eax,%edx
  10077b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10077e:	01 d0                	add    %edx,%eax
  100780:	8b 10                	mov    (%eax),%edx
  100782:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100785:	2b 45 ec             	sub    -0x14(%ebp),%eax
  100788:	39 c2                	cmp    %eax,%edx
  10078a:	73 21                	jae    1007ad <debuginfo_eip+0x2a7>
        info->eip_file = stabstr + stabs[lline].n_strx;
  10078c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10078f:	89 c2                	mov    %eax,%edx
  100791:	89 d0                	mov    %edx,%eax
  100793:	01 c0                	add    %eax,%eax
  100795:	01 d0                	add    %edx,%eax
  100797:	c1 e0 02             	shl    $0x2,%eax
  10079a:	89 c2                	mov    %eax,%edx
  10079c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10079f:	01 d0                	add    %edx,%eax
  1007a1:	8b 10                	mov    (%eax),%edx
  1007a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007a6:	01 c2                	add    %eax,%edx
  1007a8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007ab:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1007ad:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1007b0:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1007b3:	39 c2                	cmp    %eax,%edx
  1007b5:	7d 4a                	jge    100801 <debuginfo_eip+0x2fb>
        for (lline = lfun + 1;
  1007b7:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1007ba:	83 c0 01             	add    $0x1,%eax
  1007bd:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1007c0:	eb 18                	jmp    1007da <debuginfo_eip+0x2d4>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  1007c2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007c5:	8b 40 14             	mov    0x14(%eax),%eax
  1007c8:	8d 50 01             	lea    0x1(%eax),%edx
  1007cb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007ce:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  1007d1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007d4:	83 c0 01             	add    $0x1,%eax
  1007d7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1007da:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007dd:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1007e0:	39 c2                	cmp    %eax,%edx
  1007e2:	7d 1d                	jge    100801 <debuginfo_eip+0x2fb>
  1007e4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007e7:	89 c2                	mov    %eax,%edx
  1007e9:	89 d0                	mov    %edx,%eax
  1007eb:	01 c0                	add    %eax,%eax
  1007ed:	01 d0                	add    %edx,%eax
  1007ef:	c1 e0 02             	shl    $0x2,%eax
  1007f2:	89 c2                	mov    %eax,%edx
  1007f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007f7:	01 d0                	add    %edx,%eax
  1007f9:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1007fd:	3c a0                	cmp    $0xa0,%al
  1007ff:	74 c1                	je     1007c2 <debuginfo_eip+0x2bc>
        }
    }
    return 0;
  100801:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100806:	c9                   	leave  
  100807:	c3                   	ret    

00100808 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100808:	55                   	push   %ebp
  100809:	89 e5                	mov    %esp,%ebp
  10080b:	83 ec 08             	sub    $0x8,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  10080e:	83 ec 0c             	sub    $0xc,%esp
  100811:	68 b6 35 10 00       	push   $0x1035b6
  100816:	e8 ef fa ff ff       	call   10030a <cprintf>
  10081b:	83 c4 10             	add    $0x10,%esp
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  10081e:	83 ec 08             	sub    $0x8,%esp
  100821:	68 00 00 10 00       	push   $0x100000
  100826:	68 cf 35 10 00       	push   $0x1035cf
  10082b:	e8 da fa ff ff       	call   10030a <cprintf>
  100830:	83 c4 10             	add    $0x10,%esp
    cprintf("  etext  0x%08x (phys)\n", etext);
  100833:	83 ec 08             	sub    $0x8,%esp
  100836:	68 e1 34 10 00       	push   $0x1034e1
  10083b:	68 e7 35 10 00       	push   $0x1035e7
  100840:	e8 c5 fa ff ff       	call   10030a <cprintf>
  100845:	83 c4 10             	add    $0x10,%esp
    cprintf("  edata  0x%08x (phys)\n", edata);
  100848:	83 ec 08             	sub    $0x8,%esp
  10084b:	68 16 fa 10 00       	push   $0x10fa16
  100850:	68 ff 35 10 00       	push   $0x1035ff
  100855:	e8 b0 fa ff ff       	call   10030a <cprintf>
  10085a:	83 c4 10             	add    $0x10,%esp
    cprintf("  end    0x%08x (phys)\n", end);
  10085d:	83 ec 08             	sub    $0x8,%esp
  100860:	68 88 0d 11 00       	push   $0x110d88
  100865:	68 17 36 10 00       	push   $0x103617
  10086a:	e8 9b fa ff ff       	call   10030a <cprintf>
  10086f:	83 c4 10             	add    $0x10,%esp
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100872:	b8 88 0d 11 00       	mov    $0x110d88,%eax
  100877:	2d 00 00 10 00       	sub    $0x100000,%eax
  10087c:	05 ff 03 00 00       	add    $0x3ff,%eax
  100881:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  100887:	85 c0                	test   %eax,%eax
  100889:	0f 48 c2             	cmovs  %edx,%eax
  10088c:	c1 f8 0a             	sar    $0xa,%eax
  10088f:	83 ec 08             	sub    $0x8,%esp
  100892:	50                   	push   %eax
  100893:	68 30 36 10 00       	push   $0x103630
  100898:	e8 6d fa ff ff       	call   10030a <cprintf>
  10089d:	83 c4 10             	add    $0x10,%esp
}
  1008a0:	90                   	nop
  1008a1:	c9                   	leave  
  1008a2:	c3                   	ret    

001008a3 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1008a3:	55                   	push   %ebp
  1008a4:	89 e5                	mov    %esp,%ebp
  1008a6:	81 ec 28 01 00 00    	sub    $0x128,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1008ac:	83 ec 08             	sub    $0x8,%esp
  1008af:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1008b2:	50                   	push   %eax
  1008b3:	ff 75 08             	push   0x8(%ebp)
  1008b6:	e8 4b fc ff ff       	call   100506 <debuginfo_eip>
  1008bb:	83 c4 10             	add    $0x10,%esp
  1008be:	85 c0                	test   %eax,%eax
  1008c0:	74 15                	je     1008d7 <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1008c2:	83 ec 08             	sub    $0x8,%esp
  1008c5:	ff 75 08             	push   0x8(%ebp)
  1008c8:	68 5a 36 10 00       	push   $0x10365a
  1008cd:	e8 38 fa ff ff       	call   10030a <cprintf>
  1008d2:	83 c4 10             	add    $0x10,%esp
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  1008d5:	eb 65                	jmp    10093c <print_debuginfo+0x99>
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1008d7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1008de:	eb 1c                	jmp    1008fc <print_debuginfo+0x59>
            fnname[j] = info.eip_fn_name[j];
  1008e0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1008e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008e6:	01 d0                	add    %edx,%eax
  1008e8:	0f b6 00             	movzbl (%eax),%eax
  1008eb:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1008f1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1008f4:	01 ca                	add    %ecx,%edx
  1008f6:	88 02                	mov    %al,(%edx)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1008f8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1008fc:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1008ff:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  100902:	7c dc                	jl     1008e0 <print_debuginfo+0x3d>
        fnname[j] = '\0';
  100904:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  10090a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10090d:	01 d0                	add    %edx,%eax
  10090f:	c6 00 00             	movb   $0x0,(%eax)
                fnname, eip - info.eip_fn_addr);
  100912:	8b 55 ec             	mov    -0x14(%ebp),%edx
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100915:	8b 45 08             	mov    0x8(%ebp),%eax
  100918:	29 d0                	sub    %edx,%eax
  10091a:	89 c1                	mov    %eax,%ecx
  10091c:	8b 55 e0             	mov    -0x20(%ebp),%edx
  10091f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100922:	83 ec 0c             	sub    $0xc,%esp
  100925:	51                   	push   %ecx
  100926:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  10092c:	51                   	push   %ecx
  10092d:	52                   	push   %edx
  10092e:	50                   	push   %eax
  10092f:	68 76 36 10 00       	push   $0x103676
  100934:	e8 d1 f9 ff ff       	call   10030a <cprintf>
  100939:	83 c4 20             	add    $0x20,%esp
}
  10093c:	90                   	nop
  10093d:	c9                   	leave  
  10093e:	c3                   	ret    

0010093f <read_eip>:

static __noinline uint32_t
read_eip(void) {
  10093f:	55                   	push   %ebp
  100940:	89 e5                	mov    %esp,%ebp
  100942:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100945:	8b 45 04             	mov    0x4(%ebp),%eax
  100948:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  10094b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10094e:	c9                   	leave  
  10094f:	c3                   	ret    

00100950 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100950:	55                   	push   %ebp
  100951:	89 e5                	mov    %esp,%ebp
  100953:	53                   	push   %ebx
  100954:	83 ec 24             	sub    $0x24,%esp
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
    uint32_t ebp = 0;
  100957:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    uint32_t eip = 0;
  10095e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100965:	89 e8                	mov    %ebp,%eax
  100967:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    return ebp;
  10096a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    int i;
    ebp = read_ebp();
  10096d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    eip = read_eip();
  100970:	e8 ca ff ff ff       	call   10093f <read_eip>
  100975:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for (i = 0; i < STACKFRAME_DEPTH && ebp != 0; i++) {
  100978:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  10097f:	eb 79                	jmp    1009fa <print_stackframe+0xaa>
	cprintf("ebp:0x%08x  eip:0x%08x  ", ebp, eip);
  100981:	83 ec 04             	sub    $0x4,%esp
  100984:	ff 75 f0             	push   -0x10(%ebp)
  100987:	ff 75 f4             	push   -0xc(%ebp)
  10098a:	68 88 36 10 00       	push   $0x103688
  10098f:	e8 76 f9 ff ff       	call   10030a <cprintf>
  100994:	83 c4 10             	add    $0x10,%esp
	uint32_t* args = (uint32_t*)ebp + 2;    // *(ebp+1)->ret addr  *(ebp+2)-> args[0]
  100997:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10099a:	83 c0 08             	add    $0x8,%eax
  10099d:	89 45 e8             	mov    %eax,-0x18(%ebp)
	cprintf("args:0x%08x 0x%08x 0x%08x 0x%08x\n", *(args + 0), *(args + 1), *(args + 2), *(args + 3));
  1009a0:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009a3:	83 c0 0c             	add    $0xc,%eax
  1009a6:	8b 18                	mov    (%eax),%ebx
  1009a8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009ab:	83 c0 08             	add    $0x8,%eax
  1009ae:	8b 08                	mov    (%eax),%ecx
  1009b0:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009b3:	83 c0 04             	add    $0x4,%eax
  1009b6:	8b 10                	mov    (%eax),%edx
  1009b8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009bb:	8b 00                	mov    (%eax),%eax
  1009bd:	83 ec 0c             	sub    $0xc,%esp
  1009c0:	53                   	push   %ebx
  1009c1:	51                   	push   %ecx
  1009c2:	52                   	push   %edx
  1009c3:	50                   	push   %eax
  1009c4:	68 a4 36 10 00       	push   $0x1036a4
  1009c9:	e8 3c f9 ff ff       	call   10030a <cprintf>
  1009ce:	83 c4 20             	add    $0x20,%esp
	print_debuginfo(eip - 1);
  1009d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009d4:	83 e8 01             	sub    $0x1,%eax
  1009d7:	83 ec 0c             	sub    $0xc,%esp
  1009da:	50                   	push   %eax
  1009db:	e8 c3 fe ff ff       	call   1008a3 <print_debuginfo>
  1009e0:	83 c4 10             	add    $0x10,%esp
	eip = ((uint32_t*)ebp)[1];
  1009e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009e6:	83 c0 04             	add    $0x4,%eax
  1009e9:	8b 00                	mov    (%eax),%eax
  1009eb:	89 45 f0             	mov    %eax,-0x10(%ebp)
	ebp = ((uint32_t*)ebp)[0];
  1009ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009f1:	8b 00                	mov    (%eax),%eax
  1009f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    for (i = 0; i < STACKFRAME_DEPTH && ebp != 0; i++) {
  1009f6:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  1009fa:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  1009fe:	7f 0a                	jg     100a0a <print_stackframe+0xba>
  100a00:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100a04:	0f 85 77 ff ff ff    	jne    100981 <print_stackframe+0x31>
    }
}
  100a0a:	90                   	nop
  100a0b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100a0e:	c9                   	leave  
  100a0f:	c3                   	ret    

00100a10 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100a10:	55                   	push   %ebp
  100a11:	89 e5                	mov    %esp,%ebp
  100a13:	83 ec 18             	sub    $0x18,%esp
    int argc = 0;
  100a16:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a1d:	eb 0c                	jmp    100a2b <parse+0x1b>
            *buf ++ = '\0';
  100a1f:	8b 45 08             	mov    0x8(%ebp),%eax
  100a22:	8d 50 01             	lea    0x1(%eax),%edx
  100a25:	89 55 08             	mov    %edx,0x8(%ebp)
  100a28:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a2b:	8b 45 08             	mov    0x8(%ebp),%eax
  100a2e:	0f b6 00             	movzbl (%eax),%eax
  100a31:	84 c0                	test   %al,%al
  100a33:	74 1e                	je     100a53 <parse+0x43>
  100a35:	8b 45 08             	mov    0x8(%ebp),%eax
  100a38:	0f b6 00             	movzbl (%eax),%eax
  100a3b:	0f be c0             	movsbl %al,%eax
  100a3e:	83 ec 08             	sub    $0x8,%esp
  100a41:	50                   	push   %eax
  100a42:	68 48 37 10 00       	push   $0x103748
  100a47:	e8 4e 27 00 00       	call   10319a <strchr>
  100a4c:	83 c4 10             	add    $0x10,%esp
  100a4f:	85 c0                	test   %eax,%eax
  100a51:	75 cc                	jne    100a1f <parse+0xf>
        }
        if (*buf == '\0') {
  100a53:	8b 45 08             	mov    0x8(%ebp),%eax
  100a56:	0f b6 00             	movzbl (%eax),%eax
  100a59:	84 c0                	test   %al,%al
  100a5b:	74 65                	je     100ac2 <parse+0xb2>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100a5d:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100a61:	75 12                	jne    100a75 <parse+0x65>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100a63:	83 ec 08             	sub    $0x8,%esp
  100a66:	6a 10                	push   $0x10
  100a68:	68 4d 37 10 00       	push   $0x10374d
  100a6d:	e8 98 f8 ff ff       	call   10030a <cprintf>
  100a72:	83 c4 10             	add    $0x10,%esp
        }
        argv[argc ++] = buf;
  100a75:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a78:	8d 50 01             	lea    0x1(%eax),%edx
  100a7b:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100a7e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100a85:	8b 45 0c             	mov    0xc(%ebp),%eax
  100a88:	01 c2                	add    %eax,%edx
  100a8a:	8b 45 08             	mov    0x8(%ebp),%eax
  100a8d:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100a8f:	eb 04                	jmp    100a95 <parse+0x85>
            buf ++;
  100a91:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100a95:	8b 45 08             	mov    0x8(%ebp),%eax
  100a98:	0f b6 00             	movzbl (%eax),%eax
  100a9b:	84 c0                	test   %al,%al
  100a9d:	74 8c                	je     100a2b <parse+0x1b>
  100a9f:	8b 45 08             	mov    0x8(%ebp),%eax
  100aa2:	0f b6 00             	movzbl (%eax),%eax
  100aa5:	0f be c0             	movsbl %al,%eax
  100aa8:	83 ec 08             	sub    $0x8,%esp
  100aab:	50                   	push   %eax
  100aac:	68 48 37 10 00       	push   $0x103748
  100ab1:	e8 e4 26 00 00       	call   10319a <strchr>
  100ab6:	83 c4 10             	add    $0x10,%esp
  100ab9:	85 c0                	test   %eax,%eax
  100abb:	74 d4                	je     100a91 <parse+0x81>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100abd:	e9 69 ff ff ff       	jmp    100a2b <parse+0x1b>
            break;
  100ac2:	90                   	nop
        }
    }
    return argc;
  100ac3:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100ac6:	c9                   	leave  
  100ac7:	c3                   	ret    

00100ac8 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100ac8:	55                   	push   %ebp
  100ac9:	89 e5                	mov    %esp,%ebp
  100acb:	83 ec 58             	sub    $0x58,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100ace:	83 ec 08             	sub    $0x8,%esp
  100ad1:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100ad4:	50                   	push   %eax
  100ad5:	ff 75 08             	push   0x8(%ebp)
  100ad8:	e8 33 ff ff ff       	call   100a10 <parse>
  100add:	83 c4 10             	add    $0x10,%esp
  100ae0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100ae3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100ae7:	75 0a                	jne    100af3 <runcmd+0x2b>
        return 0;
  100ae9:	b8 00 00 00 00       	mov    $0x0,%eax
  100aee:	e9 83 00 00 00       	jmp    100b76 <runcmd+0xae>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100af3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100afa:	eb 59                	jmp    100b55 <runcmd+0x8d>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100afc:	8b 55 b0             	mov    -0x50(%ebp),%edx
  100aff:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  100b02:	89 c8                	mov    %ecx,%eax
  100b04:	01 c0                	add    %eax,%eax
  100b06:	01 c8                	add    %ecx,%eax
  100b08:	c1 e0 02             	shl    $0x2,%eax
  100b0b:	05 00 f0 10 00       	add    $0x10f000,%eax
  100b10:	8b 00                	mov    (%eax),%eax
  100b12:	83 ec 08             	sub    $0x8,%esp
  100b15:	52                   	push   %edx
  100b16:	50                   	push   %eax
  100b17:	e8 df 25 00 00       	call   1030fb <strcmp>
  100b1c:	83 c4 10             	add    $0x10,%esp
  100b1f:	85 c0                	test   %eax,%eax
  100b21:	75 2e                	jne    100b51 <runcmd+0x89>
            return commands[i].func(argc - 1, argv + 1, tf);
  100b23:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b26:	89 d0                	mov    %edx,%eax
  100b28:	01 c0                	add    %eax,%eax
  100b2a:	01 d0                	add    %edx,%eax
  100b2c:	c1 e0 02             	shl    $0x2,%eax
  100b2f:	05 08 f0 10 00       	add    $0x10f008,%eax
  100b34:	8b 10                	mov    (%eax),%edx
  100b36:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b39:	83 c0 04             	add    $0x4,%eax
  100b3c:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100b3f:	83 e9 01             	sub    $0x1,%ecx
  100b42:	83 ec 04             	sub    $0x4,%esp
  100b45:	ff 75 0c             	push   0xc(%ebp)
  100b48:	50                   	push   %eax
  100b49:	51                   	push   %ecx
  100b4a:	ff d2                	call   *%edx
  100b4c:	83 c4 10             	add    $0x10,%esp
  100b4f:	eb 25                	jmp    100b76 <runcmd+0xae>
    for (i = 0; i < NCOMMANDS; i ++) {
  100b51:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100b55:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b58:	83 f8 02             	cmp    $0x2,%eax
  100b5b:	76 9f                	jbe    100afc <runcmd+0x34>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100b5d:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100b60:	83 ec 08             	sub    $0x8,%esp
  100b63:	50                   	push   %eax
  100b64:	68 6b 37 10 00       	push   $0x10376b
  100b69:	e8 9c f7 ff ff       	call   10030a <cprintf>
  100b6e:	83 c4 10             	add    $0x10,%esp
    return 0;
  100b71:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100b76:	c9                   	leave  
  100b77:	c3                   	ret    

00100b78 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100b78:	55                   	push   %ebp
  100b79:	89 e5                	mov    %esp,%ebp
  100b7b:	83 ec 18             	sub    $0x18,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100b7e:	83 ec 0c             	sub    $0xc,%esp
  100b81:	68 84 37 10 00       	push   $0x103784
  100b86:	e8 7f f7 ff ff       	call   10030a <cprintf>
  100b8b:	83 c4 10             	add    $0x10,%esp
    cprintf("Type 'help' for a list of commands.\n");
  100b8e:	83 ec 0c             	sub    $0xc,%esp
  100b91:	68 ac 37 10 00       	push   $0x1037ac
  100b96:	e8 6f f7 ff ff       	call   10030a <cprintf>
  100b9b:	83 c4 10             	add    $0x10,%esp

    if (tf != NULL) {
  100b9e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100ba2:	74 0e                	je     100bb2 <kmonitor+0x3a>
        print_trapframe(tf);
  100ba4:	83 ec 0c             	sub    $0xc,%esp
  100ba7:	ff 75 08             	push   0x8(%ebp)
  100baa:	e8 3d 0e 00 00       	call   1019ec <print_trapframe>
  100baf:	83 c4 10             	add    $0x10,%esp
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100bb2:	83 ec 0c             	sub    $0xc,%esp
  100bb5:	68 d1 37 10 00       	push   $0x1037d1
  100bba:	e8 3c f6 ff ff       	call   1001fb <readline>
  100bbf:	83 c4 10             	add    $0x10,%esp
  100bc2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100bc5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100bc9:	74 e7                	je     100bb2 <kmonitor+0x3a>
            if (runcmd(buf, tf) < 0) {
  100bcb:	83 ec 08             	sub    $0x8,%esp
  100bce:	ff 75 08             	push   0x8(%ebp)
  100bd1:	ff 75 f4             	push   -0xc(%ebp)
  100bd4:	e8 ef fe ff ff       	call   100ac8 <runcmd>
  100bd9:	83 c4 10             	add    $0x10,%esp
  100bdc:	85 c0                	test   %eax,%eax
  100bde:	78 02                	js     100be2 <kmonitor+0x6a>
        if ((buf = readline("K> ")) != NULL) {
  100be0:	eb d0                	jmp    100bb2 <kmonitor+0x3a>
                break;
  100be2:	90                   	nop
            }
        }
    }
}
  100be3:	90                   	nop
  100be4:	c9                   	leave  
  100be5:	c3                   	ret    

00100be6 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100be6:	55                   	push   %ebp
  100be7:	89 e5                	mov    %esp,%ebp
  100be9:	83 ec 18             	sub    $0x18,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100bec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100bf3:	eb 3c                	jmp    100c31 <mon_help+0x4b>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100bf5:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100bf8:	89 d0                	mov    %edx,%eax
  100bfa:	01 c0                	add    %eax,%eax
  100bfc:	01 d0                	add    %edx,%eax
  100bfe:	c1 e0 02             	shl    $0x2,%eax
  100c01:	05 04 f0 10 00       	add    $0x10f004,%eax
  100c06:	8b 10                	mov    (%eax),%edx
  100c08:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  100c0b:	89 c8                	mov    %ecx,%eax
  100c0d:	01 c0                	add    %eax,%eax
  100c0f:	01 c8                	add    %ecx,%eax
  100c11:	c1 e0 02             	shl    $0x2,%eax
  100c14:	05 00 f0 10 00       	add    $0x10f000,%eax
  100c19:	8b 00                	mov    (%eax),%eax
  100c1b:	83 ec 04             	sub    $0x4,%esp
  100c1e:	52                   	push   %edx
  100c1f:	50                   	push   %eax
  100c20:	68 d5 37 10 00       	push   $0x1037d5
  100c25:	e8 e0 f6 ff ff       	call   10030a <cprintf>
  100c2a:	83 c4 10             	add    $0x10,%esp
    for (i = 0; i < NCOMMANDS; i ++) {
  100c2d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100c31:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c34:	83 f8 02             	cmp    $0x2,%eax
  100c37:	76 bc                	jbe    100bf5 <mon_help+0xf>
    }
    return 0;
  100c39:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c3e:	c9                   	leave  
  100c3f:	c3                   	ret    

00100c40 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100c40:	55                   	push   %ebp
  100c41:	89 e5                	mov    %esp,%ebp
  100c43:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100c46:	e8 bd fb ff ff       	call   100808 <print_kerninfo>
    return 0;
  100c4b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c50:	c9                   	leave  
  100c51:	c3                   	ret    

00100c52 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100c52:	55                   	push   %ebp
  100c53:	89 e5                	mov    %esp,%ebp
  100c55:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100c58:	e8 f3 fc ff ff       	call   100950 <print_stackframe>
    return 0;
  100c5d:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c62:	c9                   	leave  
  100c63:	c3                   	ret    

00100c64 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  100c64:	55                   	push   %ebp
  100c65:	89 e5                	mov    %esp,%ebp
  100c67:	83 ec 18             	sub    $0x18,%esp
    if (is_panic) {
  100c6a:	a1 40 fe 10 00       	mov    0x10fe40,%eax
  100c6f:	85 c0                	test   %eax,%eax
  100c71:	75 5f                	jne    100cd2 <__panic+0x6e>
        goto panic_dead;
    }
    is_panic = 1;
  100c73:	c7 05 40 fe 10 00 01 	movl   $0x1,0x10fe40
  100c7a:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  100c7d:	8d 45 14             	lea    0x14(%ebp),%eax
  100c80:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100c83:	83 ec 04             	sub    $0x4,%esp
  100c86:	ff 75 0c             	push   0xc(%ebp)
  100c89:	ff 75 08             	push   0x8(%ebp)
  100c8c:	68 de 37 10 00       	push   $0x1037de
  100c91:	e8 74 f6 ff ff       	call   10030a <cprintf>
  100c96:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  100c99:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c9c:	83 ec 08             	sub    $0x8,%esp
  100c9f:	50                   	push   %eax
  100ca0:	ff 75 10             	push   0x10(%ebp)
  100ca3:	e8 39 f6 ff ff       	call   1002e1 <vcprintf>
  100ca8:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  100cab:	83 ec 0c             	sub    $0xc,%esp
  100cae:	68 fa 37 10 00       	push   $0x1037fa
  100cb3:	e8 52 f6 ff ff       	call   10030a <cprintf>
  100cb8:	83 c4 10             	add    $0x10,%esp
    
    cprintf("stack trackback:\n");
  100cbb:	83 ec 0c             	sub    $0xc,%esp
  100cbe:	68 fc 37 10 00       	push   $0x1037fc
  100cc3:	e8 42 f6 ff ff       	call   10030a <cprintf>
  100cc8:	83 c4 10             	add    $0x10,%esp
    print_stackframe();
  100ccb:	e8 80 fc ff ff       	call   100950 <print_stackframe>
  100cd0:	eb 01                	jmp    100cd3 <__panic+0x6f>
        goto panic_dead;
  100cd2:	90                   	nop
    
    va_end(ap);

panic_dead:
    intr_disable();
  100cd3:	e8 64 09 00 00       	call   10163c <intr_disable>
    while (1) {
        kmonitor(NULL);
  100cd8:	83 ec 0c             	sub    $0xc,%esp
  100cdb:	6a 00                	push   $0x0
  100cdd:	e8 96 fe ff ff       	call   100b78 <kmonitor>
  100ce2:	83 c4 10             	add    $0x10,%esp
  100ce5:	eb f1                	jmp    100cd8 <__panic+0x74>

00100ce7 <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100ce7:	55                   	push   %ebp
  100ce8:	89 e5                	mov    %esp,%ebp
  100cea:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    va_start(ap, fmt);
  100ced:	8d 45 14             	lea    0x14(%ebp),%eax
  100cf0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100cf3:	83 ec 04             	sub    $0x4,%esp
  100cf6:	ff 75 0c             	push   0xc(%ebp)
  100cf9:	ff 75 08             	push   0x8(%ebp)
  100cfc:	68 0e 38 10 00       	push   $0x10380e
  100d01:	e8 04 f6 ff ff       	call   10030a <cprintf>
  100d06:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  100d09:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d0c:	83 ec 08             	sub    $0x8,%esp
  100d0f:	50                   	push   %eax
  100d10:	ff 75 10             	push   0x10(%ebp)
  100d13:	e8 c9 f5 ff ff       	call   1002e1 <vcprintf>
  100d18:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  100d1b:	83 ec 0c             	sub    $0xc,%esp
  100d1e:	68 fa 37 10 00       	push   $0x1037fa
  100d23:	e8 e2 f5 ff ff       	call   10030a <cprintf>
  100d28:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  100d2b:	90                   	nop
  100d2c:	c9                   	leave  
  100d2d:	c3                   	ret    

00100d2e <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100d2e:	55                   	push   %ebp
  100d2f:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100d31:	a1 40 fe 10 00       	mov    0x10fe40,%eax
}
  100d36:	5d                   	pop    %ebp
  100d37:	c3                   	ret    

00100d38 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d38:	55                   	push   %ebp
  100d39:	89 e5                	mov    %esp,%ebp
  100d3b:	83 ec 18             	sub    $0x18,%esp
  100d3e:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  100d44:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d48:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100d4c:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100d50:	ee                   	out    %al,(%dx)
}
  100d51:	90                   	nop
  100d52:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d58:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d5c:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d60:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d64:	ee                   	out    %al,(%dx)
}
  100d65:	90                   	nop
  100d66:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  100d6c:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d70:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100d74:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d78:	ee                   	out    %al,(%dx)
}
  100d79:	90                   	nop
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100d7a:	c7 05 44 fe 10 00 00 	movl   $0x0,0x10fe44
  100d81:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100d84:	83 ec 0c             	sub    $0xc,%esp
  100d87:	68 2c 38 10 00       	push   $0x10382c
  100d8c:	e8 79 f5 ff ff       	call   10030a <cprintf>
  100d91:	83 c4 10             	add    $0x10,%esp
    pic_enable(IRQ_TIMER);
  100d94:	83 ec 0c             	sub    $0xc,%esp
  100d97:	6a 00                	push   $0x0
  100d99:	e8 01 09 00 00       	call   10169f <pic_enable>
  100d9e:	83 c4 10             	add    $0x10,%esp
}
  100da1:	90                   	nop
  100da2:	c9                   	leave  
  100da3:	c3                   	ret    

00100da4 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100da4:	55                   	push   %ebp
  100da5:	89 e5                	mov    %esp,%ebp
  100da7:	83 ec 10             	sub    $0x10,%esp
  100daa:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100db0:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100db4:	89 c2                	mov    %eax,%edx
  100db6:	ec                   	in     (%dx),%al
  100db7:	88 45 f1             	mov    %al,-0xf(%ebp)
  100dba:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100dc0:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100dc4:	89 c2                	mov    %eax,%edx
  100dc6:	ec                   	in     (%dx),%al
  100dc7:	88 45 f5             	mov    %al,-0xb(%ebp)
  100dca:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100dd0:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100dd4:	89 c2                	mov    %eax,%edx
  100dd6:	ec                   	in     (%dx),%al
  100dd7:	88 45 f9             	mov    %al,-0x7(%ebp)
  100dda:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  100de0:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100de4:	89 c2                	mov    %eax,%edx
  100de6:	ec                   	in     (%dx),%al
  100de7:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100dea:	90                   	nop
  100deb:	c9                   	leave  
  100dec:	c3                   	ret    

00100ded <cga_init>:
static uint16_t addr_6845;

/* TEXT-mode CGA/VGA display output */

static void
cga_init(void) {
  100ded:	55                   	push   %ebp
  100dee:	89 e5                	mov    %esp,%ebp
  100df0:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;
  100df3:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;
  100dfa:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100dfd:	0f b7 00             	movzwl (%eax),%eax
  100e00:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;
  100e04:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e07:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {
  100e0c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e0f:	0f b7 00             	movzwl (%eax),%eax
  100e12:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100e16:	74 12                	je     100e2a <cga_init+0x3d>
        cp = (uint16_t*)MONO_BUF;
  100e18:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;
  100e1f:	66 c7 05 66 fe 10 00 	movw   $0x3b4,0x10fe66
  100e26:	b4 03 
  100e28:	eb 13                	jmp    100e3d <cga_init+0x50>
    } else {
        *cp = was;
  100e2a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e2d:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e31:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;
  100e34:	66 c7 05 66 fe 10 00 	movw   $0x3d4,0x10fe66
  100e3b:	d4 03 
    }

    // Extract cursor location
    uint32_t pos;
    outb(addr_6845, 14);
  100e3d:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100e44:	0f b7 c0             	movzwl %ax,%eax
  100e47:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100e4b:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e4f:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100e53:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100e57:	ee                   	out    %al,(%dx)
}
  100e58:	90                   	nop
    pos = inb(addr_6845 + 1) << 8;
  100e59:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100e60:	83 c0 01             	add    $0x1,%eax
  100e63:	0f b7 c0             	movzwl %ax,%eax
  100e66:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e6a:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  100e6e:	89 c2                	mov    %eax,%edx
  100e70:	ec                   	in     (%dx),%al
  100e71:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  100e74:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100e78:	0f b6 c0             	movzbl %al,%eax
  100e7b:	c1 e0 08             	shl    $0x8,%eax
  100e7e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100e81:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100e88:	0f b7 c0             	movzwl %ax,%eax
  100e8b:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100e8f:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e93:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100e97:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100e9b:	ee                   	out    %al,(%dx)
}
  100e9c:	90                   	nop
    pos |= inb(addr_6845 + 1);
  100e9d:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100ea4:	83 c0 01             	add    $0x1,%eax
  100ea7:	0f b7 c0             	movzwl %ax,%eax
  100eaa:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100eae:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100eb2:	89 c2                	mov    %eax,%edx
  100eb4:	ec                   	in     (%dx),%al
  100eb5:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  100eb8:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100ebc:	0f b6 c0             	movzbl %al,%eax
  100ebf:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;
  100ec2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ec5:	a3 60 fe 10 00       	mov    %eax,0x10fe60
    crt_pos = pos;
  100eca:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ecd:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
}
  100ed3:	90                   	nop
  100ed4:	c9                   	leave  
  100ed5:	c3                   	ret    

00100ed6 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100ed6:	55                   	push   %ebp
  100ed7:	89 e5                	mov    %esp,%ebp
  100ed9:	83 ec 38             	sub    $0x38,%esp
  100edc:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  100ee2:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ee6:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  100eea:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  100eee:	ee                   	out    %al,(%dx)
}
  100eef:	90                   	nop
  100ef0:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  100ef6:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100efa:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  100efe:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  100f02:	ee                   	out    %al,(%dx)
}
  100f03:	90                   	nop
  100f04:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  100f0a:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f0e:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  100f12:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100f16:	ee                   	out    %al,(%dx)
}
  100f17:	90                   	nop
  100f18:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f1e:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f22:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f26:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100f2a:	ee                   	out    %al,(%dx)
}
  100f2b:	90                   	nop
  100f2c:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  100f32:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f36:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f3a:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f3e:	ee                   	out    %al,(%dx)
}
  100f3f:	90                   	nop
  100f40:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  100f46:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f4a:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f4e:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100f52:	ee                   	out    %al,(%dx)
}
  100f53:	90                   	nop
  100f54:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f5a:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f5e:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f62:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f66:	ee                   	out    %al,(%dx)
}
  100f67:	90                   	nop
  100f68:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f6e:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100f72:	89 c2                	mov    %eax,%edx
  100f74:	ec                   	in     (%dx),%al
  100f75:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100f78:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f7c:	3c ff                	cmp    $0xff,%al
  100f7e:	0f 95 c0             	setne  %al
  100f81:	0f b6 c0             	movzbl %al,%eax
  100f84:	a3 68 fe 10 00       	mov    %eax,0x10fe68
  100f89:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f8f:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100f93:	89 c2                	mov    %eax,%edx
  100f95:	ec                   	in     (%dx),%al
  100f96:	88 45 f1             	mov    %al,-0xf(%ebp)
  100f99:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  100f9f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100fa3:	89 c2                	mov    %eax,%edx
  100fa5:	ec                   	in     (%dx),%al
  100fa6:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100fa9:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  100fae:	85 c0                	test   %eax,%eax
  100fb0:	74 0d                	je     100fbf <serial_init+0xe9>
        pic_enable(IRQ_COM1);
  100fb2:	83 ec 0c             	sub    $0xc,%esp
  100fb5:	6a 04                	push   $0x4
  100fb7:	e8 e3 06 00 00       	call   10169f <pic_enable>
  100fbc:	83 c4 10             	add    $0x10,%esp
    }
}
  100fbf:	90                   	nop
  100fc0:	c9                   	leave  
  100fc1:	c3                   	ret    

00100fc2 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100fc2:	55                   	push   %ebp
  100fc3:	89 e5                	mov    %esp,%ebp
  100fc5:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fc8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100fcf:	eb 09                	jmp    100fda <lpt_putc_sub+0x18>
        delay();
  100fd1:	e8 ce fd ff ff       	call   100da4 <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fd6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100fda:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  100fe0:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100fe4:	89 c2                	mov    %eax,%edx
  100fe6:	ec                   	in     (%dx),%al
  100fe7:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  100fea:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  100fee:	84 c0                	test   %al,%al
  100ff0:	78 09                	js     100ffb <lpt_putc_sub+0x39>
  100ff2:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  100ff9:	7e d6                	jle    100fd1 <lpt_putc_sub+0xf>
    }
    outb(LPTPORT + 0, c);
  100ffb:	8b 45 08             	mov    0x8(%ebp),%eax
  100ffe:	0f b6 c0             	movzbl %al,%eax
  101001:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  101007:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10100a:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10100e:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101012:	ee                   	out    %al,(%dx)
}
  101013:	90                   	nop
  101014:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  10101a:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10101e:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101022:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101026:	ee                   	out    %al,(%dx)
}
  101027:	90                   	nop
  101028:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  10102e:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101032:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101036:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10103a:	ee                   	out    %al,(%dx)
}
  10103b:	90                   	nop
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  10103c:	90                   	nop
  10103d:	c9                   	leave  
  10103e:	c3                   	ret    

0010103f <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  10103f:	55                   	push   %ebp
  101040:	89 e5                	mov    %esp,%ebp
    if (c != '\b') {
  101042:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101046:	74 0d                	je     101055 <lpt_putc+0x16>
        lpt_putc_sub(c);
  101048:	ff 75 08             	push   0x8(%ebp)
  10104b:	e8 72 ff ff ff       	call   100fc2 <lpt_putc_sub>
  101050:	83 c4 04             	add    $0x4,%esp
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  101053:	eb 1e                	jmp    101073 <lpt_putc+0x34>
        lpt_putc_sub('\b');
  101055:	6a 08                	push   $0x8
  101057:	e8 66 ff ff ff       	call   100fc2 <lpt_putc_sub>
  10105c:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub(' ');
  10105f:	6a 20                	push   $0x20
  101061:	e8 5c ff ff ff       	call   100fc2 <lpt_putc_sub>
  101066:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub('\b');
  101069:	6a 08                	push   $0x8
  10106b:	e8 52 ff ff ff       	call   100fc2 <lpt_putc_sub>
  101070:	83 c4 04             	add    $0x4,%esp
}
  101073:	90                   	nop
  101074:	c9                   	leave  
  101075:	c3                   	ret    

00101076 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  101076:	55                   	push   %ebp
  101077:	89 e5                	mov    %esp,%ebp
  101079:	53                   	push   %ebx
  10107a:	83 ec 24             	sub    $0x24,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  10107d:	8b 45 08             	mov    0x8(%ebp),%eax
  101080:	b0 00                	mov    $0x0,%al
  101082:	85 c0                	test   %eax,%eax
  101084:	75 07                	jne    10108d <cga_putc+0x17>
        c |= 0x0700;
  101086:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  10108d:	8b 45 08             	mov    0x8(%ebp),%eax
  101090:	0f b6 c0             	movzbl %al,%eax
  101093:	83 f8 0d             	cmp    $0xd,%eax
  101096:	74 6b                	je     101103 <cga_putc+0x8d>
  101098:	83 f8 0d             	cmp    $0xd,%eax
  10109b:	0f 8f 9c 00 00 00    	jg     10113d <cga_putc+0xc7>
  1010a1:	83 f8 08             	cmp    $0x8,%eax
  1010a4:	74 0a                	je     1010b0 <cga_putc+0x3a>
  1010a6:	83 f8 0a             	cmp    $0xa,%eax
  1010a9:	74 48                	je     1010f3 <cga_putc+0x7d>
  1010ab:	e9 8d 00 00 00       	jmp    10113d <cga_putc+0xc7>
    case '\b':
        if (crt_pos > 0) {
  1010b0:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1010b7:	66 85 c0             	test   %ax,%ax
  1010ba:	0f 84 a3 00 00 00    	je     101163 <cga_putc+0xed>
            crt_pos --;
  1010c0:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1010c7:	83 e8 01             	sub    $0x1,%eax
  1010ca:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1010d0:	8b 45 08             	mov    0x8(%ebp),%eax
  1010d3:	b0 00                	mov    $0x0,%al
  1010d5:	83 c8 20             	or     $0x20,%eax
  1010d8:	89 c2                	mov    %eax,%edx
  1010da:	8b 0d 60 fe 10 00    	mov    0x10fe60,%ecx
  1010e0:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1010e7:	0f b7 c0             	movzwl %ax,%eax
  1010ea:	01 c0                	add    %eax,%eax
  1010ec:	01 c8                	add    %ecx,%eax
  1010ee:	66 89 10             	mov    %dx,(%eax)
        }
        break;
  1010f1:	eb 70                	jmp    101163 <cga_putc+0xed>
    case '\n':
        crt_pos += CRT_COLS;
  1010f3:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1010fa:	83 c0 50             	add    $0x50,%eax
  1010fd:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  101103:	0f b7 1d 64 fe 10 00 	movzwl 0x10fe64,%ebx
  10110a:	0f b7 0d 64 fe 10 00 	movzwl 0x10fe64,%ecx
  101111:	0f b7 c1             	movzwl %cx,%eax
  101114:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  10111a:	c1 e8 10             	shr    $0x10,%eax
  10111d:	89 c2                	mov    %eax,%edx
  10111f:	66 c1 ea 06          	shr    $0x6,%dx
  101123:	89 d0                	mov    %edx,%eax
  101125:	c1 e0 02             	shl    $0x2,%eax
  101128:	01 d0                	add    %edx,%eax
  10112a:	c1 e0 04             	shl    $0x4,%eax
  10112d:	29 c1                	sub    %eax,%ecx
  10112f:	89 ca                	mov    %ecx,%edx
  101131:	89 d8                	mov    %ebx,%eax
  101133:	29 d0                	sub    %edx,%eax
  101135:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
        break;
  10113b:	eb 27                	jmp    101164 <cga_putc+0xee>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  10113d:	8b 0d 60 fe 10 00    	mov    0x10fe60,%ecx
  101143:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10114a:	8d 50 01             	lea    0x1(%eax),%edx
  10114d:	66 89 15 64 fe 10 00 	mov    %dx,0x10fe64
  101154:	0f b7 c0             	movzwl %ax,%eax
  101157:	01 c0                	add    %eax,%eax
  101159:	01 c8                	add    %ecx,%eax
  10115b:	8b 55 08             	mov    0x8(%ebp),%edx
  10115e:	66 89 10             	mov    %dx,(%eax)
        break;
  101161:	eb 01                	jmp    101164 <cga_putc+0xee>
        break;
  101163:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101164:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10116b:	66 3d cf 07          	cmp    $0x7cf,%ax
  10116f:	76 5a                	jbe    1011cb <cga_putc+0x155>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  101171:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  101176:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  10117c:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  101181:	83 ec 04             	sub    $0x4,%esp
  101184:	68 00 0f 00 00       	push   $0xf00
  101189:	52                   	push   %edx
  10118a:	50                   	push   %eax
  10118b:	e8 07 22 00 00       	call   103397 <memmove>
  101190:	83 c4 10             	add    $0x10,%esp
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101193:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  10119a:	eb 16                	jmp    1011b2 <cga_putc+0x13c>
            crt_buf[i] = 0x0700 | ' ';
  10119c:	8b 15 60 fe 10 00    	mov    0x10fe60,%edx
  1011a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1011a5:	01 c0                	add    %eax,%eax
  1011a7:	01 d0                	add    %edx,%eax
  1011a9:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011ae:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1011b2:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1011b9:	7e e1                	jle    10119c <cga_putc+0x126>
        }
        crt_pos -= CRT_COLS;
  1011bb:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1011c2:	83 e8 50             	sub    $0x50,%eax
  1011c5:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1011cb:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  1011d2:	0f b7 c0             	movzwl %ax,%eax
  1011d5:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  1011d9:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1011dd:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  1011e1:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1011e5:	ee                   	out    %al,(%dx)
}
  1011e6:	90                   	nop
    outb(addr_6845 + 1, crt_pos >> 8);
  1011e7:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1011ee:	66 c1 e8 08          	shr    $0x8,%ax
  1011f2:	0f b6 c0             	movzbl %al,%eax
  1011f5:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  1011fc:	83 c2 01             	add    $0x1,%edx
  1011ff:	0f b7 d2             	movzwl %dx,%edx
  101202:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  101206:	88 45 e9             	mov    %al,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101209:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10120d:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101211:	ee                   	out    %al,(%dx)
}
  101212:	90                   	nop
    outb(addr_6845, 15);
  101213:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  10121a:	0f b7 c0             	movzwl %ax,%eax
  10121d:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  101221:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101225:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101229:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10122d:	ee                   	out    %al,(%dx)
}
  10122e:	90                   	nop
    outb(addr_6845 + 1, crt_pos);
  10122f:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101236:	0f b6 c0             	movzbl %al,%eax
  101239:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  101240:	83 c2 01             	add    $0x1,%edx
  101243:	0f b7 d2             	movzwl %dx,%edx
  101246:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  10124a:	88 45 f1             	mov    %al,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10124d:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101251:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101255:	ee                   	out    %al,(%dx)
}
  101256:	90                   	nop
}
  101257:	90                   	nop
  101258:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10125b:	c9                   	leave  
  10125c:	c3                   	ret    

0010125d <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  10125d:	55                   	push   %ebp
  10125e:	89 e5                	mov    %esp,%ebp
  101260:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101263:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10126a:	eb 09                	jmp    101275 <serial_putc_sub+0x18>
        delay();
  10126c:	e8 33 fb ff ff       	call   100da4 <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101271:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101275:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10127b:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10127f:	89 c2                	mov    %eax,%edx
  101281:	ec                   	in     (%dx),%al
  101282:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101285:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101289:	0f b6 c0             	movzbl %al,%eax
  10128c:	83 e0 20             	and    $0x20,%eax
  10128f:	85 c0                	test   %eax,%eax
  101291:	75 09                	jne    10129c <serial_putc_sub+0x3f>
  101293:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  10129a:	7e d0                	jle    10126c <serial_putc_sub+0xf>
    }
    outb(COM1 + COM_TX, c);
  10129c:	8b 45 08             	mov    0x8(%ebp),%eax
  10129f:	0f b6 c0             	movzbl %al,%eax
  1012a2:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  1012a8:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012ab:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1012af:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1012b3:	ee                   	out    %al,(%dx)
}
  1012b4:	90                   	nop
}
  1012b5:	90                   	nop
  1012b6:	c9                   	leave  
  1012b7:	c3                   	ret    

001012b8 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  1012b8:	55                   	push   %ebp
  1012b9:	89 e5                	mov    %esp,%ebp
    if (c != '\b') {
  1012bb:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1012bf:	74 0d                	je     1012ce <serial_putc+0x16>
        serial_putc_sub(c);
  1012c1:	ff 75 08             	push   0x8(%ebp)
  1012c4:	e8 94 ff ff ff       	call   10125d <serial_putc_sub>
  1012c9:	83 c4 04             	add    $0x4,%esp
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  1012cc:	eb 1e                	jmp    1012ec <serial_putc+0x34>
        serial_putc_sub('\b');
  1012ce:	6a 08                	push   $0x8
  1012d0:	e8 88 ff ff ff       	call   10125d <serial_putc_sub>
  1012d5:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub(' ');
  1012d8:	6a 20                	push   $0x20
  1012da:	e8 7e ff ff ff       	call   10125d <serial_putc_sub>
  1012df:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub('\b');
  1012e2:	6a 08                	push   $0x8
  1012e4:	e8 74 ff ff ff       	call   10125d <serial_putc_sub>
  1012e9:	83 c4 04             	add    $0x4,%esp
}
  1012ec:	90                   	nop
  1012ed:	c9                   	leave  
  1012ee:	c3                   	ret    

001012ef <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1012ef:	55                   	push   %ebp
  1012f0:	89 e5                	mov    %esp,%ebp
  1012f2:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  1012f5:	eb 33                	jmp    10132a <cons_intr+0x3b>
        if (c != 0) {
  1012f7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1012fb:	74 2d                	je     10132a <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  1012fd:	a1 84 00 11 00       	mov    0x110084,%eax
  101302:	8d 50 01             	lea    0x1(%eax),%edx
  101305:	89 15 84 00 11 00    	mov    %edx,0x110084
  10130b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10130e:	88 90 80 fe 10 00    	mov    %dl,0x10fe80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  101314:	a1 84 00 11 00       	mov    0x110084,%eax
  101319:	3d 00 02 00 00       	cmp    $0x200,%eax
  10131e:	75 0a                	jne    10132a <cons_intr+0x3b>
                cons.wpos = 0;
  101320:	c7 05 84 00 11 00 00 	movl   $0x0,0x110084
  101327:	00 00 00 
    while ((c = (*proc)()) != -1) {
  10132a:	8b 45 08             	mov    0x8(%ebp),%eax
  10132d:	ff d0                	call   *%eax
  10132f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101332:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  101336:	75 bf                	jne    1012f7 <cons_intr+0x8>
            }
        }
    }
}
  101338:	90                   	nop
  101339:	90                   	nop
  10133a:	c9                   	leave  
  10133b:	c3                   	ret    

0010133c <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  10133c:	55                   	push   %ebp
  10133d:	89 e5                	mov    %esp,%ebp
  10133f:	83 ec 10             	sub    $0x10,%esp
  101342:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101348:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10134c:	89 c2                	mov    %eax,%edx
  10134e:	ec                   	in     (%dx),%al
  10134f:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101352:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101356:	0f b6 c0             	movzbl %al,%eax
  101359:	83 e0 01             	and    $0x1,%eax
  10135c:	85 c0                	test   %eax,%eax
  10135e:	75 07                	jne    101367 <serial_proc_data+0x2b>
        return -1;
  101360:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101365:	eb 2a                	jmp    101391 <serial_proc_data+0x55>
  101367:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10136d:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101371:	89 c2                	mov    %eax,%edx
  101373:	ec                   	in     (%dx),%al
  101374:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  101377:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  10137b:	0f b6 c0             	movzbl %al,%eax
  10137e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  101381:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  101385:	75 07                	jne    10138e <serial_proc_data+0x52>
        c = '\b';
  101387:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  10138e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  101391:	c9                   	leave  
  101392:	c3                   	ret    

00101393 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  101393:	55                   	push   %ebp
  101394:	89 e5                	mov    %esp,%ebp
  101396:	83 ec 08             	sub    $0x8,%esp
    if (serial_exists) {
  101399:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  10139e:	85 c0                	test   %eax,%eax
  1013a0:	74 10                	je     1013b2 <serial_intr+0x1f>
        cons_intr(serial_proc_data);
  1013a2:	83 ec 0c             	sub    $0xc,%esp
  1013a5:	68 3c 13 10 00       	push   $0x10133c
  1013aa:	e8 40 ff ff ff       	call   1012ef <cons_intr>
  1013af:	83 c4 10             	add    $0x10,%esp
    }
}
  1013b2:	90                   	nop
  1013b3:	c9                   	leave  
  1013b4:	c3                   	ret    

001013b5 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  1013b5:	55                   	push   %ebp
  1013b6:	89 e5                	mov    %esp,%ebp
  1013b8:	83 ec 28             	sub    $0x28,%esp
  1013bb:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013c1:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1013c5:	89 c2                	mov    %eax,%edx
  1013c7:	ec                   	in     (%dx),%al
  1013c8:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  1013cb:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1013cf:	0f b6 c0             	movzbl %al,%eax
  1013d2:	83 e0 01             	and    $0x1,%eax
  1013d5:	85 c0                	test   %eax,%eax
  1013d7:	75 0a                	jne    1013e3 <kbd_proc_data+0x2e>
        return -1;
  1013d9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013de:	e9 5e 01 00 00       	jmp    101541 <kbd_proc_data+0x18c>
  1013e3:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013e9:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1013ed:	89 c2                	mov    %eax,%edx
  1013ef:	ec                   	in     (%dx),%al
  1013f0:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1013f3:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  1013f7:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1013fa:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1013fe:	75 17                	jne    101417 <kbd_proc_data+0x62>
        // E0 escape character
        shift |= E0ESC;
  101400:	a1 88 00 11 00       	mov    0x110088,%eax
  101405:	83 c8 40             	or     $0x40,%eax
  101408:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  10140d:	b8 00 00 00 00       	mov    $0x0,%eax
  101412:	e9 2a 01 00 00       	jmp    101541 <kbd_proc_data+0x18c>
    } else if (data & 0x80) {
  101417:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10141b:	84 c0                	test   %al,%al
  10141d:	79 47                	jns    101466 <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  10141f:	a1 88 00 11 00       	mov    0x110088,%eax
  101424:	83 e0 40             	and    $0x40,%eax
  101427:	85 c0                	test   %eax,%eax
  101429:	75 09                	jne    101434 <kbd_proc_data+0x7f>
  10142b:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10142f:	83 e0 7f             	and    $0x7f,%eax
  101432:	eb 04                	jmp    101438 <kbd_proc_data+0x83>
  101434:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101438:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  10143b:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10143f:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  101446:	83 c8 40             	or     $0x40,%eax
  101449:	0f b6 c0             	movzbl %al,%eax
  10144c:	f7 d0                	not    %eax
  10144e:	89 c2                	mov    %eax,%edx
  101450:	a1 88 00 11 00       	mov    0x110088,%eax
  101455:	21 d0                	and    %edx,%eax
  101457:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  10145c:	b8 00 00 00 00       	mov    $0x0,%eax
  101461:	e9 db 00 00 00       	jmp    101541 <kbd_proc_data+0x18c>
    } else if (shift & E0ESC) {
  101466:	a1 88 00 11 00       	mov    0x110088,%eax
  10146b:	83 e0 40             	and    $0x40,%eax
  10146e:	85 c0                	test   %eax,%eax
  101470:	74 11                	je     101483 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101472:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101476:	a1 88 00 11 00       	mov    0x110088,%eax
  10147b:	83 e0 bf             	and    $0xffffffbf,%eax
  10147e:	a3 88 00 11 00       	mov    %eax,0x110088
    }

    shift |= shiftcode[data];
  101483:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101487:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  10148e:	0f b6 d0             	movzbl %al,%edx
  101491:	a1 88 00 11 00       	mov    0x110088,%eax
  101496:	09 d0                	or     %edx,%eax
  101498:	a3 88 00 11 00       	mov    %eax,0x110088
    shift ^= togglecode[data];
  10149d:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014a1:	0f b6 80 40 f1 10 00 	movzbl 0x10f140(%eax),%eax
  1014a8:	0f b6 d0             	movzbl %al,%edx
  1014ab:	a1 88 00 11 00       	mov    0x110088,%eax
  1014b0:	31 d0                	xor    %edx,%eax
  1014b2:	a3 88 00 11 00       	mov    %eax,0x110088

    c = charcode[shift & (CTL | SHIFT)][data];
  1014b7:	a1 88 00 11 00       	mov    0x110088,%eax
  1014bc:	83 e0 03             	and    $0x3,%eax
  1014bf:	8b 14 85 40 f5 10 00 	mov    0x10f540(,%eax,4),%edx
  1014c6:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014ca:	01 d0                	add    %edx,%eax
  1014cc:	0f b6 00             	movzbl (%eax),%eax
  1014cf:	0f b6 c0             	movzbl %al,%eax
  1014d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1014d5:	a1 88 00 11 00       	mov    0x110088,%eax
  1014da:	83 e0 08             	and    $0x8,%eax
  1014dd:	85 c0                	test   %eax,%eax
  1014df:	74 22                	je     101503 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  1014e1:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1014e5:	7e 0c                	jle    1014f3 <kbd_proc_data+0x13e>
  1014e7:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1014eb:	7f 06                	jg     1014f3 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1014ed:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1014f1:	eb 10                	jmp    101503 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1014f3:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1014f7:	7e 0a                	jle    101503 <kbd_proc_data+0x14e>
  1014f9:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1014fd:	7f 04                	jg     101503 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  1014ff:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  101503:	a1 88 00 11 00       	mov    0x110088,%eax
  101508:	f7 d0                	not    %eax
  10150a:	83 e0 06             	and    $0x6,%eax
  10150d:	85 c0                	test   %eax,%eax
  10150f:	75 2d                	jne    10153e <kbd_proc_data+0x189>
  101511:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  101518:	75 24                	jne    10153e <kbd_proc_data+0x189>
        cprintf("Rebooting!\n");
  10151a:	83 ec 0c             	sub    $0xc,%esp
  10151d:	68 47 38 10 00       	push   $0x103847
  101522:	e8 e3 ed ff ff       	call   10030a <cprintf>
  101527:	83 c4 10             	add    $0x10,%esp
  10152a:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  101530:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101534:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  101538:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  10153c:	ee                   	out    %al,(%dx)
}
  10153d:	90                   	nop
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  10153e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  101541:	c9                   	leave  
  101542:	c3                   	ret    

00101543 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101543:	55                   	push   %ebp
  101544:	89 e5                	mov    %esp,%ebp
  101546:	83 ec 08             	sub    $0x8,%esp
    cons_intr(kbd_proc_data);
  101549:	83 ec 0c             	sub    $0xc,%esp
  10154c:	68 b5 13 10 00       	push   $0x1013b5
  101551:	e8 99 fd ff ff       	call   1012ef <cons_intr>
  101556:	83 c4 10             	add    $0x10,%esp
}
  101559:	90                   	nop
  10155a:	c9                   	leave  
  10155b:	c3                   	ret    

0010155c <kbd_init>:

static void
kbd_init(void) {
  10155c:	55                   	push   %ebp
  10155d:	89 e5                	mov    %esp,%ebp
  10155f:	83 ec 08             	sub    $0x8,%esp
    // drain the kbd buffer
    kbd_intr();
  101562:	e8 dc ff ff ff       	call   101543 <kbd_intr>
    pic_enable(IRQ_KBD);
  101567:	83 ec 0c             	sub    $0xc,%esp
  10156a:	6a 01                	push   $0x1
  10156c:	e8 2e 01 00 00       	call   10169f <pic_enable>
  101571:	83 c4 10             	add    $0x10,%esp
}
  101574:	90                   	nop
  101575:	c9                   	leave  
  101576:	c3                   	ret    

00101577 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101577:	55                   	push   %ebp
  101578:	89 e5                	mov    %esp,%ebp
  10157a:	83 ec 08             	sub    $0x8,%esp
    cga_init();
  10157d:	e8 6b f8 ff ff       	call   100ded <cga_init>
    serial_init();
  101582:	e8 4f f9 ff ff       	call   100ed6 <serial_init>
    kbd_init();
  101587:	e8 d0 ff ff ff       	call   10155c <kbd_init>
    if (!serial_exists) {
  10158c:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  101591:	85 c0                	test   %eax,%eax
  101593:	75 10                	jne    1015a5 <cons_init+0x2e>
        cprintf("serial port does not exist!!\n");
  101595:	83 ec 0c             	sub    $0xc,%esp
  101598:	68 53 38 10 00       	push   $0x103853
  10159d:	e8 68 ed ff ff       	call   10030a <cprintf>
  1015a2:	83 c4 10             	add    $0x10,%esp
    }
}
  1015a5:	90                   	nop
  1015a6:	c9                   	leave  
  1015a7:	c3                   	ret    

001015a8 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  1015a8:	55                   	push   %ebp
  1015a9:	89 e5                	mov    %esp,%ebp
  1015ab:	83 ec 08             	sub    $0x8,%esp
    lpt_putc(c);
  1015ae:	ff 75 08             	push   0x8(%ebp)
  1015b1:	e8 89 fa ff ff       	call   10103f <lpt_putc>
  1015b6:	83 c4 04             	add    $0x4,%esp
    cga_putc(c);
  1015b9:	83 ec 0c             	sub    $0xc,%esp
  1015bc:	ff 75 08             	push   0x8(%ebp)
  1015bf:	e8 b2 fa ff ff       	call   101076 <cga_putc>
  1015c4:	83 c4 10             	add    $0x10,%esp
    serial_putc(c);
  1015c7:	83 ec 0c             	sub    $0xc,%esp
  1015ca:	ff 75 08             	push   0x8(%ebp)
  1015cd:	e8 e6 fc ff ff       	call   1012b8 <serial_putc>
  1015d2:	83 c4 10             	add    $0x10,%esp
}
  1015d5:	90                   	nop
  1015d6:	c9                   	leave  
  1015d7:	c3                   	ret    

001015d8 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1015d8:	55                   	push   %ebp
  1015d9:	89 e5                	mov    %esp,%ebp
  1015db:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1015de:	e8 b0 fd ff ff       	call   101393 <serial_intr>
    kbd_intr();
  1015e3:	e8 5b ff ff ff       	call   101543 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015e8:	8b 15 80 00 11 00    	mov    0x110080,%edx
  1015ee:	a1 84 00 11 00       	mov    0x110084,%eax
  1015f3:	39 c2                	cmp    %eax,%edx
  1015f5:	74 36                	je     10162d <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  1015f7:	a1 80 00 11 00       	mov    0x110080,%eax
  1015fc:	8d 50 01             	lea    0x1(%eax),%edx
  1015ff:	89 15 80 00 11 00    	mov    %edx,0x110080
  101605:	0f b6 80 80 fe 10 00 	movzbl 0x10fe80(%eax),%eax
  10160c:	0f b6 c0             	movzbl %al,%eax
  10160f:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  101612:	a1 80 00 11 00       	mov    0x110080,%eax
  101617:	3d 00 02 00 00       	cmp    $0x200,%eax
  10161c:	75 0a                	jne    101628 <cons_getc+0x50>
            cons.rpos = 0;
  10161e:	c7 05 80 00 11 00 00 	movl   $0x0,0x110080
  101625:	00 00 00 
        }
        return c;
  101628:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10162b:	eb 05                	jmp    101632 <cons_getc+0x5a>
    }
    return 0;
  10162d:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101632:	c9                   	leave  
  101633:	c3                   	ret    

00101634 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  101634:	55                   	push   %ebp
  101635:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  101637:	fb                   	sti    
}
  101638:	90                   	nop
    sti();
}
  101639:	90                   	nop
  10163a:	5d                   	pop    %ebp
  10163b:	c3                   	ret    

0010163c <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  10163c:	55                   	push   %ebp
  10163d:	89 e5                	mov    %esp,%ebp

static inline void
cli(void) {
    asm volatile ("cli");
  10163f:	fa                   	cli    
}
  101640:	90                   	nop
    cli();
}
  101641:	90                   	nop
  101642:	5d                   	pop    %ebp
  101643:	c3                   	ret    

00101644 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101644:	55                   	push   %ebp
  101645:	89 e5                	mov    %esp,%ebp
  101647:	83 ec 14             	sub    $0x14,%esp
  10164a:	8b 45 08             	mov    0x8(%ebp),%eax
  10164d:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101651:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101655:	66 a3 50 f5 10 00    	mov    %ax,0x10f550
    if (did_init) {
  10165b:	a1 8c 00 11 00       	mov    0x11008c,%eax
  101660:	85 c0                	test   %eax,%eax
  101662:	74 38                	je     10169c <pic_setmask+0x58>
        outb(IO_PIC1 + 1, mask);
  101664:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101668:	0f b6 c0             	movzbl %al,%eax
  10166b:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  101671:	88 45 f9             	mov    %al,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101674:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101678:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10167c:	ee                   	out    %al,(%dx)
}
  10167d:	90                   	nop
        outb(IO_PIC2 + 1, mask >> 8);
  10167e:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101682:	66 c1 e8 08          	shr    $0x8,%ax
  101686:	0f b6 c0             	movzbl %al,%eax
  101689:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  10168f:	88 45 fd             	mov    %al,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101692:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101696:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  10169a:	ee                   	out    %al,(%dx)
}
  10169b:	90                   	nop
    }
}
  10169c:	90                   	nop
  10169d:	c9                   	leave  
  10169e:	c3                   	ret    

0010169f <pic_enable>:

void
pic_enable(unsigned int irq) {
  10169f:	55                   	push   %ebp
  1016a0:	89 e5                	mov    %esp,%ebp
    pic_setmask(irq_mask & ~(1 << irq));
  1016a2:	8b 45 08             	mov    0x8(%ebp),%eax
  1016a5:	ba 01 00 00 00       	mov    $0x1,%edx
  1016aa:	89 c1                	mov    %eax,%ecx
  1016ac:	d3 e2                	shl    %cl,%edx
  1016ae:	89 d0                	mov    %edx,%eax
  1016b0:	f7 d0                	not    %eax
  1016b2:	89 c2                	mov    %eax,%edx
  1016b4:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  1016bb:	21 d0                	and    %edx,%eax
  1016bd:	0f b7 c0             	movzwl %ax,%eax
  1016c0:	50                   	push   %eax
  1016c1:	e8 7e ff ff ff       	call   101644 <pic_setmask>
  1016c6:	83 c4 04             	add    $0x4,%esp
}
  1016c9:	90                   	nop
  1016ca:	c9                   	leave  
  1016cb:	c3                   	ret    

001016cc <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  1016cc:	55                   	push   %ebp
  1016cd:	89 e5                	mov    %esp,%ebp
  1016cf:	83 ec 40             	sub    $0x40,%esp
    did_init = 1;
  1016d2:	c7 05 8c 00 11 00 01 	movl   $0x1,0x11008c
  1016d9:	00 00 00 
  1016dc:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  1016e2:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1016e6:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1016ea:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1016ee:	ee                   	out    %al,(%dx)
}
  1016ef:	90                   	nop
  1016f0:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  1016f6:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1016fa:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1016fe:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  101702:	ee                   	out    %al,(%dx)
}
  101703:	90                   	nop
  101704:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  10170a:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10170e:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  101712:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  101716:	ee                   	out    %al,(%dx)
}
  101717:	90                   	nop
  101718:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  10171e:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101722:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  101726:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  10172a:	ee                   	out    %al,(%dx)
}
  10172b:	90                   	nop
  10172c:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  101732:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101736:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  10173a:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  10173e:	ee                   	out    %al,(%dx)
}
  10173f:	90                   	nop
  101740:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  101746:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10174a:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  10174e:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101752:	ee                   	out    %al,(%dx)
}
  101753:	90                   	nop
  101754:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  10175a:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10175e:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101762:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101766:	ee                   	out    %al,(%dx)
}
  101767:	90                   	nop
  101768:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  10176e:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101772:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101776:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10177a:	ee                   	out    %al,(%dx)
}
  10177b:	90                   	nop
  10177c:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  101782:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101786:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10178a:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10178e:	ee                   	out    %al,(%dx)
}
  10178f:	90                   	nop
  101790:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  101796:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10179a:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10179e:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1017a2:	ee                   	out    %al,(%dx)
}
  1017a3:	90                   	nop
  1017a4:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  1017aa:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017ae:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1017b2:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1017b6:	ee                   	out    %al,(%dx)
}
  1017b7:	90                   	nop
  1017b8:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  1017be:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017c2:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1017c6:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1017ca:	ee                   	out    %al,(%dx)
}
  1017cb:	90                   	nop
  1017cc:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  1017d2:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017d6:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1017da:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1017de:	ee                   	out    %al,(%dx)
}
  1017df:	90                   	nop
  1017e0:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  1017e6:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017ea:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1017ee:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1017f2:	ee                   	out    %al,(%dx)
}
  1017f3:	90                   	nop
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1017f4:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  1017fb:	66 83 f8 ff          	cmp    $0xffff,%ax
  1017ff:	74 13                	je     101814 <pic_init+0x148>
        pic_setmask(irq_mask);
  101801:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  101808:	0f b7 c0             	movzwl %ax,%eax
  10180b:	50                   	push   %eax
  10180c:	e8 33 fe ff ff       	call   101644 <pic_setmask>
  101811:	83 c4 04             	add    $0x4,%esp
    }
}
  101814:	90                   	nop
  101815:	c9                   	leave  
  101816:	c3                   	ret    

00101817 <print_ticks>:
#include <kdebug.h>
#include <string.h>
#define TICK_NUM 100
volatile size_t tick = 0;

static void print_ticks() {
  101817:	55                   	push   %ebp
  101818:	89 e5                	mov    %esp,%ebp
  10181a:	83 ec 08             	sub    $0x8,%esp
    cprintf("%d ticks\n",TICK_NUM);
  10181d:	83 ec 08             	sub    $0x8,%esp
  101820:	6a 64                	push   $0x64
  101822:	68 80 38 10 00       	push   $0x103880
  101827:	e8 de ea ff ff       	call   10030a <cprintf>
  10182c:	83 c4 10             	add    $0x10,%esp
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  10182f:	90                   	nop
  101830:	c9                   	leave  
  101831:	c3                   	ret    

00101832 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101832:	55                   	push   %ebp
  101833:	89 e5                	mov    %esp,%ebp
  101835:	83 ec 10             	sub    $0x10,%esp
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
    extern uintptr_t __vectors[];
    int i;
    for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i ++) {
  101838:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10183f:	e9 c3 00 00 00       	jmp    101907 <idt_init+0xd5>
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
  101844:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101847:	8b 04 85 e0 f5 10 00 	mov    0x10f5e0(,%eax,4),%eax
  10184e:	89 c2                	mov    %eax,%edx
  101850:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101853:	66 89 14 c5 20 01 11 	mov    %dx,0x110120(,%eax,8)
  10185a:	00 
  10185b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10185e:	66 c7 04 c5 22 01 11 	movw   $0x8,0x110122(,%eax,8)
  101865:	00 08 00 
  101868:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10186b:	0f b6 14 c5 24 01 11 	movzbl 0x110124(,%eax,8),%edx
  101872:	00 
  101873:	83 e2 e0             	and    $0xffffffe0,%edx
  101876:	88 14 c5 24 01 11 00 	mov    %dl,0x110124(,%eax,8)
  10187d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101880:	0f b6 14 c5 24 01 11 	movzbl 0x110124(,%eax,8),%edx
  101887:	00 
  101888:	83 e2 1f             	and    $0x1f,%edx
  10188b:	88 14 c5 24 01 11 00 	mov    %dl,0x110124(,%eax,8)
  101892:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101895:	0f b6 14 c5 25 01 11 	movzbl 0x110125(,%eax,8),%edx
  10189c:	00 
  10189d:	83 e2 f0             	and    $0xfffffff0,%edx
  1018a0:	83 ca 0e             	or     $0xe,%edx
  1018a3:	88 14 c5 25 01 11 00 	mov    %dl,0x110125(,%eax,8)
  1018aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018ad:	0f b6 14 c5 25 01 11 	movzbl 0x110125(,%eax,8),%edx
  1018b4:	00 
  1018b5:	83 e2 ef             	and    $0xffffffef,%edx
  1018b8:	88 14 c5 25 01 11 00 	mov    %dl,0x110125(,%eax,8)
  1018bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018c2:	0f b6 14 c5 25 01 11 	movzbl 0x110125(,%eax,8),%edx
  1018c9:	00 
  1018ca:	83 e2 9f             	and    $0xffffff9f,%edx
  1018cd:	88 14 c5 25 01 11 00 	mov    %dl,0x110125(,%eax,8)
  1018d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018d7:	0f b6 14 c5 25 01 11 	movzbl 0x110125(,%eax,8),%edx
  1018de:	00 
  1018df:	83 ca 80             	or     $0xffffff80,%edx
  1018e2:	88 14 c5 25 01 11 00 	mov    %dl,0x110125(,%eax,8)
  1018e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018ec:	8b 04 85 e0 f5 10 00 	mov    0x10f5e0(,%eax,4),%eax
  1018f3:	c1 e8 10             	shr    $0x10,%eax
  1018f6:	89 c2                	mov    %eax,%edx
  1018f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018fb:	66 89 14 c5 26 01 11 	mov    %dx,0x110126(,%eax,8)
  101902:	00 
    for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i ++) {
  101903:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101907:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10190a:	3d ff 00 00 00       	cmp    $0xff,%eax
  10190f:	0f 86 2f ff ff ff    	jbe    101844 <idt_init+0x12>
    }
	// set for switch from user to kernel
    SETGATE(idt[T_SWITCH_TOK], 0, GD_KTEXT, __vectors[T_SWITCH_TOK], DPL_USER);
  101915:	a1 c4 f7 10 00       	mov    0x10f7c4,%eax
  10191a:	66 a3 e8 04 11 00    	mov    %ax,0x1104e8
  101920:	66 c7 05 ea 04 11 00 	movw   $0x8,0x1104ea
  101927:	08 00 
  101929:	0f b6 05 ec 04 11 00 	movzbl 0x1104ec,%eax
  101930:	83 e0 e0             	and    $0xffffffe0,%eax
  101933:	a2 ec 04 11 00       	mov    %al,0x1104ec
  101938:	0f b6 05 ec 04 11 00 	movzbl 0x1104ec,%eax
  10193f:	83 e0 1f             	and    $0x1f,%eax
  101942:	a2 ec 04 11 00       	mov    %al,0x1104ec
  101947:	0f b6 05 ed 04 11 00 	movzbl 0x1104ed,%eax
  10194e:	83 e0 f0             	and    $0xfffffff0,%eax
  101951:	83 c8 0e             	or     $0xe,%eax
  101954:	a2 ed 04 11 00       	mov    %al,0x1104ed
  101959:	0f b6 05 ed 04 11 00 	movzbl 0x1104ed,%eax
  101960:	83 e0 ef             	and    $0xffffffef,%eax
  101963:	a2 ed 04 11 00       	mov    %al,0x1104ed
  101968:	0f b6 05 ed 04 11 00 	movzbl 0x1104ed,%eax
  10196f:	83 c8 60             	or     $0x60,%eax
  101972:	a2 ed 04 11 00       	mov    %al,0x1104ed
  101977:	0f b6 05 ed 04 11 00 	movzbl 0x1104ed,%eax
  10197e:	83 c8 80             	or     $0xffffff80,%eax
  101981:	a2 ed 04 11 00       	mov    %al,0x1104ed
  101986:	a1 c4 f7 10 00       	mov    0x10f7c4,%eax
  10198b:	c1 e8 10             	shr    $0x10,%eax
  10198e:	66 a3 ee 04 11 00    	mov    %ax,0x1104ee
  101994:	c7 45 f8 60 f5 10 00 	movl   $0x10f560,-0x8(%ebp)
    asm volatile ("lidt (%0)" :: "r" (pd));
  10199b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10199e:	0f 01 18             	lidtl  (%eax)
}
  1019a1:	90                   	nop
	// load the IDT
    lidt(&idt_pd);
}
  1019a2:	90                   	nop
  1019a3:	c9                   	leave  
  1019a4:	c3                   	ret    

001019a5 <trapname>:

static const char *
trapname(int trapno) {
  1019a5:	55                   	push   %ebp
  1019a6:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  1019a8:	8b 45 08             	mov    0x8(%ebp),%eax
  1019ab:	83 f8 13             	cmp    $0x13,%eax
  1019ae:	77 0c                	ja     1019bc <trapname+0x17>
        return excnames[trapno];
  1019b0:	8b 45 08             	mov    0x8(%ebp),%eax
  1019b3:	8b 04 85 e0 3b 10 00 	mov    0x103be0(,%eax,4),%eax
  1019ba:	eb 18                	jmp    1019d4 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  1019bc:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  1019c0:	7e 0d                	jle    1019cf <trapname+0x2a>
  1019c2:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  1019c6:	7f 07                	jg     1019cf <trapname+0x2a>
        return "Hardware Interrupt";
  1019c8:	b8 8a 38 10 00       	mov    $0x10388a,%eax
  1019cd:	eb 05                	jmp    1019d4 <trapname+0x2f>
    }
    return "(unknown trap)";
  1019cf:	b8 9d 38 10 00       	mov    $0x10389d,%eax
}
  1019d4:	5d                   	pop    %ebp
  1019d5:	c3                   	ret    

001019d6 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  1019d6:	55                   	push   %ebp
  1019d7:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  1019d9:	8b 45 08             	mov    0x8(%ebp),%eax
  1019dc:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  1019e0:	66 83 f8 08          	cmp    $0x8,%ax
  1019e4:	0f 94 c0             	sete   %al
  1019e7:	0f b6 c0             	movzbl %al,%eax
}
  1019ea:	5d                   	pop    %ebp
  1019eb:	c3                   	ret    

001019ec <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  1019ec:	55                   	push   %ebp
  1019ed:	89 e5                	mov    %esp,%ebp
  1019ef:	83 ec 18             	sub    $0x18,%esp
    cprintf("trapframe at %p\n", tf);
  1019f2:	83 ec 08             	sub    $0x8,%esp
  1019f5:	ff 75 08             	push   0x8(%ebp)
  1019f8:	68 de 38 10 00       	push   $0x1038de
  1019fd:	e8 08 e9 ff ff       	call   10030a <cprintf>
  101a02:	83 c4 10             	add    $0x10,%esp
    print_regs(&tf->tf_regs);
  101a05:	8b 45 08             	mov    0x8(%ebp),%eax
  101a08:	83 ec 0c             	sub    $0xc,%esp
  101a0b:	50                   	push   %eax
  101a0c:	e8 b4 01 00 00       	call   101bc5 <print_regs>
  101a11:	83 c4 10             	add    $0x10,%esp
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101a14:	8b 45 08             	mov    0x8(%ebp),%eax
  101a17:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101a1b:	0f b7 c0             	movzwl %ax,%eax
  101a1e:	83 ec 08             	sub    $0x8,%esp
  101a21:	50                   	push   %eax
  101a22:	68 ef 38 10 00       	push   $0x1038ef
  101a27:	e8 de e8 ff ff       	call   10030a <cprintf>
  101a2c:	83 c4 10             	add    $0x10,%esp
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101a2f:	8b 45 08             	mov    0x8(%ebp),%eax
  101a32:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101a36:	0f b7 c0             	movzwl %ax,%eax
  101a39:	83 ec 08             	sub    $0x8,%esp
  101a3c:	50                   	push   %eax
  101a3d:	68 02 39 10 00       	push   $0x103902
  101a42:	e8 c3 e8 ff ff       	call   10030a <cprintf>
  101a47:	83 c4 10             	add    $0x10,%esp
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101a4a:	8b 45 08             	mov    0x8(%ebp),%eax
  101a4d:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101a51:	0f b7 c0             	movzwl %ax,%eax
  101a54:	83 ec 08             	sub    $0x8,%esp
  101a57:	50                   	push   %eax
  101a58:	68 15 39 10 00       	push   $0x103915
  101a5d:	e8 a8 e8 ff ff       	call   10030a <cprintf>
  101a62:	83 c4 10             	add    $0x10,%esp
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101a65:	8b 45 08             	mov    0x8(%ebp),%eax
  101a68:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101a6c:	0f b7 c0             	movzwl %ax,%eax
  101a6f:	83 ec 08             	sub    $0x8,%esp
  101a72:	50                   	push   %eax
  101a73:	68 28 39 10 00       	push   $0x103928
  101a78:	e8 8d e8 ff ff       	call   10030a <cprintf>
  101a7d:	83 c4 10             	add    $0x10,%esp
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101a80:	8b 45 08             	mov    0x8(%ebp),%eax
  101a83:	8b 40 30             	mov    0x30(%eax),%eax
  101a86:	83 ec 0c             	sub    $0xc,%esp
  101a89:	50                   	push   %eax
  101a8a:	e8 16 ff ff ff       	call   1019a5 <trapname>
  101a8f:	83 c4 10             	add    $0x10,%esp
  101a92:	8b 55 08             	mov    0x8(%ebp),%edx
  101a95:	8b 52 30             	mov    0x30(%edx),%edx
  101a98:	83 ec 04             	sub    $0x4,%esp
  101a9b:	50                   	push   %eax
  101a9c:	52                   	push   %edx
  101a9d:	68 3b 39 10 00       	push   $0x10393b
  101aa2:	e8 63 e8 ff ff       	call   10030a <cprintf>
  101aa7:	83 c4 10             	add    $0x10,%esp
    cprintf("  err  0x%08x\n", tf->tf_err);
  101aaa:	8b 45 08             	mov    0x8(%ebp),%eax
  101aad:	8b 40 34             	mov    0x34(%eax),%eax
  101ab0:	83 ec 08             	sub    $0x8,%esp
  101ab3:	50                   	push   %eax
  101ab4:	68 4d 39 10 00       	push   $0x10394d
  101ab9:	e8 4c e8 ff ff       	call   10030a <cprintf>
  101abe:	83 c4 10             	add    $0x10,%esp
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101ac1:	8b 45 08             	mov    0x8(%ebp),%eax
  101ac4:	8b 40 38             	mov    0x38(%eax),%eax
  101ac7:	83 ec 08             	sub    $0x8,%esp
  101aca:	50                   	push   %eax
  101acb:	68 5c 39 10 00       	push   $0x10395c
  101ad0:	e8 35 e8 ff ff       	call   10030a <cprintf>
  101ad5:	83 c4 10             	add    $0x10,%esp
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101ad8:	8b 45 08             	mov    0x8(%ebp),%eax
  101adb:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101adf:	0f b7 c0             	movzwl %ax,%eax
  101ae2:	83 ec 08             	sub    $0x8,%esp
  101ae5:	50                   	push   %eax
  101ae6:	68 6b 39 10 00       	push   $0x10396b
  101aeb:	e8 1a e8 ff ff       	call   10030a <cprintf>
  101af0:	83 c4 10             	add    $0x10,%esp
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101af3:	8b 45 08             	mov    0x8(%ebp),%eax
  101af6:	8b 40 40             	mov    0x40(%eax),%eax
  101af9:	83 ec 08             	sub    $0x8,%esp
  101afc:	50                   	push   %eax
  101afd:	68 7e 39 10 00       	push   $0x10397e
  101b02:	e8 03 e8 ff ff       	call   10030a <cprintf>
  101b07:	83 c4 10             	add    $0x10,%esp

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b0a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101b11:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101b18:	eb 3f                	jmp    101b59 <print_trapframe+0x16d>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101b1a:	8b 45 08             	mov    0x8(%ebp),%eax
  101b1d:	8b 50 40             	mov    0x40(%eax),%edx
  101b20:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101b23:	21 d0                	and    %edx,%eax
  101b25:	85 c0                	test   %eax,%eax
  101b27:	74 29                	je     101b52 <print_trapframe+0x166>
  101b29:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b2c:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  101b33:	85 c0                	test   %eax,%eax
  101b35:	74 1b                	je     101b52 <print_trapframe+0x166>
            cprintf("%s,", IA32flags[i]);
  101b37:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b3a:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  101b41:	83 ec 08             	sub    $0x8,%esp
  101b44:	50                   	push   %eax
  101b45:	68 8d 39 10 00       	push   $0x10398d
  101b4a:	e8 bb e7 ff ff       	call   10030a <cprintf>
  101b4f:	83 c4 10             	add    $0x10,%esp
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b52:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101b56:	d1 65 f0             	shll   -0x10(%ebp)
  101b59:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b5c:	83 f8 17             	cmp    $0x17,%eax
  101b5f:	76 b9                	jbe    101b1a <print_trapframe+0x12e>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101b61:	8b 45 08             	mov    0x8(%ebp),%eax
  101b64:	8b 40 40             	mov    0x40(%eax),%eax
  101b67:	c1 e8 0c             	shr    $0xc,%eax
  101b6a:	83 e0 03             	and    $0x3,%eax
  101b6d:	83 ec 08             	sub    $0x8,%esp
  101b70:	50                   	push   %eax
  101b71:	68 91 39 10 00       	push   $0x103991
  101b76:	e8 8f e7 ff ff       	call   10030a <cprintf>
  101b7b:	83 c4 10             	add    $0x10,%esp

    if (!trap_in_kernel(tf)) {
  101b7e:	83 ec 0c             	sub    $0xc,%esp
  101b81:	ff 75 08             	push   0x8(%ebp)
  101b84:	e8 4d fe ff ff       	call   1019d6 <trap_in_kernel>
  101b89:	83 c4 10             	add    $0x10,%esp
  101b8c:	85 c0                	test   %eax,%eax
  101b8e:	75 32                	jne    101bc2 <print_trapframe+0x1d6>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101b90:	8b 45 08             	mov    0x8(%ebp),%eax
  101b93:	8b 40 44             	mov    0x44(%eax),%eax
  101b96:	83 ec 08             	sub    $0x8,%esp
  101b99:	50                   	push   %eax
  101b9a:	68 9a 39 10 00       	push   $0x10399a
  101b9f:	e8 66 e7 ff ff       	call   10030a <cprintf>
  101ba4:	83 c4 10             	add    $0x10,%esp
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101ba7:	8b 45 08             	mov    0x8(%ebp),%eax
  101baa:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101bae:	0f b7 c0             	movzwl %ax,%eax
  101bb1:	83 ec 08             	sub    $0x8,%esp
  101bb4:	50                   	push   %eax
  101bb5:	68 a9 39 10 00       	push   $0x1039a9
  101bba:	e8 4b e7 ff ff       	call   10030a <cprintf>
  101bbf:	83 c4 10             	add    $0x10,%esp
    }
}
  101bc2:	90                   	nop
  101bc3:	c9                   	leave  
  101bc4:	c3                   	ret    

00101bc5 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101bc5:	55                   	push   %ebp
  101bc6:	89 e5                	mov    %esp,%ebp
  101bc8:	83 ec 08             	sub    $0x8,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101bcb:	8b 45 08             	mov    0x8(%ebp),%eax
  101bce:	8b 00                	mov    (%eax),%eax
  101bd0:	83 ec 08             	sub    $0x8,%esp
  101bd3:	50                   	push   %eax
  101bd4:	68 bc 39 10 00       	push   $0x1039bc
  101bd9:	e8 2c e7 ff ff       	call   10030a <cprintf>
  101bde:	83 c4 10             	add    $0x10,%esp
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101be1:	8b 45 08             	mov    0x8(%ebp),%eax
  101be4:	8b 40 04             	mov    0x4(%eax),%eax
  101be7:	83 ec 08             	sub    $0x8,%esp
  101bea:	50                   	push   %eax
  101beb:	68 cb 39 10 00       	push   $0x1039cb
  101bf0:	e8 15 e7 ff ff       	call   10030a <cprintf>
  101bf5:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101bf8:	8b 45 08             	mov    0x8(%ebp),%eax
  101bfb:	8b 40 08             	mov    0x8(%eax),%eax
  101bfe:	83 ec 08             	sub    $0x8,%esp
  101c01:	50                   	push   %eax
  101c02:	68 da 39 10 00       	push   $0x1039da
  101c07:	e8 fe e6 ff ff       	call   10030a <cprintf>
  101c0c:	83 c4 10             	add    $0x10,%esp
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101c0f:	8b 45 08             	mov    0x8(%ebp),%eax
  101c12:	8b 40 0c             	mov    0xc(%eax),%eax
  101c15:	83 ec 08             	sub    $0x8,%esp
  101c18:	50                   	push   %eax
  101c19:	68 e9 39 10 00       	push   $0x1039e9
  101c1e:	e8 e7 e6 ff ff       	call   10030a <cprintf>
  101c23:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101c26:	8b 45 08             	mov    0x8(%ebp),%eax
  101c29:	8b 40 10             	mov    0x10(%eax),%eax
  101c2c:	83 ec 08             	sub    $0x8,%esp
  101c2f:	50                   	push   %eax
  101c30:	68 f8 39 10 00       	push   $0x1039f8
  101c35:	e8 d0 e6 ff ff       	call   10030a <cprintf>
  101c3a:	83 c4 10             	add    $0x10,%esp
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101c3d:	8b 45 08             	mov    0x8(%ebp),%eax
  101c40:	8b 40 14             	mov    0x14(%eax),%eax
  101c43:	83 ec 08             	sub    $0x8,%esp
  101c46:	50                   	push   %eax
  101c47:	68 07 3a 10 00       	push   $0x103a07
  101c4c:	e8 b9 e6 ff ff       	call   10030a <cprintf>
  101c51:	83 c4 10             	add    $0x10,%esp
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101c54:	8b 45 08             	mov    0x8(%ebp),%eax
  101c57:	8b 40 18             	mov    0x18(%eax),%eax
  101c5a:	83 ec 08             	sub    $0x8,%esp
  101c5d:	50                   	push   %eax
  101c5e:	68 16 3a 10 00       	push   $0x103a16
  101c63:	e8 a2 e6 ff ff       	call   10030a <cprintf>
  101c68:	83 c4 10             	add    $0x10,%esp
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101c6b:	8b 45 08             	mov    0x8(%ebp),%eax
  101c6e:	8b 40 1c             	mov    0x1c(%eax),%eax
  101c71:	83 ec 08             	sub    $0x8,%esp
  101c74:	50                   	push   %eax
  101c75:	68 25 3a 10 00       	push   $0x103a25
  101c7a:	e8 8b e6 ff ff       	call   10030a <cprintf>
  101c7f:	83 c4 10             	add    $0x10,%esp
}
  101c82:	90                   	nop
  101c83:	c9                   	leave  
  101c84:	c3                   	ret    

00101c85 <trap_dispatch>:
/* temporary trapframe or pointer to trapframe */
struct trapframe switchk2u, *switchu2k;

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101c85:	55                   	push   %ebp
  101c86:	89 e5                	mov    %esp,%ebp
  101c88:	83 ec 18             	sub    $0x18,%esp
    char c;

    switch (tf->tf_trapno) {
  101c8b:	8b 45 08             	mov    0x8(%ebp),%eax
  101c8e:	8b 40 30             	mov    0x30(%eax),%eax
  101c91:	83 f8 79             	cmp    $0x79,%eax
  101c94:	0f 84 19 01 00 00    	je     101db3 <trap_dispatch+0x12e>
  101c9a:	83 f8 79             	cmp    $0x79,%eax
  101c9d:	0f 87 50 01 00 00    	ja     101df3 <trap_dispatch+0x16e>
  101ca3:	83 f8 78             	cmp    $0x78,%eax
  101ca6:	0f 84 b5 00 00 00    	je     101d61 <trap_dispatch+0xdc>
  101cac:	83 f8 78             	cmp    $0x78,%eax
  101caf:	0f 87 3e 01 00 00    	ja     101df3 <trap_dispatch+0x16e>
  101cb5:	83 f8 2f             	cmp    $0x2f,%eax
  101cb8:	0f 87 35 01 00 00    	ja     101df3 <trap_dispatch+0x16e>
  101cbe:	83 f8 2e             	cmp    $0x2e,%eax
  101cc1:	0f 83 62 01 00 00    	jae    101e29 <trap_dispatch+0x1a4>
  101cc7:	83 f8 24             	cmp    $0x24,%eax
  101cca:	74 47                	je     101d13 <trap_dispatch+0x8e>
  101ccc:	83 f8 24             	cmp    $0x24,%eax
  101ccf:	0f 87 1e 01 00 00    	ja     101df3 <trap_dispatch+0x16e>
  101cd5:	83 f8 20             	cmp    $0x20,%eax
  101cd8:	74 0a                	je     101ce4 <trap_dispatch+0x5f>
  101cda:	83 f8 21             	cmp    $0x21,%eax
  101cdd:	74 5b                	je     101d3a <trap_dispatch+0xb5>
  101cdf:	e9 0f 01 00 00       	jmp    101df3 <trap_dispatch+0x16e>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        tick ++;
  101ce4:	a1 a0 00 11 00       	mov    0x1100a0,%eax
  101ce9:	83 c0 01             	add    $0x1,%eax
  101cec:	a3 a0 00 11 00       	mov    %eax,0x1100a0
        if (tick == TICK_NUM) {
  101cf1:	a1 a0 00 11 00       	mov    0x1100a0,%eax
  101cf6:	83 f8 64             	cmp    $0x64,%eax
  101cf9:	0f 85 2d 01 00 00    	jne    101e2c <trap_dispatch+0x1a7>
            tick = 0; 
  101cff:	c7 05 a0 00 11 00 00 	movl   $0x0,0x1100a0
  101d06:	00 00 00 
            print_ticks();
  101d09:	e8 09 fb ff ff       	call   101817 <print_ticks>
        }
        break;
  101d0e:	e9 19 01 00 00       	jmp    101e2c <trap_dispatch+0x1a7>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101d13:	e8 c0 f8 ff ff       	call   1015d8 <cons_getc>
  101d18:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101d1b:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101d1f:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101d23:	83 ec 04             	sub    $0x4,%esp
  101d26:	52                   	push   %edx
  101d27:	50                   	push   %eax
  101d28:	68 34 3a 10 00       	push   $0x103a34
  101d2d:	e8 d8 e5 ff ff       	call   10030a <cprintf>
  101d32:	83 c4 10             	add    $0x10,%esp
        break;
  101d35:	e9 f9 00 00 00       	jmp    101e33 <trap_dispatch+0x1ae>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101d3a:	e8 99 f8 ff ff       	call   1015d8 <cons_getc>
  101d3f:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101d42:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101d46:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101d4a:	83 ec 04             	sub    $0x4,%esp
  101d4d:	52                   	push   %edx
  101d4e:	50                   	push   %eax
  101d4f:	68 46 3a 10 00       	push   $0x103a46
  101d54:	e8 b1 e5 ff ff       	call   10030a <cprintf>
  101d59:	83 c4 10             	add    $0x10,%esp
        break;
  101d5c:	e9 d2 00 00 00       	jmp    101e33 <trap_dispatch+0x1ae>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
        if (tf->tf_cs != USER_CS) { //检查当前CS段是否是用户态CS段
  101d61:	8b 45 08             	mov    0x8(%ebp),%eax
  101d64:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101d68:	66 83 f8 1b          	cmp    $0x1b,%ax
  101d6c:	0f 84 bd 00 00 00    	je     101e2f <trap_dispatch+0x1aa>
    	    tf->tf_cs = USER_CS; 
  101d72:	8b 45 08             	mov    0x8(%ebp),%eax
  101d75:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
    	    tf->tf_ds = tf->tf_es = tf->tf_ss = USER_DS; //修改各段的值为预定义的用户态DS段值
  101d7b:	8b 45 08             	mov    0x8(%ebp),%eax
  101d7e:	66 c7 40 48 23 00    	movw   $0x23,0x48(%eax)
  101d84:	8b 45 08             	mov    0x8(%ebp),%eax
  101d87:	0f b7 50 48          	movzwl 0x48(%eax),%edx
  101d8b:	8b 45 08             	mov    0x8(%ebp),%eax
  101d8e:	66 89 50 28          	mov    %dx,0x28(%eax)
  101d92:	8b 45 08             	mov    0x8(%ebp),%eax
  101d95:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101d99:	8b 45 08             	mov    0x8(%ebp),%eax
  101d9c:	66 89 50 2c          	mov    %dx,0x2c(%eax)
    	    tf->tf_eflags |= FL_IOPL_MASK; // 修改权限 使用户态拥有io权限
  101da0:	8b 45 08             	mov    0x8(%ebp),%eax
  101da3:	8b 40 40             	mov    0x40(%eax),%eax
  101da6:	80 cc 30             	or     $0x30,%ah
  101da9:	89 c2                	mov    %eax,%edx
  101dab:	8b 45 08             	mov    0x8(%ebp),%eax
  101dae:	89 50 40             	mov    %edx,0x40(%eax)
        }
        break;
  101db1:	eb 7c                	jmp    101e2f <trap_dispatch+0x1aa>
    case T_SWITCH_TOK:
        if (tf->tf_cs != KERNEL_CS) {
  101db3:	8b 45 08             	mov    0x8(%ebp),%eax
  101db6:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101dba:	66 83 f8 08          	cmp    $0x8,%ax
  101dbe:	74 72                	je     101e32 <trap_dispatch+0x1ad>
    	    tf->tf_cs = KERNEL_CS; //修改为内核态CS
  101dc0:	8b 45 08             	mov    0x8(%ebp),%eax
  101dc3:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
    	    tf->tf_ds = tf->tf_es = KERNEL_DS;
  101dc9:	8b 45 08             	mov    0x8(%ebp),%eax
  101dcc:	66 c7 40 28 10 00    	movw   $0x10,0x28(%eax)
  101dd2:	8b 45 08             	mov    0x8(%ebp),%eax
  101dd5:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101dd9:	8b 45 08             	mov    0x8(%ebp),%eax
  101ddc:	66 89 50 2c          	mov    %dx,0x2c(%eax)
    	    tf->tf_eflags &= ~FL_IOPL_MASK;//复原IO权限
  101de0:	8b 45 08             	mov    0x8(%ebp),%eax
  101de3:	8b 40 40             	mov    0x40(%eax),%eax
  101de6:	80 e4 cf             	and    $0xcf,%ah
  101de9:	89 c2                	mov    %eax,%edx
  101deb:	8b 45 08             	mov    0x8(%ebp),%eax
  101dee:	89 50 40             	mov    %edx,0x40(%eax)
        }
        break;
  101df1:	eb 3f                	jmp    101e32 <trap_dispatch+0x1ad>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101df3:	8b 45 08             	mov    0x8(%ebp),%eax
  101df6:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101dfa:	0f b7 c0             	movzwl %ax,%eax
  101dfd:	83 e0 03             	and    $0x3,%eax
  101e00:	85 c0                	test   %eax,%eax
  101e02:	75 2f                	jne    101e33 <trap_dispatch+0x1ae>
            print_trapframe(tf);
  101e04:	83 ec 0c             	sub    $0xc,%esp
  101e07:	ff 75 08             	push   0x8(%ebp)
  101e0a:	e8 dd fb ff ff       	call   1019ec <print_trapframe>
  101e0f:	83 c4 10             	add    $0x10,%esp
            panic("unexpected trap in kernel.\n");
  101e12:	83 ec 04             	sub    $0x4,%esp
  101e15:	68 55 3a 10 00       	push   $0x103a55
  101e1a:	68 c8 00 00 00       	push   $0xc8
  101e1f:	68 71 3a 10 00       	push   $0x103a71
  101e24:	e8 3b ee ff ff       	call   100c64 <__panic>
        break;
  101e29:	90                   	nop
  101e2a:	eb 07                	jmp    101e33 <trap_dispatch+0x1ae>
        break;
  101e2c:	90                   	nop
  101e2d:	eb 04                	jmp    101e33 <trap_dispatch+0x1ae>
        break;
  101e2f:	90                   	nop
  101e30:	eb 01                	jmp    101e33 <trap_dispatch+0x1ae>
        break;
  101e32:	90                   	nop
        }
    }
}
  101e33:	90                   	nop
  101e34:	c9                   	leave  
  101e35:	c3                   	ret    

00101e36 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101e36:	55                   	push   %ebp
  101e37:	89 e5                	mov    %esp,%ebp
  101e39:	83 ec 08             	sub    $0x8,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101e3c:	83 ec 0c             	sub    $0xc,%esp
  101e3f:	ff 75 08             	push   0x8(%ebp)
  101e42:	e8 3e fe ff ff       	call   101c85 <trap_dispatch>
  101e47:	83 c4 10             	add    $0x10,%esp
}
  101e4a:	90                   	nop
  101e4b:	c9                   	leave  
  101e4c:	c3                   	ret    

00101e4d <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  101e4d:	1e                   	push   %ds
    pushl %es
  101e4e:	06                   	push   %es
    pushl %fs
  101e4f:	0f a0                	push   %fs
    pushl %gs
  101e51:	0f a8                	push   %gs
    pushal
  101e53:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  101e54:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  101e59:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  101e5b:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  101e5d:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  101e5e:	e8 d3 ff ff ff       	call   101e36 <trap>

    # pop the pushed stack pointer
    popl %esp
  101e63:	5c                   	pop    %esp

00101e64 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  101e64:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  101e65:	0f a9                	pop    %gs
    popl %fs
  101e67:	0f a1                	pop    %fs
    popl %es
  101e69:	07                   	pop    %es
    popl %ds
  101e6a:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  101e6b:	83 c4 08             	add    $0x8,%esp
    iret
  101e6e:	cf                   	iret   

00101e6f <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101e6f:	6a 00                	push   $0x0
  pushl $0
  101e71:	6a 00                	push   $0x0
  jmp __alltraps
  101e73:	e9 d5 ff ff ff       	jmp    101e4d <__alltraps>

00101e78 <vector1>:
.globl vector1
vector1:
  pushl $0
  101e78:	6a 00                	push   $0x0
  pushl $1
  101e7a:	6a 01                	push   $0x1
  jmp __alltraps
  101e7c:	e9 cc ff ff ff       	jmp    101e4d <__alltraps>

00101e81 <vector2>:
.globl vector2
vector2:
  pushl $0
  101e81:	6a 00                	push   $0x0
  pushl $2
  101e83:	6a 02                	push   $0x2
  jmp __alltraps
  101e85:	e9 c3 ff ff ff       	jmp    101e4d <__alltraps>

00101e8a <vector3>:
.globl vector3
vector3:
  pushl $0
  101e8a:	6a 00                	push   $0x0
  pushl $3
  101e8c:	6a 03                	push   $0x3
  jmp __alltraps
  101e8e:	e9 ba ff ff ff       	jmp    101e4d <__alltraps>

00101e93 <vector4>:
.globl vector4
vector4:
  pushl $0
  101e93:	6a 00                	push   $0x0
  pushl $4
  101e95:	6a 04                	push   $0x4
  jmp __alltraps
  101e97:	e9 b1 ff ff ff       	jmp    101e4d <__alltraps>

00101e9c <vector5>:
.globl vector5
vector5:
  pushl $0
  101e9c:	6a 00                	push   $0x0
  pushl $5
  101e9e:	6a 05                	push   $0x5
  jmp __alltraps
  101ea0:	e9 a8 ff ff ff       	jmp    101e4d <__alltraps>

00101ea5 <vector6>:
.globl vector6
vector6:
  pushl $0
  101ea5:	6a 00                	push   $0x0
  pushl $6
  101ea7:	6a 06                	push   $0x6
  jmp __alltraps
  101ea9:	e9 9f ff ff ff       	jmp    101e4d <__alltraps>

00101eae <vector7>:
.globl vector7
vector7:
  pushl $0
  101eae:	6a 00                	push   $0x0
  pushl $7
  101eb0:	6a 07                	push   $0x7
  jmp __alltraps
  101eb2:	e9 96 ff ff ff       	jmp    101e4d <__alltraps>

00101eb7 <vector8>:
.globl vector8
vector8:
  pushl $8
  101eb7:	6a 08                	push   $0x8
  jmp __alltraps
  101eb9:	e9 8f ff ff ff       	jmp    101e4d <__alltraps>

00101ebe <vector9>:
.globl vector9
vector9:
  pushl $9
  101ebe:	6a 09                	push   $0x9
  jmp __alltraps
  101ec0:	e9 88 ff ff ff       	jmp    101e4d <__alltraps>

00101ec5 <vector10>:
.globl vector10
vector10:
  pushl $10
  101ec5:	6a 0a                	push   $0xa
  jmp __alltraps
  101ec7:	e9 81 ff ff ff       	jmp    101e4d <__alltraps>

00101ecc <vector11>:
.globl vector11
vector11:
  pushl $11
  101ecc:	6a 0b                	push   $0xb
  jmp __alltraps
  101ece:	e9 7a ff ff ff       	jmp    101e4d <__alltraps>

00101ed3 <vector12>:
.globl vector12
vector12:
  pushl $12
  101ed3:	6a 0c                	push   $0xc
  jmp __alltraps
  101ed5:	e9 73 ff ff ff       	jmp    101e4d <__alltraps>

00101eda <vector13>:
.globl vector13
vector13:
  pushl $13
  101eda:	6a 0d                	push   $0xd
  jmp __alltraps
  101edc:	e9 6c ff ff ff       	jmp    101e4d <__alltraps>

00101ee1 <vector14>:
.globl vector14
vector14:
  pushl $14
  101ee1:	6a 0e                	push   $0xe
  jmp __alltraps
  101ee3:	e9 65 ff ff ff       	jmp    101e4d <__alltraps>

00101ee8 <vector15>:
.globl vector15
vector15:
  pushl $0
  101ee8:	6a 00                	push   $0x0
  pushl $15
  101eea:	6a 0f                	push   $0xf
  jmp __alltraps
  101eec:	e9 5c ff ff ff       	jmp    101e4d <__alltraps>

00101ef1 <vector16>:
.globl vector16
vector16:
  pushl $0
  101ef1:	6a 00                	push   $0x0
  pushl $16
  101ef3:	6a 10                	push   $0x10
  jmp __alltraps
  101ef5:	e9 53 ff ff ff       	jmp    101e4d <__alltraps>

00101efa <vector17>:
.globl vector17
vector17:
  pushl $17
  101efa:	6a 11                	push   $0x11
  jmp __alltraps
  101efc:	e9 4c ff ff ff       	jmp    101e4d <__alltraps>

00101f01 <vector18>:
.globl vector18
vector18:
  pushl $0
  101f01:	6a 00                	push   $0x0
  pushl $18
  101f03:	6a 12                	push   $0x12
  jmp __alltraps
  101f05:	e9 43 ff ff ff       	jmp    101e4d <__alltraps>

00101f0a <vector19>:
.globl vector19
vector19:
  pushl $0
  101f0a:	6a 00                	push   $0x0
  pushl $19
  101f0c:	6a 13                	push   $0x13
  jmp __alltraps
  101f0e:	e9 3a ff ff ff       	jmp    101e4d <__alltraps>

00101f13 <vector20>:
.globl vector20
vector20:
  pushl $0
  101f13:	6a 00                	push   $0x0
  pushl $20
  101f15:	6a 14                	push   $0x14
  jmp __alltraps
  101f17:	e9 31 ff ff ff       	jmp    101e4d <__alltraps>

00101f1c <vector21>:
.globl vector21
vector21:
  pushl $0
  101f1c:	6a 00                	push   $0x0
  pushl $21
  101f1e:	6a 15                	push   $0x15
  jmp __alltraps
  101f20:	e9 28 ff ff ff       	jmp    101e4d <__alltraps>

00101f25 <vector22>:
.globl vector22
vector22:
  pushl $0
  101f25:	6a 00                	push   $0x0
  pushl $22
  101f27:	6a 16                	push   $0x16
  jmp __alltraps
  101f29:	e9 1f ff ff ff       	jmp    101e4d <__alltraps>

00101f2e <vector23>:
.globl vector23
vector23:
  pushl $0
  101f2e:	6a 00                	push   $0x0
  pushl $23
  101f30:	6a 17                	push   $0x17
  jmp __alltraps
  101f32:	e9 16 ff ff ff       	jmp    101e4d <__alltraps>

00101f37 <vector24>:
.globl vector24
vector24:
  pushl $0
  101f37:	6a 00                	push   $0x0
  pushl $24
  101f39:	6a 18                	push   $0x18
  jmp __alltraps
  101f3b:	e9 0d ff ff ff       	jmp    101e4d <__alltraps>

00101f40 <vector25>:
.globl vector25
vector25:
  pushl $0
  101f40:	6a 00                	push   $0x0
  pushl $25
  101f42:	6a 19                	push   $0x19
  jmp __alltraps
  101f44:	e9 04 ff ff ff       	jmp    101e4d <__alltraps>

00101f49 <vector26>:
.globl vector26
vector26:
  pushl $0
  101f49:	6a 00                	push   $0x0
  pushl $26
  101f4b:	6a 1a                	push   $0x1a
  jmp __alltraps
  101f4d:	e9 fb fe ff ff       	jmp    101e4d <__alltraps>

00101f52 <vector27>:
.globl vector27
vector27:
  pushl $0
  101f52:	6a 00                	push   $0x0
  pushl $27
  101f54:	6a 1b                	push   $0x1b
  jmp __alltraps
  101f56:	e9 f2 fe ff ff       	jmp    101e4d <__alltraps>

00101f5b <vector28>:
.globl vector28
vector28:
  pushl $0
  101f5b:	6a 00                	push   $0x0
  pushl $28
  101f5d:	6a 1c                	push   $0x1c
  jmp __alltraps
  101f5f:	e9 e9 fe ff ff       	jmp    101e4d <__alltraps>

00101f64 <vector29>:
.globl vector29
vector29:
  pushl $0
  101f64:	6a 00                	push   $0x0
  pushl $29
  101f66:	6a 1d                	push   $0x1d
  jmp __alltraps
  101f68:	e9 e0 fe ff ff       	jmp    101e4d <__alltraps>

00101f6d <vector30>:
.globl vector30
vector30:
  pushl $0
  101f6d:	6a 00                	push   $0x0
  pushl $30
  101f6f:	6a 1e                	push   $0x1e
  jmp __alltraps
  101f71:	e9 d7 fe ff ff       	jmp    101e4d <__alltraps>

00101f76 <vector31>:
.globl vector31
vector31:
  pushl $0
  101f76:	6a 00                	push   $0x0
  pushl $31
  101f78:	6a 1f                	push   $0x1f
  jmp __alltraps
  101f7a:	e9 ce fe ff ff       	jmp    101e4d <__alltraps>

00101f7f <vector32>:
.globl vector32
vector32:
  pushl $0
  101f7f:	6a 00                	push   $0x0
  pushl $32
  101f81:	6a 20                	push   $0x20
  jmp __alltraps
  101f83:	e9 c5 fe ff ff       	jmp    101e4d <__alltraps>

00101f88 <vector33>:
.globl vector33
vector33:
  pushl $0
  101f88:	6a 00                	push   $0x0
  pushl $33
  101f8a:	6a 21                	push   $0x21
  jmp __alltraps
  101f8c:	e9 bc fe ff ff       	jmp    101e4d <__alltraps>

00101f91 <vector34>:
.globl vector34
vector34:
  pushl $0
  101f91:	6a 00                	push   $0x0
  pushl $34
  101f93:	6a 22                	push   $0x22
  jmp __alltraps
  101f95:	e9 b3 fe ff ff       	jmp    101e4d <__alltraps>

00101f9a <vector35>:
.globl vector35
vector35:
  pushl $0
  101f9a:	6a 00                	push   $0x0
  pushl $35
  101f9c:	6a 23                	push   $0x23
  jmp __alltraps
  101f9e:	e9 aa fe ff ff       	jmp    101e4d <__alltraps>

00101fa3 <vector36>:
.globl vector36
vector36:
  pushl $0
  101fa3:	6a 00                	push   $0x0
  pushl $36
  101fa5:	6a 24                	push   $0x24
  jmp __alltraps
  101fa7:	e9 a1 fe ff ff       	jmp    101e4d <__alltraps>

00101fac <vector37>:
.globl vector37
vector37:
  pushl $0
  101fac:	6a 00                	push   $0x0
  pushl $37
  101fae:	6a 25                	push   $0x25
  jmp __alltraps
  101fb0:	e9 98 fe ff ff       	jmp    101e4d <__alltraps>

00101fb5 <vector38>:
.globl vector38
vector38:
  pushl $0
  101fb5:	6a 00                	push   $0x0
  pushl $38
  101fb7:	6a 26                	push   $0x26
  jmp __alltraps
  101fb9:	e9 8f fe ff ff       	jmp    101e4d <__alltraps>

00101fbe <vector39>:
.globl vector39
vector39:
  pushl $0
  101fbe:	6a 00                	push   $0x0
  pushl $39
  101fc0:	6a 27                	push   $0x27
  jmp __alltraps
  101fc2:	e9 86 fe ff ff       	jmp    101e4d <__alltraps>

00101fc7 <vector40>:
.globl vector40
vector40:
  pushl $0
  101fc7:	6a 00                	push   $0x0
  pushl $40
  101fc9:	6a 28                	push   $0x28
  jmp __alltraps
  101fcb:	e9 7d fe ff ff       	jmp    101e4d <__alltraps>

00101fd0 <vector41>:
.globl vector41
vector41:
  pushl $0
  101fd0:	6a 00                	push   $0x0
  pushl $41
  101fd2:	6a 29                	push   $0x29
  jmp __alltraps
  101fd4:	e9 74 fe ff ff       	jmp    101e4d <__alltraps>

00101fd9 <vector42>:
.globl vector42
vector42:
  pushl $0
  101fd9:	6a 00                	push   $0x0
  pushl $42
  101fdb:	6a 2a                	push   $0x2a
  jmp __alltraps
  101fdd:	e9 6b fe ff ff       	jmp    101e4d <__alltraps>

00101fe2 <vector43>:
.globl vector43
vector43:
  pushl $0
  101fe2:	6a 00                	push   $0x0
  pushl $43
  101fe4:	6a 2b                	push   $0x2b
  jmp __alltraps
  101fe6:	e9 62 fe ff ff       	jmp    101e4d <__alltraps>

00101feb <vector44>:
.globl vector44
vector44:
  pushl $0
  101feb:	6a 00                	push   $0x0
  pushl $44
  101fed:	6a 2c                	push   $0x2c
  jmp __alltraps
  101fef:	e9 59 fe ff ff       	jmp    101e4d <__alltraps>

00101ff4 <vector45>:
.globl vector45
vector45:
  pushl $0
  101ff4:	6a 00                	push   $0x0
  pushl $45
  101ff6:	6a 2d                	push   $0x2d
  jmp __alltraps
  101ff8:	e9 50 fe ff ff       	jmp    101e4d <__alltraps>

00101ffd <vector46>:
.globl vector46
vector46:
  pushl $0
  101ffd:	6a 00                	push   $0x0
  pushl $46
  101fff:	6a 2e                	push   $0x2e
  jmp __alltraps
  102001:	e9 47 fe ff ff       	jmp    101e4d <__alltraps>

00102006 <vector47>:
.globl vector47
vector47:
  pushl $0
  102006:	6a 00                	push   $0x0
  pushl $47
  102008:	6a 2f                	push   $0x2f
  jmp __alltraps
  10200a:	e9 3e fe ff ff       	jmp    101e4d <__alltraps>

0010200f <vector48>:
.globl vector48
vector48:
  pushl $0
  10200f:	6a 00                	push   $0x0
  pushl $48
  102011:	6a 30                	push   $0x30
  jmp __alltraps
  102013:	e9 35 fe ff ff       	jmp    101e4d <__alltraps>

00102018 <vector49>:
.globl vector49
vector49:
  pushl $0
  102018:	6a 00                	push   $0x0
  pushl $49
  10201a:	6a 31                	push   $0x31
  jmp __alltraps
  10201c:	e9 2c fe ff ff       	jmp    101e4d <__alltraps>

00102021 <vector50>:
.globl vector50
vector50:
  pushl $0
  102021:	6a 00                	push   $0x0
  pushl $50
  102023:	6a 32                	push   $0x32
  jmp __alltraps
  102025:	e9 23 fe ff ff       	jmp    101e4d <__alltraps>

0010202a <vector51>:
.globl vector51
vector51:
  pushl $0
  10202a:	6a 00                	push   $0x0
  pushl $51
  10202c:	6a 33                	push   $0x33
  jmp __alltraps
  10202e:	e9 1a fe ff ff       	jmp    101e4d <__alltraps>

00102033 <vector52>:
.globl vector52
vector52:
  pushl $0
  102033:	6a 00                	push   $0x0
  pushl $52
  102035:	6a 34                	push   $0x34
  jmp __alltraps
  102037:	e9 11 fe ff ff       	jmp    101e4d <__alltraps>

0010203c <vector53>:
.globl vector53
vector53:
  pushl $0
  10203c:	6a 00                	push   $0x0
  pushl $53
  10203e:	6a 35                	push   $0x35
  jmp __alltraps
  102040:	e9 08 fe ff ff       	jmp    101e4d <__alltraps>

00102045 <vector54>:
.globl vector54
vector54:
  pushl $0
  102045:	6a 00                	push   $0x0
  pushl $54
  102047:	6a 36                	push   $0x36
  jmp __alltraps
  102049:	e9 ff fd ff ff       	jmp    101e4d <__alltraps>

0010204e <vector55>:
.globl vector55
vector55:
  pushl $0
  10204e:	6a 00                	push   $0x0
  pushl $55
  102050:	6a 37                	push   $0x37
  jmp __alltraps
  102052:	e9 f6 fd ff ff       	jmp    101e4d <__alltraps>

00102057 <vector56>:
.globl vector56
vector56:
  pushl $0
  102057:	6a 00                	push   $0x0
  pushl $56
  102059:	6a 38                	push   $0x38
  jmp __alltraps
  10205b:	e9 ed fd ff ff       	jmp    101e4d <__alltraps>

00102060 <vector57>:
.globl vector57
vector57:
  pushl $0
  102060:	6a 00                	push   $0x0
  pushl $57
  102062:	6a 39                	push   $0x39
  jmp __alltraps
  102064:	e9 e4 fd ff ff       	jmp    101e4d <__alltraps>

00102069 <vector58>:
.globl vector58
vector58:
  pushl $0
  102069:	6a 00                	push   $0x0
  pushl $58
  10206b:	6a 3a                	push   $0x3a
  jmp __alltraps
  10206d:	e9 db fd ff ff       	jmp    101e4d <__alltraps>

00102072 <vector59>:
.globl vector59
vector59:
  pushl $0
  102072:	6a 00                	push   $0x0
  pushl $59
  102074:	6a 3b                	push   $0x3b
  jmp __alltraps
  102076:	e9 d2 fd ff ff       	jmp    101e4d <__alltraps>

0010207b <vector60>:
.globl vector60
vector60:
  pushl $0
  10207b:	6a 00                	push   $0x0
  pushl $60
  10207d:	6a 3c                	push   $0x3c
  jmp __alltraps
  10207f:	e9 c9 fd ff ff       	jmp    101e4d <__alltraps>

00102084 <vector61>:
.globl vector61
vector61:
  pushl $0
  102084:	6a 00                	push   $0x0
  pushl $61
  102086:	6a 3d                	push   $0x3d
  jmp __alltraps
  102088:	e9 c0 fd ff ff       	jmp    101e4d <__alltraps>

0010208d <vector62>:
.globl vector62
vector62:
  pushl $0
  10208d:	6a 00                	push   $0x0
  pushl $62
  10208f:	6a 3e                	push   $0x3e
  jmp __alltraps
  102091:	e9 b7 fd ff ff       	jmp    101e4d <__alltraps>

00102096 <vector63>:
.globl vector63
vector63:
  pushl $0
  102096:	6a 00                	push   $0x0
  pushl $63
  102098:	6a 3f                	push   $0x3f
  jmp __alltraps
  10209a:	e9 ae fd ff ff       	jmp    101e4d <__alltraps>

0010209f <vector64>:
.globl vector64
vector64:
  pushl $0
  10209f:	6a 00                	push   $0x0
  pushl $64
  1020a1:	6a 40                	push   $0x40
  jmp __alltraps
  1020a3:	e9 a5 fd ff ff       	jmp    101e4d <__alltraps>

001020a8 <vector65>:
.globl vector65
vector65:
  pushl $0
  1020a8:	6a 00                	push   $0x0
  pushl $65
  1020aa:	6a 41                	push   $0x41
  jmp __alltraps
  1020ac:	e9 9c fd ff ff       	jmp    101e4d <__alltraps>

001020b1 <vector66>:
.globl vector66
vector66:
  pushl $0
  1020b1:	6a 00                	push   $0x0
  pushl $66
  1020b3:	6a 42                	push   $0x42
  jmp __alltraps
  1020b5:	e9 93 fd ff ff       	jmp    101e4d <__alltraps>

001020ba <vector67>:
.globl vector67
vector67:
  pushl $0
  1020ba:	6a 00                	push   $0x0
  pushl $67
  1020bc:	6a 43                	push   $0x43
  jmp __alltraps
  1020be:	e9 8a fd ff ff       	jmp    101e4d <__alltraps>

001020c3 <vector68>:
.globl vector68
vector68:
  pushl $0
  1020c3:	6a 00                	push   $0x0
  pushl $68
  1020c5:	6a 44                	push   $0x44
  jmp __alltraps
  1020c7:	e9 81 fd ff ff       	jmp    101e4d <__alltraps>

001020cc <vector69>:
.globl vector69
vector69:
  pushl $0
  1020cc:	6a 00                	push   $0x0
  pushl $69
  1020ce:	6a 45                	push   $0x45
  jmp __alltraps
  1020d0:	e9 78 fd ff ff       	jmp    101e4d <__alltraps>

001020d5 <vector70>:
.globl vector70
vector70:
  pushl $0
  1020d5:	6a 00                	push   $0x0
  pushl $70
  1020d7:	6a 46                	push   $0x46
  jmp __alltraps
  1020d9:	e9 6f fd ff ff       	jmp    101e4d <__alltraps>

001020de <vector71>:
.globl vector71
vector71:
  pushl $0
  1020de:	6a 00                	push   $0x0
  pushl $71
  1020e0:	6a 47                	push   $0x47
  jmp __alltraps
  1020e2:	e9 66 fd ff ff       	jmp    101e4d <__alltraps>

001020e7 <vector72>:
.globl vector72
vector72:
  pushl $0
  1020e7:	6a 00                	push   $0x0
  pushl $72
  1020e9:	6a 48                	push   $0x48
  jmp __alltraps
  1020eb:	e9 5d fd ff ff       	jmp    101e4d <__alltraps>

001020f0 <vector73>:
.globl vector73
vector73:
  pushl $0
  1020f0:	6a 00                	push   $0x0
  pushl $73
  1020f2:	6a 49                	push   $0x49
  jmp __alltraps
  1020f4:	e9 54 fd ff ff       	jmp    101e4d <__alltraps>

001020f9 <vector74>:
.globl vector74
vector74:
  pushl $0
  1020f9:	6a 00                	push   $0x0
  pushl $74
  1020fb:	6a 4a                	push   $0x4a
  jmp __alltraps
  1020fd:	e9 4b fd ff ff       	jmp    101e4d <__alltraps>

00102102 <vector75>:
.globl vector75
vector75:
  pushl $0
  102102:	6a 00                	push   $0x0
  pushl $75
  102104:	6a 4b                	push   $0x4b
  jmp __alltraps
  102106:	e9 42 fd ff ff       	jmp    101e4d <__alltraps>

0010210b <vector76>:
.globl vector76
vector76:
  pushl $0
  10210b:	6a 00                	push   $0x0
  pushl $76
  10210d:	6a 4c                	push   $0x4c
  jmp __alltraps
  10210f:	e9 39 fd ff ff       	jmp    101e4d <__alltraps>

00102114 <vector77>:
.globl vector77
vector77:
  pushl $0
  102114:	6a 00                	push   $0x0
  pushl $77
  102116:	6a 4d                	push   $0x4d
  jmp __alltraps
  102118:	e9 30 fd ff ff       	jmp    101e4d <__alltraps>

0010211d <vector78>:
.globl vector78
vector78:
  pushl $0
  10211d:	6a 00                	push   $0x0
  pushl $78
  10211f:	6a 4e                	push   $0x4e
  jmp __alltraps
  102121:	e9 27 fd ff ff       	jmp    101e4d <__alltraps>

00102126 <vector79>:
.globl vector79
vector79:
  pushl $0
  102126:	6a 00                	push   $0x0
  pushl $79
  102128:	6a 4f                	push   $0x4f
  jmp __alltraps
  10212a:	e9 1e fd ff ff       	jmp    101e4d <__alltraps>

0010212f <vector80>:
.globl vector80
vector80:
  pushl $0
  10212f:	6a 00                	push   $0x0
  pushl $80
  102131:	6a 50                	push   $0x50
  jmp __alltraps
  102133:	e9 15 fd ff ff       	jmp    101e4d <__alltraps>

00102138 <vector81>:
.globl vector81
vector81:
  pushl $0
  102138:	6a 00                	push   $0x0
  pushl $81
  10213a:	6a 51                	push   $0x51
  jmp __alltraps
  10213c:	e9 0c fd ff ff       	jmp    101e4d <__alltraps>

00102141 <vector82>:
.globl vector82
vector82:
  pushl $0
  102141:	6a 00                	push   $0x0
  pushl $82
  102143:	6a 52                	push   $0x52
  jmp __alltraps
  102145:	e9 03 fd ff ff       	jmp    101e4d <__alltraps>

0010214a <vector83>:
.globl vector83
vector83:
  pushl $0
  10214a:	6a 00                	push   $0x0
  pushl $83
  10214c:	6a 53                	push   $0x53
  jmp __alltraps
  10214e:	e9 fa fc ff ff       	jmp    101e4d <__alltraps>

00102153 <vector84>:
.globl vector84
vector84:
  pushl $0
  102153:	6a 00                	push   $0x0
  pushl $84
  102155:	6a 54                	push   $0x54
  jmp __alltraps
  102157:	e9 f1 fc ff ff       	jmp    101e4d <__alltraps>

0010215c <vector85>:
.globl vector85
vector85:
  pushl $0
  10215c:	6a 00                	push   $0x0
  pushl $85
  10215e:	6a 55                	push   $0x55
  jmp __alltraps
  102160:	e9 e8 fc ff ff       	jmp    101e4d <__alltraps>

00102165 <vector86>:
.globl vector86
vector86:
  pushl $0
  102165:	6a 00                	push   $0x0
  pushl $86
  102167:	6a 56                	push   $0x56
  jmp __alltraps
  102169:	e9 df fc ff ff       	jmp    101e4d <__alltraps>

0010216e <vector87>:
.globl vector87
vector87:
  pushl $0
  10216e:	6a 00                	push   $0x0
  pushl $87
  102170:	6a 57                	push   $0x57
  jmp __alltraps
  102172:	e9 d6 fc ff ff       	jmp    101e4d <__alltraps>

00102177 <vector88>:
.globl vector88
vector88:
  pushl $0
  102177:	6a 00                	push   $0x0
  pushl $88
  102179:	6a 58                	push   $0x58
  jmp __alltraps
  10217b:	e9 cd fc ff ff       	jmp    101e4d <__alltraps>

00102180 <vector89>:
.globl vector89
vector89:
  pushl $0
  102180:	6a 00                	push   $0x0
  pushl $89
  102182:	6a 59                	push   $0x59
  jmp __alltraps
  102184:	e9 c4 fc ff ff       	jmp    101e4d <__alltraps>

00102189 <vector90>:
.globl vector90
vector90:
  pushl $0
  102189:	6a 00                	push   $0x0
  pushl $90
  10218b:	6a 5a                	push   $0x5a
  jmp __alltraps
  10218d:	e9 bb fc ff ff       	jmp    101e4d <__alltraps>

00102192 <vector91>:
.globl vector91
vector91:
  pushl $0
  102192:	6a 00                	push   $0x0
  pushl $91
  102194:	6a 5b                	push   $0x5b
  jmp __alltraps
  102196:	e9 b2 fc ff ff       	jmp    101e4d <__alltraps>

0010219b <vector92>:
.globl vector92
vector92:
  pushl $0
  10219b:	6a 00                	push   $0x0
  pushl $92
  10219d:	6a 5c                	push   $0x5c
  jmp __alltraps
  10219f:	e9 a9 fc ff ff       	jmp    101e4d <__alltraps>

001021a4 <vector93>:
.globl vector93
vector93:
  pushl $0
  1021a4:	6a 00                	push   $0x0
  pushl $93
  1021a6:	6a 5d                	push   $0x5d
  jmp __alltraps
  1021a8:	e9 a0 fc ff ff       	jmp    101e4d <__alltraps>

001021ad <vector94>:
.globl vector94
vector94:
  pushl $0
  1021ad:	6a 00                	push   $0x0
  pushl $94
  1021af:	6a 5e                	push   $0x5e
  jmp __alltraps
  1021b1:	e9 97 fc ff ff       	jmp    101e4d <__alltraps>

001021b6 <vector95>:
.globl vector95
vector95:
  pushl $0
  1021b6:	6a 00                	push   $0x0
  pushl $95
  1021b8:	6a 5f                	push   $0x5f
  jmp __alltraps
  1021ba:	e9 8e fc ff ff       	jmp    101e4d <__alltraps>

001021bf <vector96>:
.globl vector96
vector96:
  pushl $0
  1021bf:	6a 00                	push   $0x0
  pushl $96
  1021c1:	6a 60                	push   $0x60
  jmp __alltraps
  1021c3:	e9 85 fc ff ff       	jmp    101e4d <__alltraps>

001021c8 <vector97>:
.globl vector97
vector97:
  pushl $0
  1021c8:	6a 00                	push   $0x0
  pushl $97
  1021ca:	6a 61                	push   $0x61
  jmp __alltraps
  1021cc:	e9 7c fc ff ff       	jmp    101e4d <__alltraps>

001021d1 <vector98>:
.globl vector98
vector98:
  pushl $0
  1021d1:	6a 00                	push   $0x0
  pushl $98
  1021d3:	6a 62                	push   $0x62
  jmp __alltraps
  1021d5:	e9 73 fc ff ff       	jmp    101e4d <__alltraps>

001021da <vector99>:
.globl vector99
vector99:
  pushl $0
  1021da:	6a 00                	push   $0x0
  pushl $99
  1021dc:	6a 63                	push   $0x63
  jmp __alltraps
  1021de:	e9 6a fc ff ff       	jmp    101e4d <__alltraps>

001021e3 <vector100>:
.globl vector100
vector100:
  pushl $0
  1021e3:	6a 00                	push   $0x0
  pushl $100
  1021e5:	6a 64                	push   $0x64
  jmp __alltraps
  1021e7:	e9 61 fc ff ff       	jmp    101e4d <__alltraps>

001021ec <vector101>:
.globl vector101
vector101:
  pushl $0
  1021ec:	6a 00                	push   $0x0
  pushl $101
  1021ee:	6a 65                	push   $0x65
  jmp __alltraps
  1021f0:	e9 58 fc ff ff       	jmp    101e4d <__alltraps>

001021f5 <vector102>:
.globl vector102
vector102:
  pushl $0
  1021f5:	6a 00                	push   $0x0
  pushl $102
  1021f7:	6a 66                	push   $0x66
  jmp __alltraps
  1021f9:	e9 4f fc ff ff       	jmp    101e4d <__alltraps>

001021fe <vector103>:
.globl vector103
vector103:
  pushl $0
  1021fe:	6a 00                	push   $0x0
  pushl $103
  102200:	6a 67                	push   $0x67
  jmp __alltraps
  102202:	e9 46 fc ff ff       	jmp    101e4d <__alltraps>

00102207 <vector104>:
.globl vector104
vector104:
  pushl $0
  102207:	6a 00                	push   $0x0
  pushl $104
  102209:	6a 68                	push   $0x68
  jmp __alltraps
  10220b:	e9 3d fc ff ff       	jmp    101e4d <__alltraps>

00102210 <vector105>:
.globl vector105
vector105:
  pushl $0
  102210:	6a 00                	push   $0x0
  pushl $105
  102212:	6a 69                	push   $0x69
  jmp __alltraps
  102214:	e9 34 fc ff ff       	jmp    101e4d <__alltraps>

00102219 <vector106>:
.globl vector106
vector106:
  pushl $0
  102219:	6a 00                	push   $0x0
  pushl $106
  10221b:	6a 6a                	push   $0x6a
  jmp __alltraps
  10221d:	e9 2b fc ff ff       	jmp    101e4d <__alltraps>

00102222 <vector107>:
.globl vector107
vector107:
  pushl $0
  102222:	6a 00                	push   $0x0
  pushl $107
  102224:	6a 6b                	push   $0x6b
  jmp __alltraps
  102226:	e9 22 fc ff ff       	jmp    101e4d <__alltraps>

0010222b <vector108>:
.globl vector108
vector108:
  pushl $0
  10222b:	6a 00                	push   $0x0
  pushl $108
  10222d:	6a 6c                	push   $0x6c
  jmp __alltraps
  10222f:	e9 19 fc ff ff       	jmp    101e4d <__alltraps>

00102234 <vector109>:
.globl vector109
vector109:
  pushl $0
  102234:	6a 00                	push   $0x0
  pushl $109
  102236:	6a 6d                	push   $0x6d
  jmp __alltraps
  102238:	e9 10 fc ff ff       	jmp    101e4d <__alltraps>

0010223d <vector110>:
.globl vector110
vector110:
  pushl $0
  10223d:	6a 00                	push   $0x0
  pushl $110
  10223f:	6a 6e                	push   $0x6e
  jmp __alltraps
  102241:	e9 07 fc ff ff       	jmp    101e4d <__alltraps>

00102246 <vector111>:
.globl vector111
vector111:
  pushl $0
  102246:	6a 00                	push   $0x0
  pushl $111
  102248:	6a 6f                	push   $0x6f
  jmp __alltraps
  10224a:	e9 fe fb ff ff       	jmp    101e4d <__alltraps>

0010224f <vector112>:
.globl vector112
vector112:
  pushl $0
  10224f:	6a 00                	push   $0x0
  pushl $112
  102251:	6a 70                	push   $0x70
  jmp __alltraps
  102253:	e9 f5 fb ff ff       	jmp    101e4d <__alltraps>

00102258 <vector113>:
.globl vector113
vector113:
  pushl $0
  102258:	6a 00                	push   $0x0
  pushl $113
  10225a:	6a 71                	push   $0x71
  jmp __alltraps
  10225c:	e9 ec fb ff ff       	jmp    101e4d <__alltraps>

00102261 <vector114>:
.globl vector114
vector114:
  pushl $0
  102261:	6a 00                	push   $0x0
  pushl $114
  102263:	6a 72                	push   $0x72
  jmp __alltraps
  102265:	e9 e3 fb ff ff       	jmp    101e4d <__alltraps>

0010226a <vector115>:
.globl vector115
vector115:
  pushl $0
  10226a:	6a 00                	push   $0x0
  pushl $115
  10226c:	6a 73                	push   $0x73
  jmp __alltraps
  10226e:	e9 da fb ff ff       	jmp    101e4d <__alltraps>

00102273 <vector116>:
.globl vector116
vector116:
  pushl $0
  102273:	6a 00                	push   $0x0
  pushl $116
  102275:	6a 74                	push   $0x74
  jmp __alltraps
  102277:	e9 d1 fb ff ff       	jmp    101e4d <__alltraps>

0010227c <vector117>:
.globl vector117
vector117:
  pushl $0
  10227c:	6a 00                	push   $0x0
  pushl $117
  10227e:	6a 75                	push   $0x75
  jmp __alltraps
  102280:	e9 c8 fb ff ff       	jmp    101e4d <__alltraps>

00102285 <vector118>:
.globl vector118
vector118:
  pushl $0
  102285:	6a 00                	push   $0x0
  pushl $118
  102287:	6a 76                	push   $0x76
  jmp __alltraps
  102289:	e9 bf fb ff ff       	jmp    101e4d <__alltraps>

0010228e <vector119>:
.globl vector119
vector119:
  pushl $0
  10228e:	6a 00                	push   $0x0
  pushl $119
  102290:	6a 77                	push   $0x77
  jmp __alltraps
  102292:	e9 b6 fb ff ff       	jmp    101e4d <__alltraps>

00102297 <vector120>:
.globl vector120
vector120:
  pushl $0
  102297:	6a 00                	push   $0x0
  pushl $120
  102299:	6a 78                	push   $0x78
  jmp __alltraps
  10229b:	e9 ad fb ff ff       	jmp    101e4d <__alltraps>

001022a0 <vector121>:
.globl vector121
vector121:
  pushl $0
  1022a0:	6a 00                	push   $0x0
  pushl $121
  1022a2:	6a 79                	push   $0x79
  jmp __alltraps
  1022a4:	e9 a4 fb ff ff       	jmp    101e4d <__alltraps>

001022a9 <vector122>:
.globl vector122
vector122:
  pushl $0
  1022a9:	6a 00                	push   $0x0
  pushl $122
  1022ab:	6a 7a                	push   $0x7a
  jmp __alltraps
  1022ad:	e9 9b fb ff ff       	jmp    101e4d <__alltraps>

001022b2 <vector123>:
.globl vector123
vector123:
  pushl $0
  1022b2:	6a 00                	push   $0x0
  pushl $123
  1022b4:	6a 7b                	push   $0x7b
  jmp __alltraps
  1022b6:	e9 92 fb ff ff       	jmp    101e4d <__alltraps>

001022bb <vector124>:
.globl vector124
vector124:
  pushl $0
  1022bb:	6a 00                	push   $0x0
  pushl $124
  1022bd:	6a 7c                	push   $0x7c
  jmp __alltraps
  1022bf:	e9 89 fb ff ff       	jmp    101e4d <__alltraps>

001022c4 <vector125>:
.globl vector125
vector125:
  pushl $0
  1022c4:	6a 00                	push   $0x0
  pushl $125
  1022c6:	6a 7d                	push   $0x7d
  jmp __alltraps
  1022c8:	e9 80 fb ff ff       	jmp    101e4d <__alltraps>

001022cd <vector126>:
.globl vector126
vector126:
  pushl $0
  1022cd:	6a 00                	push   $0x0
  pushl $126
  1022cf:	6a 7e                	push   $0x7e
  jmp __alltraps
  1022d1:	e9 77 fb ff ff       	jmp    101e4d <__alltraps>

001022d6 <vector127>:
.globl vector127
vector127:
  pushl $0
  1022d6:	6a 00                	push   $0x0
  pushl $127
  1022d8:	6a 7f                	push   $0x7f
  jmp __alltraps
  1022da:	e9 6e fb ff ff       	jmp    101e4d <__alltraps>

001022df <vector128>:
.globl vector128
vector128:
  pushl $0
  1022df:	6a 00                	push   $0x0
  pushl $128
  1022e1:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  1022e6:	e9 62 fb ff ff       	jmp    101e4d <__alltraps>

001022eb <vector129>:
.globl vector129
vector129:
  pushl $0
  1022eb:	6a 00                	push   $0x0
  pushl $129
  1022ed:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  1022f2:	e9 56 fb ff ff       	jmp    101e4d <__alltraps>

001022f7 <vector130>:
.globl vector130
vector130:
  pushl $0
  1022f7:	6a 00                	push   $0x0
  pushl $130
  1022f9:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  1022fe:	e9 4a fb ff ff       	jmp    101e4d <__alltraps>

00102303 <vector131>:
.globl vector131
vector131:
  pushl $0
  102303:	6a 00                	push   $0x0
  pushl $131
  102305:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  10230a:	e9 3e fb ff ff       	jmp    101e4d <__alltraps>

0010230f <vector132>:
.globl vector132
vector132:
  pushl $0
  10230f:	6a 00                	push   $0x0
  pushl $132
  102311:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  102316:	e9 32 fb ff ff       	jmp    101e4d <__alltraps>

0010231b <vector133>:
.globl vector133
vector133:
  pushl $0
  10231b:	6a 00                	push   $0x0
  pushl $133
  10231d:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  102322:	e9 26 fb ff ff       	jmp    101e4d <__alltraps>

00102327 <vector134>:
.globl vector134
vector134:
  pushl $0
  102327:	6a 00                	push   $0x0
  pushl $134
  102329:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  10232e:	e9 1a fb ff ff       	jmp    101e4d <__alltraps>

00102333 <vector135>:
.globl vector135
vector135:
  pushl $0
  102333:	6a 00                	push   $0x0
  pushl $135
  102335:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  10233a:	e9 0e fb ff ff       	jmp    101e4d <__alltraps>

0010233f <vector136>:
.globl vector136
vector136:
  pushl $0
  10233f:	6a 00                	push   $0x0
  pushl $136
  102341:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  102346:	e9 02 fb ff ff       	jmp    101e4d <__alltraps>

0010234b <vector137>:
.globl vector137
vector137:
  pushl $0
  10234b:	6a 00                	push   $0x0
  pushl $137
  10234d:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  102352:	e9 f6 fa ff ff       	jmp    101e4d <__alltraps>

00102357 <vector138>:
.globl vector138
vector138:
  pushl $0
  102357:	6a 00                	push   $0x0
  pushl $138
  102359:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  10235e:	e9 ea fa ff ff       	jmp    101e4d <__alltraps>

00102363 <vector139>:
.globl vector139
vector139:
  pushl $0
  102363:	6a 00                	push   $0x0
  pushl $139
  102365:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  10236a:	e9 de fa ff ff       	jmp    101e4d <__alltraps>

0010236f <vector140>:
.globl vector140
vector140:
  pushl $0
  10236f:	6a 00                	push   $0x0
  pushl $140
  102371:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  102376:	e9 d2 fa ff ff       	jmp    101e4d <__alltraps>

0010237b <vector141>:
.globl vector141
vector141:
  pushl $0
  10237b:	6a 00                	push   $0x0
  pushl $141
  10237d:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  102382:	e9 c6 fa ff ff       	jmp    101e4d <__alltraps>

00102387 <vector142>:
.globl vector142
vector142:
  pushl $0
  102387:	6a 00                	push   $0x0
  pushl $142
  102389:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  10238e:	e9 ba fa ff ff       	jmp    101e4d <__alltraps>

00102393 <vector143>:
.globl vector143
vector143:
  pushl $0
  102393:	6a 00                	push   $0x0
  pushl $143
  102395:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  10239a:	e9 ae fa ff ff       	jmp    101e4d <__alltraps>

0010239f <vector144>:
.globl vector144
vector144:
  pushl $0
  10239f:	6a 00                	push   $0x0
  pushl $144
  1023a1:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1023a6:	e9 a2 fa ff ff       	jmp    101e4d <__alltraps>

001023ab <vector145>:
.globl vector145
vector145:
  pushl $0
  1023ab:	6a 00                	push   $0x0
  pushl $145
  1023ad:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  1023b2:	e9 96 fa ff ff       	jmp    101e4d <__alltraps>

001023b7 <vector146>:
.globl vector146
vector146:
  pushl $0
  1023b7:	6a 00                	push   $0x0
  pushl $146
  1023b9:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  1023be:	e9 8a fa ff ff       	jmp    101e4d <__alltraps>

001023c3 <vector147>:
.globl vector147
vector147:
  pushl $0
  1023c3:	6a 00                	push   $0x0
  pushl $147
  1023c5:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  1023ca:	e9 7e fa ff ff       	jmp    101e4d <__alltraps>

001023cf <vector148>:
.globl vector148
vector148:
  pushl $0
  1023cf:	6a 00                	push   $0x0
  pushl $148
  1023d1:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  1023d6:	e9 72 fa ff ff       	jmp    101e4d <__alltraps>

001023db <vector149>:
.globl vector149
vector149:
  pushl $0
  1023db:	6a 00                	push   $0x0
  pushl $149
  1023dd:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  1023e2:	e9 66 fa ff ff       	jmp    101e4d <__alltraps>

001023e7 <vector150>:
.globl vector150
vector150:
  pushl $0
  1023e7:	6a 00                	push   $0x0
  pushl $150
  1023e9:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  1023ee:	e9 5a fa ff ff       	jmp    101e4d <__alltraps>

001023f3 <vector151>:
.globl vector151
vector151:
  pushl $0
  1023f3:	6a 00                	push   $0x0
  pushl $151
  1023f5:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  1023fa:	e9 4e fa ff ff       	jmp    101e4d <__alltraps>

001023ff <vector152>:
.globl vector152
vector152:
  pushl $0
  1023ff:	6a 00                	push   $0x0
  pushl $152
  102401:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  102406:	e9 42 fa ff ff       	jmp    101e4d <__alltraps>

0010240b <vector153>:
.globl vector153
vector153:
  pushl $0
  10240b:	6a 00                	push   $0x0
  pushl $153
  10240d:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  102412:	e9 36 fa ff ff       	jmp    101e4d <__alltraps>

00102417 <vector154>:
.globl vector154
vector154:
  pushl $0
  102417:	6a 00                	push   $0x0
  pushl $154
  102419:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  10241e:	e9 2a fa ff ff       	jmp    101e4d <__alltraps>

00102423 <vector155>:
.globl vector155
vector155:
  pushl $0
  102423:	6a 00                	push   $0x0
  pushl $155
  102425:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  10242a:	e9 1e fa ff ff       	jmp    101e4d <__alltraps>

0010242f <vector156>:
.globl vector156
vector156:
  pushl $0
  10242f:	6a 00                	push   $0x0
  pushl $156
  102431:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  102436:	e9 12 fa ff ff       	jmp    101e4d <__alltraps>

0010243b <vector157>:
.globl vector157
vector157:
  pushl $0
  10243b:	6a 00                	push   $0x0
  pushl $157
  10243d:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  102442:	e9 06 fa ff ff       	jmp    101e4d <__alltraps>

00102447 <vector158>:
.globl vector158
vector158:
  pushl $0
  102447:	6a 00                	push   $0x0
  pushl $158
  102449:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  10244e:	e9 fa f9 ff ff       	jmp    101e4d <__alltraps>

00102453 <vector159>:
.globl vector159
vector159:
  pushl $0
  102453:	6a 00                	push   $0x0
  pushl $159
  102455:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  10245a:	e9 ee f9 ff ff       	jmp    101e4d <__alltraps>

0010245f <vector160>:
.globl vector160
vector160:
  pushl $0
  10245f:	6a 00                	push   $0x0
  pushl $160
  102461:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  102466:	e9 e2 f9 ff ff       	jmp    101e4d <__alltraps>

0010246b <vector161>:
.globl vector161
vector161:
  pushl $0
  10246b:	6a 00                	push   $0x0
  pushl $161
  10246d:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  102472:	e9 d6 f9 ff ff       	jmp    101e4d <__alltraps>

00102477 <vector162>:
.globl vector162
vector162:
  pushl $0
  102477:	6a 00                	push   $0x0
  pushl $162
  102479:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  10247e:	e9 ca f9 ff ff       	jmp    101e4d <__alltraps>

00102483 <vector163>:
.globl vector163
vector163:
  pushl $0
  102483:	6a 00                	push   $0x0
  pushl $163
  102485:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  10248a:	e9 be f9 ff ff       	jmp    101e4d <__alltraps>

0010248f <vector164>:
.globl vector164
vector164:
  pushl $0
  10248f:	6a 00                	push   $0x0
  pushl $164
  102491:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  102496:	e9 b2 f9 ff ff       	jmp    101e4d <__alltraps>

0010249b <vector165>:
.globl vector165
vector165:
  pushl $0
  10249b:	6a 00                	push   $0x0
  pushl $165
  10249d:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1024a2:	e9 a6 f9 ff ff       	jmp    101e4d <__alltraps>

001024a7 <vector166>:
.globl vector166
vector166:
  pushl $0
  1024a7:	6a 00                	push   $0x0
  pushl $166
  1024a9:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  1024ae:	e9 9a f9 ff ff       	jmp    101e4d <__alltraps>

001024b3 <vector167>:
.globl vector167
vector167:
  pushl $0
  1024b3:	6a 00                	push   $0x0
  pushl $167
  1024b5:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  1024ba:	e9 8e f9 ff ff       	jmp    101e4d <__alltraps>

001024bf <vector168>:
.globl vector168
vector168:
  pushl $0
  1024bf:	6a 00                	push   $0x0
  pushl $168
  1024c1:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  1024c6:	e9 82 f9 ff ff       	jmp    101e4d <__alltraps>

001024cb <vector169>:
.globl vector169
vector169:
  pushl $0
  1024cb:	6a 00                	push   $0x0
  pushl $169
  1024cd:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  1024d2:	e9 76 f9 ff ff       	jmp    101e4d <__alltraps>

001024d7 <vector170>:
.globl vector170
vector170:
  pushl $0
  1024d7:	6a 00                	push   $0x0
  pushl $170
  1024d9:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  1024de:	e9 6a f9 ff ff       	jmp    101e4d <__alltraps>

001024e3 <vector171>:
.globl vector171
vector171:
  pushl $0
  1024e3:	6a 00                	push   $0x0
  pushl $171
  1024e5:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  1024ea:	e9 5e f9 ff ff       	jmp    101e4d <__alltraps>

001024ef <vector172>:
.globl vector172
vector172:
  pushl $0
  1024ef:	6a 00                	push   $0x0
  pushl $172
  1024f1:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  1024f6:	e9 52 f9 ff ff       	jmp    101e4d <__alltraps>

001024fb <vector173>:
.globl vector173
vector173:
  pushl $0
  1024fb:	6a 00                	push   $0x0
  pushl $173
  1024fd:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  102502:	e9 46 f9 ff ff       	jmp    101e4d <__alltraps>

00102507 <vector174>:
.globl vector174
vector174:
  pushl $0
  102507:	6a 00                	push   $0x0
  pushl $174
  102509:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  10250e:	e9 3a f9 ff ff       	jmp    101e4d <__alltraps>

00102513 <vector175>:
.globl vector175
vector175:
  pushl $0
  102513:	6a 00                	push   $0x0
  pushl $175
  102515:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  10251a:	e9 2e f9 ff ff       	jmp    101e4d <__alltraps>

0010251f <vector176>:
.globl vector176
vector176:
  pushl $0
  10251f:	6a 00                	push   $0x0
  pushl $176
  102521:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  102526:	e9 22 f9 ff ff       	jmp    101e4d <__alltraps>

0010252b <vector177>:
.globl vector177
vector177:
  pushl $0
  10252b:	6a 00                	push   $0x0
  pushl $177
  10252d:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  102532:	e9 16 f9 ff ff       	jmp    101e4d <__alltraps>

00102537 <vector178>:
.globl vector178
vector178:
  pushl $0
  102537:	6a 00                	push   $0x0
  pushl $178
  102539:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  10253e:	e9 0a f9 ff ff       	jmp    101e4d <__alltraps>

00102543 <vector179>:
.globl vector179
vector179:
  pushl $0
  102543:	6a 00                	push   $0x0
  pushl $179
  102545:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  10254a:	e9 fe f8 ff ff       	jmp    101e4d <__alltraps>

0010254f <vector180>:
.globl vector180
vector180:
  pushl $0
  10254f:	6a 00                	push   $0x0
  pushl $180
  102551:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  102556:	e9 f2 f8 ff ff       	jmp    101e4d <__alltraps>

0010255b <vector181>:
.globl vector181
vector181:
  pushl $0
  10255b:	6a 00                	push   $0x0
  pushl $181
  10255d:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  102562:	e9 e6 f8 ff ff       	jmp    101e4d <__alltraps>

00102567 <vector182>:
.globl vector182
vector182:
  pushl $0
  102567:	6a 00                	push   $0x0
  pushl $182
  102569:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  10256e:	e9 da f8 ff ff       	jmp    101e4d <__alltraps>

00102573 <vector183>:
.globl vector183
vector183:
  pushl $0
  102573:	6a 00                	push   $0x0
  pushl $183
  102575:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  10257a:	e9 ce f8 ff ff       	jmp    101e4d <__alltraps>

0010257f <vector184>:
.globl vector184
vector184:
  pushl $0
  10257f:	6a 00                	push   $0x0
  pushl $184
  102581:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  102586:	e9 c2 f8 ff ff       	jmp    101e4d <__alltraps>

0010258b <vector185>:
.globl vector185
vector185:
  pushl $0
  10258b:	6a 00                	push   $0x0
  pushl $185
  10258d:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  102592:	e9 b6 f8 ff ff       	jmp    101e4d <__alltraps>

00102597 <vector186>:
.globl vector186
vector186:
  pushl $0
  102597:	6a 00                	push   $0x0
  pushl $186
  102599:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  10259e:	e9 aa f8 ff ff       	jmp    101e4d <__alltraps>

001025a3 <vector187>:
.globl vector187
vector187:
  pushl $0
  1025a3:	6a 00                	push   $0x0
  pushl $187
  1025a5:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  1025aa:	e9 9e f8 ff ff       	jmp    101e4d <__alltraps>

001025af <vector188>:
.globl vector188
vector188:
  pushl $0
  1025af:	6a 00                	push   $0x0
  pushl $188
  1025b1:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  1025b6:	e9 92 f8 ff ff       	jmp    101e4d <__alltraps>

001025bb <vector189>:
.globl vector189
vector189:
  pushl $0
  1025bb:	6a 00                	push   $0x0
  pushl $189
  1025bd:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  1025c2:	e9 86 f8 ff ff       	jmp    101e4d <__alltraps>

001025c7 <vector190>:
.globl vector190
vector190:
  pushl $0
  1025c7:	6a 00                	push   $0x0
  pushl $190
  1025c9:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  1025ce:	e9 7a f8 ff ff       	jmp    101e4d <__alltraps>

001025d3 <vector191>:
.globl vector191
vector191:
  pushl $0
  1025d3:	6a 00                	push   $0x0
  pushl $191
  1025d5:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  1025da:	e9 6e f8 ff ff       	jmp    101e4d <__alltraps>

001025df <vector192>:
.globl vector192
vector192:
  pushl $0
  1025df:	6a 00                	push   $0x0
  pushl $192
  1025e1:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  1025e6:	e9 62 f8 ff ff       	jmp    101e4d <__alltraps>

001025eb <vector193>:
.globl vector193
vector193:
  pushl $0
  1025eb:	6a 00                	push   $0x0
  pushl $193
  1025ed:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  1025f2:	e9 56 f8 ff ff       	jmp    101e4d <__alltraps>

001025f7 <vector194>:
.globl vector194
vector194:
  pushl $0
  1025f7:	6a 00                	push   $0x0
  pushl $194
  1025f9:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  1025fe:	e9 4a f8 ff ff       	jmp    101e4d <__alltraps>

00102603 <vector195>:
.globl vector195
vector195:
  pushl $0
  102603:	6a 00                	push   $0x0
  pushl $195
  102605:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  10260a:	e9 3e f8 ff ff       	jmp    101e4d <__alltraps>

0010260f <vector196>:
.globl vector196
vector196:
  pushl $0
  10260f:	6a 00                	push   $0x0
  pushl $196
  102611:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  102616:	e9 32 f8 ff ff       	jmp    101e4d <__alltraps>

0010261b <vector197>:
.globl vector197
vector197:
  pushl $0
  10261b:	6a 00                	push   $0x0
  pushl $197
  10261d:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  102622:	e9 26 f8 ff ff       	jmp    101e4d <__alltraps>

00102627 <vector198>:
.globl vector198
vector198:
  pushl $0
  102627:	6a 00                	push   $0x0
  pushl $198
  102629:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  10262e:	e9 1a f8 ff ff       	jmp    101e4d <__alltraps>

00102633 <vector199>:
.globl vector199
vector199:
  pushl $0
  102633:	6a 00                	push   $0x0
  pushl $199
  102635:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  10263a:	e9 0e f8 ff ff       	jmp    101e4d <__alltraps>

0010263f <vector200>:
.globl vector200
vector200:
  pushl $0
  10263f:	6a 00                	push   $0x0
  pushl $200
  102641:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  102646:	e9 02 f8 ff ff       	jmp    101e4d <__alltraps>

0010264b <vector201>:
.globl vector201
vector201:
  pushl $0
  10264b:	6a 00                	push   $0x0
  pushl $201
  10264d:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  102652:	e9 f6 f7 ff ff       	jmp    101e4d <__alltraps>

00102657 <vector202>:
.globl vector202
vector202:
  pushl $0
  102657:	6a 00                	push   $0x0
  pushl $202
  102659:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  10265e:	e9 ea f7 ff ff       	jmp    101e4d <__alltraps>

00102663 <vector203>:
.globl vector203
vector203:
  pushl $0
  102663:	6a 00                	push   $0x0
  pushl $203
  102665:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  10266a:	e9 de f7 ff ff       	jmp    101e4d <__alltraps>

0010266f <vector204>:
.globl vector204
vector204:
  pushl $0
  10266f:	6a 00                	push   $0x0
  pushl $204
  102671:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  102676:	e9 d2 f7 ff ff       	jmp    101e4d <__alltraps>

0010267b <vector205>:
.globl vector205
vector205:
  pushl $0
  10267b:	6a 00                	push   $0x0
  pushl $205
  10267d:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  102682:	e9 c6 f7 ff ff       	jmp    101e4d <__alltraps>

00102687 <vector206>:
.globl vector206
vector206:
  pushl $0
  102687:	6a 00                	push   $0x0
  pushl $206
  102689:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  10268e:	e9 ba f7 ff ff       	jmp    101e4d <__alltraps>

00102693 <vector207>:
.globl vector207
vector207:
  pushl $0
  102693:	6a 00                	push   $0x0
  pushl $207
  102695:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  10269a:	e9 ae f7 ff ff       	jmp    101e4d <__alltraps>

0010269f <vector208>:
.globl vector208
vector208:
  pushl $0
  10269f:	6a 00                	push   $0x0
  pushl $208
  1026a1:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1026a6:	e9 a2 f7 ff ff       	jmp    101e4d <__alltraps>

001026ab <vector209>:
.globl vector209
vector209:
  pushl $0
  1026ab:	6a 00                	push   $0x0
  pushl $209
  1026ad:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  1026b2:	e9 96 f7 ff ff       	jmp    101e4d <__alltraps>

001026b7 <vector210>:
.globl vector210
vector210:
  pushl $0
  1026b7:	6a 00                	push   $0x0
  pushl $210
  1026b9:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  1026be:	e9 8a f7 ff ff       	jmp    101e4d <__alltraps>

001026c3 <vector211>:
.globl vector211
vector211:
  pushl $0
  1026c3:	6a 00                	push   $0x0
  pushl $211
  1026c5:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  1026ca:	e9 7e f7 ff ff       	jmp    101e4d <__alltraps>

001026cf <vector212>:
.globl vector212
vector212:
  pushl $0
  1026cf:	6a 00                	push   $0x0
  pushl $212
  1026d1:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  1026d6:	e9 72 f7 ff ff       	jmp    101e4d <__alltraps>

001026db <vector213>:
.globl vector213
vector213:
  pushl $0
  1026db:	6a 00                	push   $0x0
  pushl $213
  1026dd:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  1026e2:	e9 66 f7 ff ff       	jmp    101e4d <__alltraps>

001026e7 <vector214>:
.globl vector214
vector214:
  pushl $0
  1026e7:	6a 00                	push   $0x0
  pushl $214
  1026e9:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  1026ee:	e9 5a f7 ff ff       	jmp    101e4d <__alltraps>

001026f3 <vector215>:
.globl vector215
vector215:
  pushl $0
  1026f3:	6a 00                	push   $0x0
  pushl $215
  1026f5:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  1026fa:	e9 4e f7 ff ff       	jmp    101e4d <__alltraps>

001026ff <vector216>:
.globl vector216
vector216:
  pushl $0
  1026ff:	6a 00                	push   $0x0
  pushl $216
  102701:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102706:	e9 42 f7 ff ff       	jmp    101e4d <__alltraps>

0010270b <vector217>:
.globl vector217
vector217:
  pushl $0
  10270b:	6a 00                	push   $0x0
  pushl $217
  10270d:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  102712:	e9 36 f7 ff ff       	jmp    101e4d <__alltraps>

00102717 <vector218>:
.globl vector218
vector218:
  pushl $0
  102717:	6a 00                	push   $0x0
  pushl $218
  102719:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  10271e:	e9 2a f7 ff ff       	jmp    101e4d <__alltraps>

00102723 <vector219>:
.globl vector219
vector219:
  pushl $0
  102723:	6a 00                	push   $0x0
  pushl $219
  102725:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  10272a:	e9 1e f7 ff ff       	jmp    101e4d <__alltraps>

0010272f <vector220>:
.globl vector220
vector220:
  pushl $0
  10272f:	6a 00                	push   $0x0
  pushl $220
  102731:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  102736:	e9 12 f7 ff ff       	jmp    101e4d <__alltraps>

0010273b <vector221>:
.globl vector221
vector221:
  pushl $0
  10273b:	6a 00                	push   $0x0
  pushl $221
  10273d:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  102742:	e9 06 f7 ff ff       	jmp    101e4d <__alltraps>

00102747 <vector222>:
.globl vector222
vector222:
  pushl $0
  102747:	6a 00                	push   $0x0
  pushl $222
  102749:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  10274e:	e9 fa f6 ff ff       	jmp    101e4d <__alltraps>

00102753 <vector223>:
.globl vector223
vector223:
  pushl $0
  102753:	6a 00                	push   $0x0
  pushl $223
  102755:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  10275a:	e9 ee f6 ff ff       	jmp    101e4d <__alltraps>

0010275f <vector224>:
.globl vector224
vector224:
  pushl $0
  10275f:	6a 00                	push   $0x0
  pushl $224
  102761:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  102766:	e9 e2 f6 ff ff       	jmp    101e4d <__alltraps>

0010276b <vector225>:
.globl vector225
vector225:
  pushl $0
  10276b:	6a 00                	push   $0x0
  pushl $225
  10276d:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  102772:	e9 d6 f6 ff ff       	jmp    101e4d <__alltraps>

00102777 <vector226>:
.globl vector226
vector226:
  pushl $0
  102777:	6a 00                	push   $0x0
  pushl $226
  102779:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  10277e:	e9 ca f6 ff ff       	jmp    101e4d <__alltraps>

00102783 <vector227>:
.globl vector227
vector227:
  pushl $0
  102783:	6a 00                	push   $0x0
  pushl $227
  102785:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  10278a:	e9 be f6 ff ff       	jmp    101e4d <__alltraps>

0010278f <vector228>:
.globl vector228
vector228:
  pushl $0
  10278f:	6a 00                	push   $0x0
  pushl $228
  102791:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  102796:	e9 b2 f6 ff ff       	jmp    101e4d <__alltraps>

0010279b <vector229>:
.globl vector229
vector229:
  pushl $0
  10279b:	6a 00                	push   $0x0
  pushl $229
  10279d:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1027a2:	e9 a6 f6 ff ff       	jmp    101e4d <__alltraps>

001027a7 <vector230>:
.globl vector230
vector230:
  pushl $0
  1027a7:	6a 00                	push   $0x0
  pushl $230
  1027a9:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  1027ae:	e9 9a f6 ff ff       	jmp    101e4d <__alltraps>

001027b3 <vector231>:
.globl vector231
vector231:
  pushl $0
  1027b3:	6a 00                	push   $0x0
  pushl $231
  1027b5:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  1027ba:	e9 8e f6 ff ff       	jmp    101e4d <__alltraps>

001027bf <vector232>:
.globl vector232
vector232:
  pushl $0
  1027bf:	6a 00                	push   $0x0
  pushl $232
  1027c1:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  1027c6:	e9 82 f6 ff ff       	jmp    101e4d <__alltraps>

001027cb <vector233>:
.globl vector233
vector233:
  pushl $0
  1027cb:	6a 00                	push   $0x0
  pushl $233
  1027cd:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  1027d2:	e9 76 f6 ff ff       	jmp    101e4d <__alltraps>

001027d7 <vector234>:
.globl vector234
vector234:
  pushl $0
  1027d7:	6a 00                	push   $0x0
  pushl $234
  1027d9:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  1027de:	e9 6a f6 ff ff       	jmp    101e4d <__alltraps>

001027e3 <vector235>:
.globl vector235
vector235:
  pushl $0
  1027e3:	6a 00                	push   $0x0
  pushl $235
  1027e5:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  1027ea:	e9 5e f6 ff ff       	jmp    101e4d <__alltraps>

001027ef <vector236>:
.globl vector236
vector236:
  pushl $0
  1027ef:	6a 00                	push   $0x0
  pushl $236
  1027f1:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  1027f6:	e9 52 f6 ff ff       	jmp    101e4d <__alltraps>

001027fb <vector237>:
.globl vector237
vector237:
  pushl $0
  1027fb:	6a 00                	push   $0x0
  pushl $237
  1027fd:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  102802:	e9 46 f6 ff ff       	jmp    101e4d <__alltraps>

00102807 <vector238>:
.globl vector238
vector238:
  pushl $0
  102807:	6a 00                	push   $0x0
  pushl $238
  102809:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  10280e:	e9 3a f6 ff ff       	jmp    101e4d <__alltraps>

00102813 <vector239>:
.globl vector239
vector239:
  pushl $0
  102813:	6a 00                	push   $0x0
  pushl $239
  102815:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  10281a:	e9 2e f6 ff ff       	jmp    101e4d <__alltraps>

0010281f <vector240>:
.globl vector240
vector240:
  pushl $0
  10281f:	6a 00                	push   $0x0
  pushl $240
  102821:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102826:	e9 22 f6 ff ff       	jmp    101e4d <__alltraps>

0010282b <vector241>:
.globl vector241
vector241:
  pushl $0
  10282b:	6a 00                	push   $0x0
  pushl $241
  10282d:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  102832:	e9 16 f6 ff ff       	jmp    101e4d <__alltraps>

00102837 <vector242>:
.globl vector242
vector242:
  pushl $0
  102837:	6a 00                	push   $0x0
  pushl $242
  102839:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  10283e:	e9 0a f6 ff ff       	jmp    101e4d <__alltraps>

00102843 <vector243>:
.globl vector243
vector243:
  pushl $0
  102843:	6a 00                	push   $0x0
  pushl $243
  102845:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  10284a:	e9 fe f5 ff ff       	jmp    101e4d <__alltraps>

0010284f <vector244>:
.globl vector244
vector244:
  pushl $0
  10284f:	6a 00                	push   $0x0
  pushl $244
  102851:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  102856:	e9 f2 f5 ff ff       	jmp    101e4d <__alltraps>

0010285b <vector245>:
.globl vector245
vector245:
  pushl $0
  10285b:	6a 00                	push   $0x0
  pushl $245
  10285d:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  102862:	e9 e6 f5 ff ff       	jmp    101e4d <__alltraps>

00102867 <vector246>:
.globl vector246
vector246:
  pushl $0
  102867:	6a 00                	push   $0x0
  pushl $246
  102869:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  10286e:	e9 da f5 ff ff       	jmp    101e4d <__alltraps>

00102873 <vector247>:
.globl vector247
vector247:
  pushl $0
  102873:	6a 00                	push   $0x0
  pushl $247
  102875:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  10287a:	e9 ce f5 ff ff       	jmp    101e4d <__alltraps>

0010287f <vector248>:
.globl vector248
vector248:
  pushl $0
  10287f:	6a 00                	push   $0x0
  pushl $248
  102881:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  102886:	e9 c2 f5 ff ff       	jmp    101e4d <__alltraps>

0010288b <vector249>:
.globl vector249
vector249:
  pushl $0
  10288b:	6a 00                	push   $0x0
  pushl $249
  10288d:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  102892:	e9 b6 f5 ff ff       	jmp    101e4d <__alltraps>

00102897 <vector250>:
.globl vector250
vector250:
  pushl $0
  102897:	6a 00                	push   $0x0
  pushl $250
  102899:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  10289e:	e9 aa f5 ff ff       	jmp    101e4d <__alltraps>

001028a3 <vector251>:
.globl vector251
vector251:
  pushl $0
  1028a3:	6a 00                	push   $0x0
  pushl $251
  1028a5:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  1028aa:	e9 9e f5 ff ff       	jmp    101e4d <__alltraps>

001028af <vector252>:
.globl vector252
vector252:
  pushl $0
  1028af:	6a 00                	push   $0x0
  pushl $252
  1028b1:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  1028b6:	e9 92 f5 ff ff       	jmp    101e4d <__alltraps>

001028bb <vector253>:
.globl vector253
vector253:
  pushl $0
  1028bb:	6a 00                	push   $0x0
  pushl $253
  1028bd:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  1028c2:	e9 86 f5 ff ff       	jmp    101e4d <__alltraps>

001028c7 <vector254>:
.globl vector254
vector254:
  pushl $0
  1028c7:	6a 00                	push   $0x0
  pushl $254
  1028c9:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  1028ce:	e9 7a f5 ff ff       	jmp    101e4d <__alltraps>

001028d3 <vector255>:
.globl vector255
vector255:
  pushl $0
  1028d3:	6a 00                	push   $0x0
  pushl $255
  1028d5:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  1028da:	e9 6e f5 ff ff       	jmp    101e4d <__alltraps>

001028df <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  1028df:	55                   	push   %ebp
  1028e0:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  1028e2:	8b 45 08             	mov    0x8(%ebp),%eax
  1028e5:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  1028e8:	b8 23 00 00 00       	mov    $0x23,%eax
  1028ed:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  1028ef:	b8 23 00 00 00       	mov    $0x23,%eax
  1028f4:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  1028f6:	b8 10 00 00 00       	mov    $0x10,%eax
  1028fb:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  1028fd:	b8 10 00 00 00       	mov    $0x10,%eax
  102902:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102904:	b8 10 00 00 00       	mov    $0x10,%eax
  102909:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  10290b:	ea 12 29 10 00 08 00 	ljmp   $0x8,$0x102912
}
  102912:	90                   	nop
  102913:	5d                   	pop    %ebp
  102914:	c3                   	ret    

00102915 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102915:	55                   	push   %ebp
  102916:	89 e5                	mov    %esp,%ebp
  102918:	83 ec 10             	sub    $0x10,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  10291b:	b8 20 09 11 00       	mov    $0x110920,%eax
  102920:	05 00 04 00 00       	add    $0x400,%eax
  102925:	a3 24 0d 11 00       	mov    %eax,0x110d24
    ts.ts_ss0 = KERNEL_DS;
  10292a:	66 c7 05 28 0d 11 00 	movw   $0x10,0x110d28
  102931:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  102933:	66 c7 05 08 fa 10 00 	movw   $0x68,0x10fa08
  10293a:	68 00 
  10293c:	b8 20 0d 11 00       	mov    $0x110d20,%eax
  102941:	66 a3 0a fa 10 00    	mov    %ax,0x10fa0a
  102947:	b8 20 0d 11 00       	mov    $0x110d20,%eax
  10294c:	c1 e8 10             	shr    $0x10,%eax
  10294f:	a2 0c fa 10 00       	mov    %al,0x10fa0c
  102954:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  10295b:	83 e0 f0             	and    $0xfffffff0,%eax
  10295e:	83 c8 09             	or     $0x9,%eax
  102961:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102966:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  10296d:	83 c8 10             	or     $0x10,%eax
  102970:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102975:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  10297c:	83 e0 9f             	and    $0xffffff9f,%eax
  10297f:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102984:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  10298b:	83 c8 80             	or     $0xffffff80,%eax
  10298e:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102993:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  10299a:	83 e0 f0             	and    $0xfffffff0,%eax
  10299d:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  1029a2:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  1029a9:	83 e0 ef             	and    $0xffffffef,%eax
  1029ac:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  1029b1:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  1029b8:	83 e0 df             	and    $0xffffffdf,%eax
  1029bb:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  1029c0:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  1029c7:	83 c8 40             	or     $0x40,%eax
  1029ca:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  1029cf:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  1029d6:	83 e0 7f             	and    $0x7f,%eax
  1029d9:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  1029de:	b8 20 0d 11 00       	mov    $0x110d20,%eax
  1029e3:	c1 e8 18             	shr    $0x18,%eax
  1029e6:	a2 0f fa 10 00       	mov    %al,0x10fa0f
    gdt[SEG_TSS].sd_s = 0;
  1029eb:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1029f2:	83 e0 ef             	and    $0xffffffef,%eax
  1029f5:	a2 0d fa 10 00       	mov    %al,0x10fa0d

    // reload all segment registers
    lgdt(&gdt_pd);
  1029fa:	68 10 fa 10 00       	push   $0x10fa10
  1029ff:	e8 db fe ff ff       	call   1028df <lgdt>
  102a04:	83 c4 04             	add    $0x4,%esp
  102a07:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102a0d:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102a11:	0f 00 d8             	ltr    %ax
}
  102a14:	90                   	nop

    // load the TSS
    ltr(GD_TSS);
}
  102a15:	90                   	nop
  102a16:	c9                   	leave  
  102a17:	c3                   	ret    

00102a18 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102a18:	55                   	push   %ebp
  102a19:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102a1b:	e8 f5 fe ff ff       	call   102915 <gdt_init>
}
  102a20:	90                   	nop
  102a21:	5d                   	pop    %ebp
  102a22:	c3                   	ret    

00102a23 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102a23:	55                   	push   %ebp
  102a24:	89 e5                	mov    %esp,%ebp
  102a26:	83 ec 38             	sub    $0x38,%esp
  102a29:	8b 45 10             	mov    0x10(%ebp),%eax
  102a2c:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102a2f:	8b 45 14             	mov    0x14(%ebp),%eax
  102a32:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102a35:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102a38:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102a3b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102a3e:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102a41:	8b 45 18             	mov    0x18(%ebp),%eax
  102a44:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102a47:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102a4a:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102a4d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102a50:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102a53:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102a56:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102a59:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102a5d:	74 1c                	je     102a7b <printnum+0x58>
  102a5f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102a62:	ba 00 00 00 00       	mov    $0x0,%edx
  102a67:	f7 75 e4             	divl   -0x1c(%ebp)
  102a6a:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102a6d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102a70:	ba 00 00 00 00       	mov    $0x0,%edx
  102a75:	f7 75 e4             	divl   -0x1c(%ebp)
  102a78:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102a7b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102a7e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102a81:	f7 75 e4             	divl   -0x1c(%ebp)
  102a84:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102a87:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102a8a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102a8d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102a90:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102a93:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102a96:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102a99:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102a9c:	8b 45 18             	mov    0x18(%ebp),%eax
  102a9f:	ba 00 00 00 00       	mov    $0x0,%edx
  102aa4:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  102aa7:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  102aaa:	19 d1                	sbb    %edx,%ecx
  102aac:	72 37                	jb     102ae5 <printnum+0xc2>
        printnum(putch, putdat, result, base, width - 1, padc);
  102aae:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102ab1:	83 e8 01             	sub    $0x1,%eax
  102ab4:	83 ec 04             	sub    $0x4,%esp
  102ab7:	ff 75 20             	push   0x20(%ebp)
  102aba:	50                   	push   %eax
  102abb:	ff 75 18             	push   0x18(%ebp)
  102abe:	ff 75 ec             	push   -0x14(%ebp)
  102ac1:	ff 75 e8             	push   -0x18(%ebp)
  102ac4:	ff 75 0c             	push   0xc(%ebp)
  102ac7:	ff 75 08             	push   0x8(%ebp)
  102aca:	e8 54 ff ff ff       	call   102a23 <printnum>
  102acf:	83 c4 20             	add    $0x20,%esp
  102ad2:	eb 1b                	jmp    102aef <printnum+0xcc>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102ad4:	83 ec 08             	sub    $0x8,%esp
  102ad7:	ff 75 0c             	push   0xc(%ebp)
  102ada:	ff 75 20             	push   0x20(%ebp)
  102add:	8b 45 08             	mov    0x8(%ebp),%eax
  102ae0:	ff d0                	call   *%eax
  102ae2:	83 c4 10             	add    $0x10,%esp
        while (-- width > 0)
  102ae5:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  102ae9:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102aed:	7f e5                	jg     102ad4 <printnum+0xb1>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102aef:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102af2:	05 b0 3c 10 00       	add    $0x103cb0,%eax
  102af7:	0f b6 00             	movzbl (%eax),%eax
  102afa:	0f be c0             	movsbl %al,%eax
  102afd:	83 ec 08             	sub    $0x8,%esp
  102b00:	ff 75 0c             	push   0xc(%ebp)
  102b03:	50                   	push   %eax
  102b04:	8b 45 08             	mov    0x8(%ebp),%eax
  102b07:	ff d0                	call   *%eax
  102b09:	83 c4 10             	add    $0x10,%esp
}
  102b0c:	90                   	nop
  102b0d:	c9                   	leave  
  102b0e:	c3                   	ret    

00102b0f <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102b0f:	55                   	push   %ebp
  102b10:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102b12:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102b16:	7e 14                	jle    102b2c <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102b18:	8b 45 08             	mov    0x8(%ebp),%eax
  102b1b:	8b 00                	mov    (%eax),%eax
  102b1d:	8d 48 08             	lea    0x8(%eax),%ecx
  102b20:	8b 55 08             	mov    0x8(%ebp),%edx
  102b23:	89 0a                	mov    %ecx,(%edx)
  102b25:	8b 50 04             	mov    0x4(%eax),%edx
  102b28:	8b 00                	mov    (%eax),%eax
  102b2a:	eb 30                	jmp    102b5c <getuint+0x4d>
    }
    else if (lflag) {
  102b2c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102b30:	74 16                	je     102b48 <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102b32:	8b 45 08             	mov    0x8(%ebp),%eax
  102b35:	8b 00                	mov    (%eax),%eax
  102b37:	8d 48 04             	lea    0x4(%eax),%ecx
  102b3a:	8b 55 08             	mov    0x8(%ebp),%edx
  102b3d:	89 0a                	mov    %ecx,(%edx)
  102b3f:	8b 00                	mov    (%eax),%eax
  102b41:	ba 00 00 00 00       	mov    $0x0,%edx
  102b46:	eb 14                	jmp    102b5c <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102b48:	8b 45 08             	mov    0x8(%ebp),%eax
  102b4b:	8b 00                	mov    (%eax),%eax
  102b4d:	8d 48 04             	lea    0x4(%eax),%ecx
  102b50:	8b 55 08             	mov    0x8(%ebp),%edx
  102b53:	89 0a                	mov    %ecx,(%edx)
  102b55:	8b 00                	mov    (%eax),%eax
  102b57:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102b5c:	5d                   	pop    %ebp
  102b5d:	c3                   	ret    

00102b5e <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102b5e:	55                   	push   %ebp
  102b5f:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102b61:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102b65:	7e 14                	jle    102b7b <getint+0x1d>
        return va_arg(*ap, long long);
  102b67:	8b 45 08             	mov    0x8(%ebp),%eax
  102b6a:	8b 00                	mov    (%eax),%eax
  102b6c:	8d 48 08             	lea    0x8(%eax),%ecx
  102b6f:	8b 55 08             	mov    0x8(%ebp),%edx
  102b72:	89 0a                	mov    %ecx,(%edx)
  102b74:	8b 50 04             	mov    0x4(%eax),%edx
  102b77:	8b 00                	mov    (%eax),%eax
  102b79:	eb 28                	jmp    102ba3 <getint+0x45>
    }
    else if (lflag) {
  102b7b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102b7f:	74 12                	je     102b93 <getint+0x35>
        return va_arg(*ap, long);
  102b81:	8b 45 08             	mov    0x8(%ebp),%eax
  102b84:	8b 00                	mov    (%eax),%eax
  102b86:	8d 48 04             	lea    0x4(%eax),%ecx
  102b89:	8b 55 08             	mov    0x8(%ebp),%edx
  102b8c:	89 0a                	mov    %ecx,(%edx)
  102b8e:	8b 00                	mov    (%eax),%eax
  102b90:	99                   	cltd   
  102b91:	eb 10                	jmp    102ba3 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  102b93:	8b 45 08             	mov    0x8(%ebp),%eax
  102b96:	8b 00                	mov    (%eax),%eax
  102b98:	8d 48 04             	lea    0x4(%eax),%ecx
  102b9b:	8b 55 08             	mov    0x8(%ebp),%edx
  102b9e:	89 0a                	mov    %ecx,(%edx)
  102ba0:	8b 00                	mov    (%eax),%eax
  102ba2:	99                   	cltd   
    }
}
  102ba3:	5d                   	pop    %ebp
  102ba4:	c3                   	ret    

00102ba5 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102ba5:	55                   	push   %ebp
  102ba6:	89 e5                	mov    %esp,%ebp
  102ba8:	83 ec 18             	sub    $0x18,%esp
    va_list ap;

    va_start(ap, fmt);
  102bab:	8d 45 14             	lea    0x14(%ebp),%eax
  102bae:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102bb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102bb4:	50                   	push   %eax
  102bb5:	ff 75 10             	push   0x10(%ebp)
  102bb8:	ff 75 0c             	push   0xc(%ebp)
  102bbb:	ff 75 08             	push   0x8(%ebp)
  102bbe:	e8 06 00 00 00       	call   102bc9 <vprintfmt>
  102bc3:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  102bc6:	90                   	nop
  102bc7:	c9                   	leave  
  102bc8:	c3                   	ret    

00102bc9 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102bc9:	55                   	push   %ebp
  102bca:	89 e5                	mov    %esp,%ebp
  102bcc:	56                   	push   %esi
  102bcd:	53                   	push   %ebx
  102bce:	83 ec 20             	sub    $0x20,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102bd1:	eb 17                	jmp    102bea <vprintfmt+0x21>
            if (ch == '\0') {
  102bd3:	85 db                	test   %ebx,%ebx
  102bd5:	0f 84 8e 03 00 00    	je     102f69 <vprintfmt+0x3a0>
                return;
            }
            putch(ch, putdat);
  102bdb:	83 ec 08             	sub    $0x8,%esp
  102bde:	ff 75 0c             	push   0xc(%ebp)
  102be1:	53                   	push   %ebx
  102be2:	8b 45 08             	mov    0x8(%ebp),%eax
  102be5:	ff d0                	call   *%eax
  102be7:	83 c4 10             	add    $0x10,%esp
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102bea:	8b 45 10             	mov    0x10(%ebp),%eax
  102bed:	8d 50 01             	lea    0x1(%eax),%edx
  102bf0:	89 55 10             	mov    %edx,0x10(%ebp)
  102bf3:	0f b6 00             	movzbl (%eax),%eax
  102bf6:	0f b6 d8             	movzbl %al,%ebx
  102bf9:	83 fb 25             	cmp    $0x25,%ebx
  102bfc:	75 d5                	jne    102bd3 <vprintfmt+0xa>
        }

        // Process a %-escape sequence
        char padc = ' ';
  102bfe:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102c02:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102c09:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102c0c:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102c0f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102c16:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102c19:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102c1c:	8b 45 10             	mov    0x10(%ebp),%eax
  102c1f:	8d 50 01             	lea    0x1(%eax),%edx
  102c22:	89 55 10             	mov    %edx,0x10(%ebp)
  102c25:	0f b6 00             	movzbl (%eax),%eax
  102c28:	0f b6 d8             	movzbl %al,%ebx
  102c2b:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102c2e:	83 f8 55             	cmp    $0x55,%eax
  102c31:	0f 87 05 03 00 00    	ja     102f3c <vprintfmt+0x373>
  102c37:	8b 04 85 d4 3c 10 00 	mov    0x103cd4(,%eax,4),%eax
  102c3e:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102c40:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102c44:	eb d6                	jmp    102c1c <vprintfmt+0x53>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102c46:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102c4a:	eb d0                	jmp    102c1c <vprintfmt+0x53>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102c4c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102c53:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102c56:	89 d0                	mov    %edx,%eax
  102c58:	c1 e0 02             	shl    $0x2,%eax
  102c5b:	01 d0                	add    %edx,%eax
  102c5d:	01 c0                	add    %eax,%eax
  102c5f:	01 d8                	add    %ebx,%eax
  102c61:	83 e8 30             	sub    $0x30,%eax
  102c64:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102c67:	8b 45 10             	mov    0x10(%ebp),%eax
  102c6a:	0f b6 00             	movzbl (%eax),%eax
  102c6d:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102c70:	83 fb 2f             	cmp    $0x2f,%ebx
  102c73:	7e 39                	jle    102cae <vprintfmt+0xe5>
  102c75:	83 fb 39             	cmp    $0x39,%ebx
  102c78:	7f 34                	jg     102cae <vprintfmt+0xe5>
            for (precision = 0; ; ++ fmt) {
  102c7a:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
  102c7e:	eb d3                	jmp    102c53 <vprintfmt+0x8a>
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  102c80:	8b 45 14             	mov    0x14(%ebp),%eax
  102c83:	8d 50 04             	lea    0x4(%eax),%edx
  102c86:	89 55 14             	mov    %edx,0x14(%ebp)
  102c89:	8b 00                	mov    (%eax),%eax
  102c8b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102c8e:	eb 1f                	jmp    102caf <vprintfmt+0xe6>

        case '.':
            if (width < 0)
  102c90:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102c94:	79 86                	jns    102c1c <vprintfmt+0x53>
                width = 0;
  102c96:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102c9d:	e9 7a ff ff ff       	jmp    102c1c <vprintfmt+0x53>

        case '#':
            altflag = 1;
  102ca2:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102ca9:	e9 6e ff ff ff       	jmp    102c1c <vprintfmt+0x53>
            goto process_precision;
  102cae:	90                   	nop

        process_precision:
            if (width < 0)
  102caf:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102cb3:	0f 89 63 ff ff ff    	jns    102c1c <vprintfmt+0x53>
                width = precision, precision = -1;
  102cb9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102cbc:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102cbf:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102cc6:	e9 51 ff ff ff       	jmp    102c1c <vprintfmt+0x53>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102ccb:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  102ccf:	e9 48 ff ff ff       	jmp    102c1c <vprintfmt+0x53>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102cd4:	8b 45 14             	mov    0x14(%ebp),%eax
  102cd7:	8d 50 04             	lea    0x4(%eax),%edx
  102cda:	89 55 14             	mov    %edx,0x14(%ebp)
  102cdd:	8b 00                	mov    (%eax),%eax
  102cdf:	83 ec 08             	sub    $0x8,%esp
  102ce2:	ff 75 0c             	push   0xc(%ebp)
  102ce5:	50                   	push   %eax
  102ce6:	8b 45 08             	mov    0x8(%ebp),%eax
  102ce9:	ff d0                	call   *%eax
  102ceb:	83 c4 10             	add    $0x10,%esp
            break;
  102cee:	e9 71 02 00 00       	jmp    102f64 <vprintfmt+0x39b>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102cf3:	8b 45 14             	mov    0x14(%ebp),%eax
  102cf6:	8d 50 04             	lea    0x4(%eax),%edx
  102cf9:	89 55 14             	mov    %edx,0x14(%ebp)
  102cfc:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102cfe:	85 db                	test   %ebx,%ebx
  102d00:	79 02                	jns    102d04 <vprintfmt+0x13b>
                err = -err;
  102d02:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102d04:	83 fb 06             	cmp    $0x6,%ebx
  102d07:	7f 0b                	jg     102d14 <vprintfmt+0x14b>
  102d09:	8b 34 9d 94 3c 10 00 	mov    0x103c94(,%ebx,4),%esi
  102d10:	85 f6                	test   %esi,%esi
  102d12:	75 19                	jne    102d2d <vprintfmt+0x164>
                printfmt(putch, putdat, "error %d", err);
  102d14:	53                   	push   %ebx
  102d15:	68 c1 3c 10 00       	push   $0x103cc1
  102d1a:	ff 75 0c             	push   0xc(%ebp)
  102d1d:	ff 75 08             	push   0x8(%ebp)
  102d20:	e8 80 fe ff ff       	call   102ba5 <printfmt>
  102d25:	83 c4 10             	add    $0x10,%esp
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102d28:	e9 37 02 00 00       	jmp    102f64 <vprintfmt+0x39b>
                printfmt(putch, putdat, "%s", p);
  102d2d:	56                   	push   %esi
  102d2e:	68 ca 3c 10 00       	push   $0x103cca
  102d33:	ff 75 0c             	push   0xc(%ebp)
  102d36:	ff 75 08             	push   0x8(%ebp)
  102d39:	e8 67 fe ff ff       	call   102ba5 <printfmt>
  102d3e:	83 c4 10             	add    $0x10,%esp
            break;
  102d41:	e9 1e 02 00 00       	jmp    102f64 <vprintfmt+0x39b>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102d46:	8b 45 14             	mov    0x14(%ebp),%eax
  102d49:	8d 50 04             	lea    0x4(%eax),%edx
  102d4c:	89 55 14             	mov    %edx,0x14(%ebp)
  102d4f:	8b 30                	mov    (%eax),%esi
  102d51:	85 f6                	test   %esi,%esi
  102d53:	75 05                	jne    102d5a <vprintfmt+0x191>
                p = "(null)";
  102d55:	be cd 3c 10 00       	mov    $0x103ccd,%esi
            }
            if (width > 0 && padc != '-') {
  102d5a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102d5e:	7e 76                	jle    102dd6 <vprintfmt+0x20d>
  102d60:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102d64:	74 70                	je     102dd6 <vprintfmt+0x20d>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102d66:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102d69:	83 ec 08             	sub    $0x8,%esp
  102d6c:	50                   	push   %eax
  102d6d:	56                   	push   %esi
  102d6e:	e8 df 02 00 00       	call   103052 <strnlen>
  102d73:	83 c4 10             	add    $0x10,%esp
  102d76:	89 c2                	mov    %eax,%edx
  102d78:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102d7b:	29 d0                	sub    %edx,%eax
  102d7d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102d80:	eb 17                	jmp    102d99 <vprintfmt+0x1d0>
                    putch(padc, putdat);
  102d82:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102d86:	83 ec 08             	sub    $0x8,%esp
  102d89:	ff 75 0c             	push   0xc(%ebp)
  102d8c:	50                   	push   %eax
  102d8d:	8b 45 08             	mov    0x8(%ebp),%eax
  102d90:	ff d0                	call   *%eax
  102d92:	83 c4 10             	add    $0x10,%esp
                for (width -= strnlen(p, precision); width > 0; width --) {
  102d95:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102d99:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102d9d:	7f e3                	jg     102d82 <vprintfmt+0x1b9>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102d9f:	eb 35                	jmp    102dd6 <vprintfmt+0x20d>
                if (altflag && (ch < ' ' || ch > '~')) {
  102da1:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102da5:	74 1c                	je     102dc3 <vprintfmt+0x1fa>
  102da7:	83 fb 1f             	cmp    $0x1f,%ebx
  102daa:	7e 05                	jle    102db1 <vprintfmt+0x1e8>
  102dac:	83 fb 7e             	cmp    $0x7e,%ebx
  102daf:	7e 12                	jle    102dc3 <vprintfmt+0x1fa>
                    putch('?', putdat);
  102db1:	83 ec 08             	sub    $0x8,%esp
  102db4:	ff 75 0c             	push   0xc(%ebp)
  102db7:	6a 3f                	push   $0x3f
  102db9:	8b 45 08             	mov    0x8(%ebp),%eax
  102dbc:	ff d0                	call   *%eax
  102dbe:	83 c4 10             	add    $0x10,%esp
  102dc1:	eb 0f                	jmp    102dd2 <vprintfmt+0x209>
                }
                else {
                    putch(ch, putdat);
  102dc3:	83 ec 08             	sub    $0x8,%esp
  102dc6:	ff 75 0c             	push   0xc(%ebp)
  102dc9:	53                   	push   %ebx
  102dca:	8b 45 08             	mov    0x8(%ebp),%eax
  102dcd:	ff d0                	call   *%eax
  102dcf:	83 c4 10             	add    $0x10,%esp
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102dd2:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102dd6:	89 f0                	mov    %esi,%eax
  102dd8:	8d 70 01             	lea    0x1(%eax),%esi
  102ddb:	0f b6 00             	movzbl (%eax),%eax
  102dde:	0f be d8             	movsbl %al,%ebx
  102de1:	85 db                	test   %ebx,%ebx
  102de3:	74 26                	je     102e0b <vprintfmt+0x242>
  102de5:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102de9:	78 b6                	js     102da1 <vprintfmt+0x1d8>
  102deb:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  102def:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102df3:	79 ac                	jns    102da1 <vprintfmt+0x1d8>
                }
            }
            for (; width > 0; width --) {
  102df5:	eb 14                	jmp    102e0b <vprintfmt+0x242>
                putch(' ', putdat);
  102df7:	83 ec 08             	sub    $0x8,%esp
  102dfa:	ff 75 0c             	push   0xc(%ebp)
  102dfd:	6a 20                	push   $0x20
  102dff:	8b 45 08             	mov    0x8(%ebp),%eax
  102e02:	ff d0                	call   *%eax
  102e04:	83 c4 10             	add    $0x10,%esp
            for (; width > 0; width --) {
  102e07:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102e0b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102e0f:	7f e6                	jg     102df7 <vprintfmt+0x22e>
            }
            break;
  102e11:	e9 4e 01 00 00       	jmp    102f64 <vprintfmt+0x39b>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  102e16:	83 ec 08             	sub    $0x8,%esp
  102e19:	ff 75 e0             	push   -0x20(%ebp)
  102e1c:	8d 45 14             	lea    0x14(%ebp),%eax
  102e1f:	50                   	push   %eax
  102e20:	e8 39 fd ff ff       	call   102b5e <getint>
  102e25:	83 c4 10             	add    $0x10,%esp
  102e28:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e2b:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  102e2e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e31:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102e34:	85 d2                	test   %edx,%edx
  102e36:	79 23                	jns    102e5b <vprintfmt+0x292>
                putch('-', putdat);
  102e38:	83 ec 08             	sub    $0x8,%esp
  102e3b:	ff 75 0c             	push   0xc(%ebp)
  102e3e:	6a 2d                	push   $0x2d
  102e40:	8b 45 08             	mov    0x8(%ebp),%eax
  102e43:	ff d0                	call   *%eax
  102e45:	83 c4 10             	add    $0x10,%esp
                num = -(long long)num;
  102e48:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e4b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102e4e:	f7 d8                	neg    %eax
  102e50:	83 d2 00             	adc    $0x0,%edx
  102e53:	f7 da                	neg    %edx
  102e55:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e58:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  102e5b:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102e62:	e9 9f 00 00 00       	jmp    102f06 <vprintfmt+0x33d>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  102e67:	83 ec 08             	sub    $0x8,%esp
  102e6a:	ff 75 e0             	push   -0x20(%ebp)
  102e6d:	8d 45 14             	lea    0x14(%ebp),%eax
  102e70:	50                   	push   %eax
  102e71:	e8 99 fc ff ff       	call   102b0f <getuint>
  102e76:	83 c4 10             	add    $0x10,%esp
  102e79:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e7c:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  102e7f:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102e86:	eb 7e                	jmp    102f06 <vprintfmt+0x33d>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  102e88:	83 ec 08             	sub    $0x8,%esp
  102e8b:	ff 75 e0             	push   -0x20(%ebp)
  102e8e:	8d 45 14             	lea    0x14(%ebp),%eax
  102e91:	50                   	push   %eax
  102e92:	e8 78 fc ff ff       	call   102b0f <getuint>
  102e97:	83 c4 10             	add    $0x10,%esp
  102e9a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e9d:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  102ea0:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  102ea7:	eb 5d                	jmp    102f06 <vprintfmt+0x33d>

        // pointer
        case 'p':
            putch('0', putdat);
  102ea9:	83 ec 08             	sub    $0x8,%esp
  102eac:	ff 75 0c             	push   0xc(%ebp)
  102eaf:	6a 30                	push   $0x30
  102eb1:	8b 45 08             	mov    0x8(%ebp),%eax
  102eb4:	ff d0                	call   *%eax
  102eb6:	83 c4 10             	add    $0x10,%esp
            putch('x', putdat);
  102eb9:	83 ec 08             	sub    $0x8,%esp
  102ebc:	ff 75 0c             	push   0xc(%ebp)
  102ebf:	6a 78                	push   $0x78
  102ec1:	8b 45 08             	mov    0x8(%ebp),%eax
  102ec4:	ff d0                	call   *%eax
  102ec6:	83 c4 10             	add    $0x10,%esp
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  102ec9:	8b 45 14             	mov    0x14(%ebp),%eax
  102ecc:	8d 50 04             	lea    0x4(%eax),%edx
  102ecf:	89 55 14             	mov    %edx,0x14(%ebp)
  102ed2:	8b 00                	mov    (%eax),%eax
  102ed4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102ed7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  102ede:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  102ee5:	eb 1f                	jmp    102f06 <vprintfmt+0x33d>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  102ee7:	83 ec 08             	sub    $0x8,%esp
  102eea:	ff 75 e0             	push   -0x20(%ebp)
  102eed:	8d 45 14             	lea    0x14(%ebp),%eax
  102ef0:	50                   	push   %eax
  102ef1:	e8 19 fc ff ff       	call   102b0f <getuint>
  102ef6:	83 c4 10             	add    $0x10,%esp
  102ef9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102efc:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  102eff:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  102f06:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  102f0a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102f0d:	83 ec 04             	sub    $0x4,%esp
  102f10:	52                   	push   %edx
  102f11:	ff 75 e8             	push   -0x18(%ebp)
  102f14:	50                   	push   %eax
  102f15:	ff 75 f4             	push   -0xc(%ebp)
  102f18:	ff 75 f0             	push   -0x10(%ebp)
  102f1b:	ff 75 0c             	push   0xc(%ebp)
  102f1e:	ff 75 08             	push   0x8(%ebp)
  102f21:	e8 fd fa ff ff       	call   102a23 <printnum>
  102f26:	83 c4 20             	add    $0x20,%esp
            break;
  102f29:	eb 39                	jmp    102f64 <vprintfmt+0x39b>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  102f2b:	83 ec 08             	sub    $0x8,%esp
  102f2e:	ff 75 0c             	push   0xc(%ebp)
  102f31:	53                   	push   %ebx
  102f32:	8b 45 08             	mov    0x8(%ebp),%eax
  102f35:	ff d0                	call   *%eax
  102f37:	83 c4 10             	add    $0x10,%esp
            break;
  102f3a:	eb 28                	jmp    102f64 <vprintfmt+0x39b>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  102f3c:	83 ec 08             	sub    $0x8,%esp
  102f3f:	ff 75 0c             	push   0xc(%ebp)
  102f42:	6a 25                	push   $0x25
  102f44:	8b 45 08             	mov    0x8(%ebp),%eax
  102f47:	ff d0                	call   *%eax
  102f49:	83 c4 10             	add    $0x10,%esp
            for (fmt --; fmt[-1] != '%'; fmt --)
  102f4c:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102f50:	eb 04                	jmp    102f56 <vprintfmt+0x38d>
  102f52:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102f56:	8b 45 10             	mov    0x10(%ebp),%eax
  102f59:	83 e8 01             	sub    $0x1,%eax
  102f5c:	0f b6 00             	movzbl (%eax),%eax
  102f5f:	3c 25                	cmp    $0x25,%al
  102f61:	75 ef                	jne    102f52 <vprintfmt+0x389>
                /* do nothing */;
            break;
  102f63:	90                   	nop
    while (1) {
  102f64:	e9 68 fc ff ff       	jmp    102bd1 <vprintfmt+0x8>
                return;
  102f69:	90                   	nop
        }
    }
}
  102f6a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  102f6d:	5b                   	pop    %ebx
  102f6e:	5e                   	pop    %esi
  102f6f:	5d                   	pop    %ebp
  102f70:	c3                   	ret    

00102f71 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  102f71:	55                   	push   %ebp
  102f72:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  102f74:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f77:	8b 40 08             	mov    0x8(%eax),%eax
  102f7a:	8d 50 01             	lea    0x1(%eax),%edx
  102f7d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f80:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  102f83:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f86:	8b 10                	mov    (%eax),%edx
  102f88:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f8b:	8b 40 04             	mov    0x4(%eax),%eax
  102f8e:	39 c2                	cmp    %eax,%edx
  102f90:	73 12                	jae    102fa4 <sprintputch+0x33>
        *b->buf ++ = ch;
  102f92:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f95:	8b 00                	mov    (%eax),%eax
  102f97:	8d 48 01             	lea    0x1(%eax),%ecx
  102f9a:	8b 55 0c             	mov    0xc(%ebp),%edx
  102f9d:	89 0a                	mov    %ecx,(%edx)
  102f9f:	8b 55 08             	mov    0x8(%ebp),%edx
  102fa2:	88 10                	mov    %dl,(%eax)
    }
}
  102fa4:	90                   	nop
  102fa5:	5d                   	pop    %ebp
  102fa6:	c3                   	ret    

00102fa7 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  102fa7:	55                   	push   %ebp
  102fa8:	89 e5                	mov    %esp,%ebp
  102faa:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  102fad:	8d 45 14             	lea    0x14(%ebp),%eax
  102fb0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  102fb3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fb6:	50                   	push   %eax
  102fb7:	ff 75 10             	push   0x10(%ebp)
  102fba:	ff 75 0c             	push   0xc(%ebp)
  102fbd:	ff 75 08             	push   0x8(%ebp)
  102fc0:	e8 0b 00 00 00       	call   102fd0 <vsnprintf>
  102fc5:	83 c4 10             	add    $0x10,%esp
  102fc8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  102fcb:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102fce:	c9                   	leave  
  102fcf:	c3                   	ret    

00102fd0 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  102fd0:	55                   	push   %ebp
  102fd1:	89 e5                	mov    %esp,%ebp
  102fd3:	83 ec 18             	sub    $0x18,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  102fd6:	8b 45 08             	mov    0x8(%ebp),%eax
  102fd9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102fdc:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fdf:	8d 50 ff             	lea    -0x1(%eax),%edx
  102fe2:	8b 45 08             	mov    0x8(%ebp),%eax
  102fe5:	01 d0                	add    %edx,%eax
  102fe7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102fea:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  102ff1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102ff5:	74 0a                	je     103001 <vsnprintf+0x31>
  102ff7:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102ffa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ffd:	39 c2                	cmp    %eax,%edx
  102fff:	76 07                	jbe    103008 <vsnprintf+0x38>
        return -E_INVAL;
  103001:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  103006:	eb 20                	jmp    103028 <vsnprintf+0x58>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  103008:	ff 75 14             	push   0x14(%ebp)
  10300b:	ff 75 10             	push   0x10(%ebp)
  10300e:	8d 45 ec             	lea    -0x14(%ebp),%eax
  103011:	50                   	push   %eax
  103012:	68 71 2f 10 00       	push   $0x102f71
  103017:	e8 ad fb ff ff       	call   102bc9 <vprintfmt>
  10301c:	83 c4 10             	add    $0x10,%esp
    // null terminate the buffer
    *b.buf = '\0';
  10301f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103022:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  103025:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103028:	c9                   	leave  
  103029:	c3                   	ret    

0010302a <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  10302a:	55                   	push   %ebp
  10302b:	89 e5                	mov    %esp,%ebp
  10302d:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  103030:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  103037:	eb 04                	jmp    10303d <strlen+0x13>
        cnt ++;
  103039:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    while (*s ++ != '\0') {
  10303d:	8b 45 08             	mov    0x8(%ebp),%eax
  103040:	8d 50 01             	lea    0x1(%eax),%edx
  103043:	89 55 08             	mov    %edx,0x8(%ebp)
  103046:	0f b6 00             	movzbl (%eax),%eax
  103049:	84 c0                	test   %al,%al
  10304b:	75 ec                	jne    103039 <strlen+0xf>
    }
    return cnt;
  10304d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  103050:	c9                   	leave  
  103051:	c3                   	ret    

00103052 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  103052:	55                   	push   %ebp
  103053:	89 e5                	mov    %esp,%ebp
  103055:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  103058:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  10305f:	eb 04                	jmp    103065 <strnlen+0x13>
        cnt ++;
  103061:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  103065:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103068:	3b 45 0c             	cmp    0xc(%ebp),%eax
  10306b:	73 10                	jae    10307d <strnlen+0x2b>
  10306d:	8b 45 08             	mov    0x8(%ebp),%eax
  103070:	8d 50 01             	lea    0x1(%eax),%edx
  103073:	89 55 08             	mov    %edx,0x8(%ebp)
  103076:	0f b6 00             	movzbl (%eax),%eax
  103079:	84 c0                	test   %al,%al
  10307b:	75 e4                	jne    103061 <strnlen+0xf>
    }
    return cnt;
  10307d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  103080:	c9                   	leave  
  103081:	c3                   	ret    

00103082 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  103082:	55                   	push   %ebp
  103083:	89 e5                	mov    %esp,%ebp
  103085:	57                   	push   %edi
  103086:	56                   	push   %esi
  103087:	83 ec 20             	sub    $0x20,%esp
  10308a:	8b 45 08             	mov    0x8(%ebp),%eax
  10308d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103090:	8b 45 0c             	mov    0xc(%ebp),%eax
  103093:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  103096:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103099:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10309c:	89 d1                	mov    %edx,%ecx
  10309e:	89 c2                	mov    %eax,%edx
  1030a0:	89 ce                	mov    %ecx,%esi
  1030a2:	89 d7                	mov    %edx,%edi
  1030a4:	ac                   	lods   %ds:(%esi),%al
  1030a5:	aa                   	stos   %al,%es:(%edi)
  1030a6:	84 c0                	test   %al,%al
  1030a8:	75 fa                	jne    1030a4 <strcpy+0x22>
  1030aa:	89 fa                	mov    %edi,%edx
  1030ac:	89 f1                	mov    %esi,%ecx
  1030ae:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  1030b1:	89 55 e8             	mov    %edx,-0x18(%ebp)
  1030b4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  1030b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  1030ba:	83 c4 20             	add    $0x20,%esp
  1030bd:	5e                   	pop    %esi
  1030be:	5f                   	pop    %edi
  1030bf:	5d                   	pop    %ebp
  1030c0:	c3                   	ret    

001030c1 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  1030c1:	55                   	push   %ebp
  1030c2:	89 e5                	mov    %esp,%ebp
  1030c4:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  1030c7:	8b 45 08             	mov    0x8(%ebp),%eax
  1030ca:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  1030cd:	eb 21                	jmp    1030f0 <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  1030cf:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030d2:	0f b6 10             	movzbl (%eax),%edx
  1030d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1030d8:	88 10                	mov    %dl,(%eax)
  1030da:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1030dd:	0f b6 00             	movzbl (%eax),%eax
  1030e0:	84 c0                	test   %al,%al
  1030e2:	74 04                	je     1030e8 <strncpy+0x27>
            src ++;
  1030e4:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  1030e8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1030ec:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    while (len > 0) {
  1030f0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1030f4:	75 d9                	jne    1030cf <strncpy+0xe>
    }
    return dst;
  1030f6:	8b 45 08             	mov    0x8(%ebp),%eax
}
  1030f9:	c9                   	leave  
  1030fa:	c3                   	ret    

001030fb <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  1030fb:	55                   	push   %ebp
  1030fc:	89 e5                	mov    %esp,%ebp
  1030fe:	57                   	push   %edi
  1030ff:	56                   	push   %esi
  103100:	83 ec 20             	sub    $0x20,%esp
  103103:	8b 45 08             	mov    0x8(%ebp),%eax
  103106:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103109:	8b 45 0c             	mov    0xc(%ebp),%eax
  10310c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  10310f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103112:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103115:	89 d1                	mov    %edx,%ecx
  103117:	89 c2                	mov    %eax,%edx
  103119:	89 ce                	mov    %ecx,%esi
  10311b:	89 d7                	mov    %edx,%edi
  10311d:	ac                   	lods   %ds:(%esi),%al
  10311e:	ae                   	scas   %es:(%edi),%al
  10311f:	75 08                	jne    103129 <strcmp+0x2e>
  103121:	84 c0                	test   %al,%al
  103123:	75 f8                	jne    10311d <strcmp+0x22>
  103125:	31 c0                	xor    %eax,%eax
  103127:	eb 04                	jmp    10312d <strcmp+0x32>
  103129:	19 c0                	sbb    %eax,%eax
  10312b:	0c 01                	or     $0x1,%al
  10312d:	89 fa                	mov    %edi,%edx
  10312f:	89 f1                	mov    %esi,%ecx
  103131:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103134:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  103137:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  10313a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  10313d:	83 c4 20             	add    $0x20,%esp
  103140:	5e                   	pop    %esi
  103141:	5f                   	pop    %edi
  103142:	5d                   	pop    %ebp
  103143:	c3                   	ret    

00103144 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  103144:	55                   	push   %ebp
  103145:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  103147:	eb 0c                	jmp    103155 <strncmp+0x11>
        n --, s1 ++, s2 ++;
  103149:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  10314d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103151:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  103155:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103159:	74 1a                	je     103175 <strncmp+0x31>
  10315b:	8b 45 08             	mov    0x8(%ebp),%eax
  10315e:	0f b6 00             	movzbl (%eax),%eax
  103161:	84 c0                	test   %al,%al
  103163:	74 10                	je     103175 <strncmp+0x31>
  103165:	8b 45 08             	mov    0x8(%ebp),%eax
  103168:	0f b6 10             	movzbl (%eax),%edx
  10316b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10316e:	0f b6 00             	movzbl (%eax),%eax
  103171:	38 c2                	cmp    %al,%dl
  103173:	74 d4                	je     103149 <strncmp+0x5>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  103175:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103179:	74 18                	je     103193 <strncmp+0x4f>
  10317b:	8b 45 08             	mov    0x8(%ebp),%eax
  10317e:	0f b6 00             	movzbl (%eax),%eax
  103181:	0f b6 d0             	movzbl %al,%edx
  103184:	8b 45 0c             	mov    0xc(%ebp),%eax
  103187:	0f b6 00             	movzbl (%eax),%eax
  10318a:	0f b6 c8             	movzbl %al,%ecx
  10318d:	89 d0                	mov    %edx,%eax
  10318f:	29 c8                	sub    %ecx,%eax
  103191:	eb 05                	jmp    103198 <strncmp+0x54>
  103193:	b8 00 00 00 00       	mov    $0x0,%eax
}
  103198:	5d                   	pop    %ebp
  103199:	c3                   	ret    

0010319a <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  10319a:	55                   	push   %ebp
  10319b:	89 e5                	mov    %esp,%ebp
  10319d:	83 ec 04             	sub    $0x4,%esp
  1031a0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031a3:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  1031a6:	eb 14                	jmp    1031bc <strchr+0x22>
        if (*s == c) {
  1031a8:	8b 45 08             	mov    0x8(%ebp),%eax
  1031ab:	0f b6 00             	movzbl (%eax),%eax
  1031ae:	38 45 fc             	cmp    %al,-0x4(%ebp)
  1031b1:	75 05                	jne    1031b8 <strchr+0x1e>
            return (char *)s;
  1031b3:	8b 45 08             	mov    0x8(%ebp),%eax
  1031b6:	eb 13                	jmp    1031cb <strchr+0x31>
        }
        s ++;
  1031b8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s != '\0') {
  1031bc:	8b 45 08             	mov    0x8(%ebp),%eax
  1031bf:	0f b6 00             	movzbl (%eax),%eax
  1031c2:	84 c0                	test   %al,%al
  1031c4:	75 e2                	jne    1031a8 <strchr+0xe>
    }
    return NULL;
  1031c6:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1031cb:	c9                   	leave  
  1031cc:	c3                   	ret    

001031cd <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  1031cd:	55                   	push   %ebp
  1031ce:	89 e5                	mov    %esp,%ebp
  1031d0:	83 ec 04             	sub    $0x4,%esp
  1031d3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031d6:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  1031d9:	eb 0f                	jmp    1031ea <strfind+0x1d>
        if (*s == c) {
  1031db:	8b 45 08             	mov    0x8(%ebp),%eax
  1031de:	0f b6 00             	movzbl (%eax),%eax
  1031e1:	38 45 fc             	cmp    %al,-0x4(%ebp)
  1031e4:	74 10                	je     1031f6 <strfind+0x29>
            break;
        }
        s ++;
  1031e6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s != '\0') {
  1031ea:	8b 45 08             	mov    0x8(%ebp),%eax
  1031ed:	0f b6 00             	movzbl (%eax),%eax
  1031f0:	84 c0                	test   %al,%al
  1031f2:	75 e7                	jne    1031db <strfind+0xe>
  1031f4:	eb 01                	jmp    1031f7 <strfind+0x2a>
            break;
  1031f6:	90                   	nop
    }
    return (char *)s;
  1031f7:	8b 45 08             	mov    0x8(%ebp),%eax
}
  1031fa:	c9                   	leave  
  1031fb:	c3                   	ret    

001031fc <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  1031fc:	55                   	push   %ebp
  1031fd:	89 e5                	mov    %esp,%ebp
  1031ff:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  103202:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  103209:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  103210:	eb 04                	jmp    103216 <strtol+0x1a>
        s ++;
  103212:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  103216:	8b 45 08             	mov    0x8(%ebp),%eax
  103219:	0f b6 00             	movzbl (%eax),%eax
  10321c:	3c 20                	cmp    $0x20,%al
  10321e:	74 f2                	je     103212 <strtol+0x16>
  103220:	8b 45 08             	mov    0x8(%ebp),%eax
  103223:	0f b6 00             	movzbl (%eax),%eax
  103226:	3c 09                	cmp    $0x9,%al
  103228:	74 e8                	je     103212 <strtol+0x16>
    }

    // plus/minus sign
    if (*s == '+') {
  10322a:	8b 45 08             	mov    0x8(%ebp),%eax
  10322d:	0f b6 00             	movzbl (%eax),%eax
  103230:	3c 2b                	cmp    $0x2b,%al
  103232:	75 06                	jne    10323a <strtol+0x3e>
        s ++;
  103234:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103238:	eb 15                	jmp    10324f <strtol+0x53>
    }
    else if (*s == '-') {
  10323a:	8b 45 08             	mov    0x8(%ebp),%eax
  10323d:	0f b6 00             	movzbl (%eax),%eax
  103240:	3c 2d                	cmp    $0x2d,%al
  103242:	75 0b                	jne    10324f <strtol+0x53>
        s ++, neg = 1;
  103244:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103248:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  10324f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103253:	74 06                	je     10325b <strtol+0x5f>
  103255:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  103259:	75 24                	jne    10327f <strtol+0x83>
  10325b:	8b 45 08             	mov    0x8(%ebp),%eax
  10325e:	0f b6 00             	movzbl (%eax),%eax
  103261:	3c 30                	cmp    $0x30,%al
  103263:	75 1a                	jne    10327f <strtol+0x83>
  103265:	8b 45 08             	mov    0x8(%ebp),%eax
  103268:	83 c0 01             	add    $0x1,%eax
  10326b:	0f b6 00             	movzbl (%eax),%eax
  10326e:	3c 78                	cmp    $0x78,%al
  103270:	75 0d                	jne    10327f <strtol+0x83>
        s += 2, base = 16;
  103272:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  103276:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  10327d:	eb 2a                	jmp    1032a9 <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  10327f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103283:	75 17                	jne    10329c <strtol+0xa0>
  103285:	8b 45 08             	mov    0x8(%ebp),%eax
  103288:	0f b6 00             	movzbl (%eax),%eax
  10328b:	3c 30                	cmp    $0x30,%al
  10328d:	75 0d                	jne    10329c <strtol+0xa0>
        s ++, base = 8;
  10328f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103293:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  10329a:	eb 0d                	jmp    1032a9 <strtol+0xad>
    }
    else if (base == 0) {
  10329c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1032a0:	75 07                	jne    1032a9 <strtol+0xad>
        base = 10;
  1032a2:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  1032a9:	8b 45 08             	mov    0x8(%ebp),%eax
  1032ac:	0f b6 00             	movzbl (%eax),%eax
  1032af:	3c 2f                	cmp    $0x2f,%al
  1032b1:	7e 1b                	jle    1032ce <strtol+0xd2>
  1032b3:	8b 45 08             	mov    0x8(%ebp),%eax
  1032b6:	0f b6 00             	movzbl (%eax),%eax
  1032b9:	3c 39                	cmp    $0x39,%al
  1032bb:	7f 11                	jg     1032ce <strtol+0xd2>
            dig = *s - '0';
  1032bd:	8b 45 08             	mov    0x8(%ebp),%eax
  1032c0:	0f b6 00             	movzbl (%eax),%eax
  1032c3:	0f be c0             	movsbl %al,%eax
  1032c6:	83 e8 30             	sub    $0x30,%eax
  1032c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1032cc:	eb 48                	jmp    103316 <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  1032ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1032d1:	0f b6 00             	movzbl (%eax),%eax
  1032d4:	3c 60                	cmp    $0x60,%al
  1032d6:	7e 1b                	jle    1032f3 <strtol+0xf7>
  1032d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1032db:	0f b6 00             	movzbl (%eax),%eax
  1032de:	3c 7a                	cmp    $0x7a,%al
  1032e0:	7f 11                	jg     1032f3 <strtol+0xf7>
            dig = *s - 'a' + 10;
  1032e2:	8b 45 08             	mov    0x8(%ebp),%eax
  1032e5:	0f b6 00             	movzbl (%eax),%eax
  1032e8:	0f be c0             	movsbl %al,%eax
  1032eb:	83 e8 57             	sub    $0x57,%eax
  1032ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1032f1:	eb 23                	jmp    103316 <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  1032f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1032f6:	0f b6 00             	movzbl (%eax),%eax
  1032f9:	3c 40                	cmp    $0x40,%al
  1032fb:	7e 3c                	jle    103339 <strtol+0x13d>
  1032fd:	8b 45 08             	mov    0x8(%ebp),%eax
  103300:	0f b6 00             	movzbl (%eax),%eax
  103303:	3c 5a                	cmp    $0x5a,%al
  103305:	7f 32                	jg     103339 <strtol+0x13d>
            dig = *s - 'A' + 10;
  103307:	8b 45 08             	mov    0x8(%ebp),%eax
  10330a:	0f b6 00             	movzbl (%eax),%eax
  10330d:	0f be c0             	movsbl %al,%eax
  103310:	83 e8 37             	sub    $0x37,%eax
  103313:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  103316:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103319:	3b 45 10             	cmp    0x10(%ebp),%eax
  10331c:	7d 1a                	jge    103338 <strtol+0x13c>
            break;
        }
        s ++, val = (val * base) + dig;
  10331e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103322:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103325:	0f af 45 10          	imul   0x10(%ebp),%eax
  103329:	89 c2                	mov    %eax,%edx
  10332b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10332e:	01 d0                	add    %edx,%eax
  103330:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  103333:	e9 71 ff ff ff       	jmp    1032a9 <strtol+0xad>
            break;
  103338:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  103339:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10333d:	74 08                	je     103347 <strtol+0x14b>
        *endptr = (char *) s;
  10333f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103342:	8b 55 08             	mov    0x8(%ebp),%edx
  103345:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  103347:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  10334b:	74 07                	je     103354 <strtol+0x158>
  10334d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103350:	f7 d8                	neg    %eax
  103352:	eb 03                	jmp    103357 <strtol+0x15b>
  103354:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  103357:	c9                   	leave  
  103358:	c3                   	ret    

00103359 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  103359:	55                   	push   %ebp
  10335a:	89 e5                	mov    %esp,%ebp
  10335c:	57                   	push   %edi
  10335d:	83 ec 24             	sub    $0x24,%esp
  103360:	8b 45 0c             	mov    0xc(%ebp),%eax
  103363:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  103366:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  10336a:	8b 55 08             	mov    0x8(%ebp),%edx
  10336d:	89 55 f8             	mov    %edx,-0x8(%ebp)
  103370:	88 45 f7             	mov    %al,-0x9(%ebp)
  103373:	8b 45 10             	mov    0x10(%ebp),%eax
  103376:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  103379:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  10337c:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  103380:	8b 55 f8             	mov    -0x8(%ebp),%edx
  103383:	89 d7                	mov    %edx,%edi
  103385:	f3 aa                	rep stos %al,%es:(%edi)
  103387:	89 fa                	mov    %edi,%edx
  103389:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  10338c:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  10338f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  103392:	8b 7d fc             	mov    -0x4(%ebp),%edi
  103395:	c9                   	leave  
  103396:	c3                   	ret    

00103397 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  103397:	55                   	push   %ebp
  103398:	89 e5                	mov    %esp,%ebp
  10339a:	57                   	push   %edi
  10339b:	56                   	push   %esi
  10339c:	53                   	push   %ebx
  10339d:	83 ec 30             	sub    $0x30,%esp
  1033a0:	8b 45 08             	mov    0x8(%ebp),%eax
  1033a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033a6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1033ac:	8b 45 10             	mov    0x10(%ebp),%eax
  1033af:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  1033b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033b5:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  1033b8:	73 42                	jae    1033fc <memmove+0x65>
  1033ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033bd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1033c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1033c3:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1033c6:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1033c9:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  1033cc:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1033cf:	c1 e8 02             	shr    $0x2,%eax
  1033d2:	89 c1                	mov    %eax,%ecx
    asm volatile (
  1033d4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1033d7:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1033da:	89 d7                	mov    %edx,%edi
  1033dc:	89 c6                	mov    %eax,%esi
  1033de:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1033e0:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  1033e3:	83 e1 03             	and    $0x3,%ecx
  1033e6:	74 02                	je     1033ea <memmove+0x53>
  1033e8:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1033ea:	89 f0                	mov    %esi,%eax
  1033ec:	89 fa                	mov    %edi,%edx
  1033ee:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  1033f1:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  1033f4:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  1033f7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
        return __memcpy(dst, src, n);
  1033fa:	eb 36                	jmp    103432 <memmove+0x9b>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  1033fc:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1033ff:	8d 50 ff             	lea    -0x1(%eax),%edx
  103402:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103405:	01 c2                	add    %eax,%edx
  103407:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10340a:	8d 48 ff             	lea    -0x1(%eax),%ecx
  10340d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103410:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  103413:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103416:	89 c1                	mov    %eax,%ecx
  103418:	89 d8                	mov    %ebx,%eax
  10341a:	89 d6                	mov    %edx,%esi
  10341c:	89 c7                	mov    %eax,%edi
  10341e:	fd                   	std    
  10341f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103421:	fc                   	cld    
  103422:	89 f8                	mov    %edi,%eax
  103424:	89 f2                	mov    %esi,%edx
  103426:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  103429:	89 55 c8             	mov    %edx,-0x38(%ebp)
  10342c:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  10342f:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  103432:	83 c4 30             	add    $0x30,%esp
  103435:	5b                   	pop    %ebx
  103436:	5e                   	pop    %esi
  103437:	5f                   	pop    %edi
  103438:	5d                   	pop    %ebp
  103439:	c3                   	ret    

0010343a <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  10343a:	55                   	push   %ebp
  10343b:	89 e5                	mov    %esp,%ebp
  10343d:	57                   	push   %edi
  10343e:	56                   	push   %esi
  10343f:	83 ec 20             	sub    $0x20,%esp
  103442:	8b 45 08             	mov    0x8(%ebp),%eax
  103445:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103448:	8b 45 0c             	mov    0xc(%ebp),%eax
  10344b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10344e:	8b 45 10             	mov    0x10(%ebp),%eax
  103451:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  103454:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103457:	c1 e8 02             	shr    $0x2,%eax
  10345a:	89 c1                	mov    %eax,%ecx
    asm volatile (
  10345c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10345f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103462:	89 d7                	mov    %edx,%edi
  103464:	89 c6                	mov    %eax,%esi
  103466:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103468:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  10346b:	83 e1 03             	and    $0x3,%ecx
  10346e:	74 02                	je     103472 <memcpy+0x38>
  103470:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103472:	89 f0                	mov    %esi,%eax
  103474:	89 fa                	mov    %edi,%edx
  103476:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  103479:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  10347c:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  10347f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  103482:	83 c4 20             	add    $0x20,%esp
  103485:	5e                   	pop    %esi
  103486:	5f                   	pop    %edi
  103487:	5d                   	pop    %ebp
  103488:	c3                   	ret    

00103489 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  103489:	55                   	push   %ebp
  10348a:	89 e5                	mov    %esp,%ebp
  10348c:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  10348f:	8b 45 08             	mov    0x8(%ebp),%eax
  103492:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  103495:	8b 45 0c             	mov    0xc(%ebp),%eax
  103498:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  10349b:	eb 30                	jmp    1034cd <memcmp+0x44>
        if (*s1 != *s2) {
  10349d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1034a0:	0f b6 10             	movzbl (%eax),%edx
  1034a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1034a6:	0f b6 00             	movzbl (%eax),%eax
  1034a9:	38 c2                	cmp    %al,%dl
  1034ab:	74 18                	je     1034c5 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  1034ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1034b0:	0f b6 00             	movzbl (%eax),%eax
  1034b3:	0f b6 d0             	movzbl %al,%edx
  1034b6:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1034b9:	0f b6 00             	movzbl (%eax),%eax
  1034bc:	0f b6 c8             	movzbl %al,%ecx
  1034bf:	89 d0                	mov    %edx,%eax
  1034c1:	29 c8                	sub    %ecx,%eax
  1034c3:	eb 1a                	jmp    1034df <memcmp+0x56>
        }
        s1 ++, s2 ++;
  1034c5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1034c9:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    while (n -- > 0) {
  1034cd:	8b 45 10             	mov    0x10(%ebp),%eax
  1034d0:	8d 50 ff             	lea    -0x1(%eax),%edx
  1034d3:	89 55 10             	mov    %edx,0x10(%ebp)
  1034d6:	85 c0                	test   %eax,%eax
  1034d8:	75 c3                	jne    10349d <memcmp+0x14>
    }
    return 0;
  1034da:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1034df:	c9                   	leave  
  1034e0:	c3                   	ret    
