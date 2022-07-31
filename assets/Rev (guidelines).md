[Overview](https://www.usenix.org/system/files/conference/3gse15/3gse15-feng.pdf)

Before you get scared off from reversing, note that these levels are on a logarithmic curve, meaning that once you get past the baby level, everything will start the make more sense and you probably won't need this list anymore, but it's still a good reference. As you get more advanced, you'll start needing a wider range of skills and each specific will be used less and less meaning that you'll probably need to learn on the fly. The most important soft skill here would be knowing how to google for information while ctfs are running because you can't learn everything beforehand. There's a lot of things that aren't covered on here but this covers most of the important things, don't worry about reading through *everything* before getting your feet wet (skim through everything at least), these are just reference materials for you to go back on when you get stuck. 


## Baby:

Concepts:

[Linux stuff (yes, all of it)](https://ryanstutorials.net/linuxtutorial/)

[Stack operations](https://en.wikipedia.org/wiki/Stack_(abstract_data_type))

[Assembly opcodes, registers, and data (read all of it)](https://www.cs.virginia.edu/~evans/cs216/guides/x86.html)

(keep in mind there are different types of assemblies, different compilers and architectures, most of them are irrelevant but may come up later; there are a lot of nuances here)[ctrl+f for the different architectures](https://www.foo.be/cours/dess-20122013/b/Eldad_Eilam-Reversing__Secrets_of_Reverse_Engineering-Wiley(2005).pdf)

[Data segments](https://en.wikipedia.org/wiki/Data_segment)

[Binary labs (kinda messy but gets the job done)](http://www.cs.rpi.edu/academics/courses/spring10/csci4971/)

[Binaries (Parts 1 and 2)](https://ihatefeds.com/No.Starch.Practical.Binary.Analysis.2018.pdf)

[Static and Dynamic Analysis](https://en.wikipedia.org/wiki/Malware_analysis)

[Debugging, Disassembling, and Decompiling](https://reverseengineering.stackexchange.com/questions/4635/whats-the-difference-between-a-disassembler-debugger-and-decompiler)


### Tools:
[strings, ltrace, and strace](https://www.thegeekstuff.com/2012/03/reverse-engineering-tools)

[gdb or gef/peda](https://www.tutorialspoint.com/gnu_debugger/what_is_gdb.htm) and [another](https://www.cs.cmu.edu/~gilpin/tutorial/#1)

### Decompilers (familiarity with one is good enough):
[Ghidra](https://www.shogunlab.com/blog/2019/04/12/here-be-dragons-ghidra-0.html)

[IDA (so there's a free version but it's not as good at the pro obviously since it doesn't have decompiling, still useful to learn)](https://securityxploded.com/reversing-basics-ida-pro.php)

[r2 (arguably the hardest tool to learn but also the most powerful)](https://sushant94.me/2015/05/31/Introduction_to_radare2/) remember to do further research yourself

### Scripting langauges:

[Python (learning until file handling is good enough)](https://www.w3schools.com/python/)

[C (learn the whole thing)](https://www.tutorialspoint.com/cprogramming/index.htm)

### Additional Resources and Tools:

[Writeups for Practical Binary Analysis Book](https://loicpefferkorn.net/2020/04/practical-binary-analysis-book-ctf-writeup-for-levels-2-4/#the-ctf-challenge)

[objdump](https://web.mit.edu/gnu/doc/html/binutils_5.html)

[readelf](https://www.geeksforgeeks.org/readelf-command-in-linux-with-examples/)

## Intermediate stuff:

Not really any order so figure it out.

### Concepts:

##### Malware Analysis:
[Packing](https://www2.cs.arizona.edu/~debray/Publications/unpacker-extraction.pdf)

[Binaries(Part 3)](https://ihatefeds.com/No.Starch.Practical.Binary.Analysis.2018.pdf)

Standard linux library

Memory allocation and security calls

binary tree and forking

binary patching

modifying binaries in runtime

stripped binaries

[Bypassing Antidebugging](https://seblau.github.io/posts/linux-anti-debugging) and [this](https://0x00sec.org/t/bypass-linux-basic-anti-debugging/22799) (different compiling flags) and [this](https://reverseengineering.stackexchange.com/questions/43/anti-debug-techniques-on-unix-platforms), [last way](http://m0x39.blogspot.com/2013/01/reverse-engineering-password-protected.html) to bypass is by manually changing flags, and for GDB specific based on [this](https://github.com/jvoisin/pangu)

I should probably put a thing for every single possible way to bypass ptrace antidebug [Ptrace hacking]

[Bypassing Antidebugging (Windows)](https://anti-reversing.com/Downloads/Anti-Reversing/The_Ultimate_Anti-Reversing_Reference.pdf)

bypassing antivm/virtualization

##### Embedded Systems:

Verilog

### Implementation:
[Z3 (numbers are crunchy crunchy)](https://www.cs.tau.ac.il/~msagiv/courses/asv/z3py/guide-examples.htm)

[apktool]

[dex2jar]

[PEstudio](https://www.youtube.com/watch?v=z0e306Jod5A)

xdis

pwntools

angr

### Languages (these sometimes show up so a basic understanding on hand is good enough for reversing):

[C++](https://www.w3schools.com/cpp/default.asp)

go

rust

java


## Advanced stuff:

These stuff you can't really learn in advance because there are a lot of these and pretty hard to learn so definitely not comprehensive and very ctf dependent, at this point you should know how to google for what you need anyways.

[Esoteric languages](https://en.wikipedia.org/wiki/Esoteric_programming_language)