# Assembly Assignment

This is a repository to archive university assembly assignments written in MIPS or 8086. These files can be used by students who want to practice more, teachers who want to make questions, and anyone who want to practice assembly programming.

## Questions

- [Recognize Case:](./MIPS-recognize-case.asm) write a program that gets an english character from input, and if that character was upper case, prints `uppercase`. Otherwise, prints `lowercase`. __Notes:__ you cannot use conditional commands likes `beq` in this question.
- [Sort Three Numbers:](./MIPS-sort-three-numbers.asm) suppose that we have three number is `$s1`, `$s2`, and `$s3` registers. Write and algorithm in MIPS that sorts these three numbers from least to greatest. The input numbers are not very large numbers .(Register values are less than $2^{29}$) __Notes:__ you cannot use conditional commands likes `beq` in this question. __Hint:__ you can write a macro that calculates maximum of two register, and solve the question by using this macro.
- [Planets:](./MIPS-planets.asm) Write a program that prints this message at first:
```
Please choose planet type:
1 inner
2 outer
```
Then gets one of the number, 1 or 2. Now, gets one of the numbers from 1 to 4 in the input. Then, based on the input, prints one of the names below: (Names of the planets are written based on distance from the sun.)
```
Mercury
Venus
Earth
Mars
Jupiter
Saturn
Uranus
Neptune
```
- Swapcase [MIPS](./MIPS-swapcase.asm) [8086](./8086-swapcase.asm): Write a program that gets a number `x` from the input. Then, gets a string of length `x` from the input. After that, It should change uppercase letter to lowercase and vice versa, and make no change in other characters. At the end, print the final string.
- [Calculator](./MIPS-calculator.asm): Suppose that we want to design a calculator that supports `+`, `-`, `*`, `/`, and `%` operators. Write a code in MIPS that gets two number at first, then gets one the five above characters, and shows the result in the output. If the input character does not match any of the characters defined above, the program should end by showing a proper error message. For implementing this question, use a structure similar to `switch case` which is implemented as `jump address table`.
- [Fibonacci:](./MIPS-fibonacci.asm) write a recursive function in MIPS that gets n from the input and returns the nth fibonacci number. Change this function in a way that it would use `memorize` method to calculate the output. (__Hint:__ implementation of this function in `C` is witten below:)
```c
int fib(int n, int* memolist) {
   if (n == 0) {
       return 0;
   } else if (n == 1) {
return 1; }
   if (memolist[n]) {
       return memolist[n];
}   
   memolist[n] = fib(n - 1, memolist) + fib(n - 2, memolist);
   return memolist[n];
}
```
for simplicity, suppose that length of input array is always `n`, and the array is filled with zeros at first.
- [Binary Search:](./MIPS-binary-search.asm) Suppose that an array named `A` and a number named `X` is stored in `.data`. Also, the length of Array `A` is stored in a variable named `size` in `.data`. Write a program in MIPS that uses a recursive function and binary search method, and finds the element `X` in array `A`, and shows the index of `X` in `A`.
- [Rotate:](./8086-rotate.asm) Rotating a number is done by moving the units of that number to the end of the number. The number that all its rotations and itself are prime is called a __prime rotational number__(e.g. 197 because itself ,971, and 719 are prime) write a program in 8086 that gets a number and if it was a prime rotatinoal number, print `YES`. Otherwise, prints `NO`. (for checking that if a number is prime, use functions)
- __Matrix:__ in this question you are supposed to implement some matrix calculations. at fist, get a number `n` from the input. Then, allocate a memory in size $n \times n$. After that, get matrix entries from the input. For example,
```
3
1 2 3 4 5 6 7 8 9
```
is an input equal to 
```math
\begin{pmatrix} 1 & 2 & 3 \\
4 & 5 & 6 \\
7 & 8 & 9 \\ 
\end{pmatrix}
```
[A:](./MIPS-matrix-a.asm) Write a function that gets start address of matrix `A` and two number, `s` and `r`, and subtracts values of the `r`th row from the `s`th row and show the result matrix in a 2-dimensional way.

[B:](./MIPS-matrix-b.asm) Write a function that gets start address of matrix `A` and two number, `r` and `c`, adn multiplies all values of `r`th row by the constant number `c`. Then, it shows the result matrix in a 2-dimensional way.

[C:](./MIPS-matrix-c.asm) Write a function that gets start address of matrix `A` and two number, `s` and `r`, and swaps values of the `r`th row and values of the `s`th row. In this question, you should only use functions in parts A and B, and you cannot use others commands. (Except for passing parameters to functions) At the end, You should show the result matrix in a 2-dimensional way.




## Contributing

Pull requests are welcome. If found a bug in the codes, please open an issue first
to discuss what you would like to change. For adding more questions to develop the archive, don't hesitate to create pull requests. After checking the question and test cases, the repository will be updated.
