+++
author = "Hugo Authors"
title = "密码第二月(?) "
date = "2026-10-14"
description = "慢工出细活，尤其是数学这东西"
categories = [
    "Test",
    "Test with whitespaces"
]
tags = [
    "markdown",
    "text",
    "tag with whitespaces"
]
image = "matt-le-SJSpo9hQf7s-unsplash.jpg"
math = true
+++

# rsa  
1.仿射密码  
加密 $e=(ax+b) \bmod 26$  
解密 $d=a^{-1}(y-b) \bmod 26$  
一道例题：设使用仿射密码 $e(x)=(ax+b) \bmod 25$ 加密后得到的一段很长的密文中，w 和 B 出现的次数最多，那么 $a,b$ 最可能的取值分别是多少  
可以用英语中常用字母试出 $a,b$，  
2.维吉尼亚密码（一道例题   
解 密 使 用 维 吉 尼 亚 密 码 加 密 得 到 的 密 文 F F L B C V F x, 其 中 密 钥
$K = \text{ZORRO}$  
扩展密钥 ZORROZORR  
计算明文 $= (k-c) \bmod 26$ 取正整数，得  
GROUNDDHOG  
# 二次剩余 概念
$(m,n) = 1$ 且 $m > 1$. 如果 $x^2 \equiv n \pmod m$ 有解，
那么称 $n$ 为模 $m$ 的二次剩余；否则，称 $n$ 为模 $m$ 的二次非剩余  
设 $p$ 是奇素数，那么在模 $p$ 的既约剩余系 $\{1，2，\cdots，p-1\}$ 中，模 $p$ 的二次剩余和二次非剩余各 $(p-1)/2$ 个，且
$$1,\;2^2 \bmod p,\;\cdots,\;\left[\frac{p-1}{2}\right]^2 \bmod p$$
就是模 $p$ 的全部二次剩余。  
~~证明没看懂，不写了~~  
奇素数 $p$ 不整除 $n$  
1. n 是 p 的二次剩余当且仅当 $n^{(p-1)/2} \equiv 1 \pmod p$  
2. n 是 p 的二次非剩余当且仅当 $n^{(p-1)/2} \equiv -1 \pmod p$  
# 勒让德符号  
$\left(\dfrac{n}{p}\right) = \pm 1$，$p$ 为奇素数  
对任意奇素数 $p$，有：
$$\left(\frac{-1}{p}\right) = (-1)^{\frac{p-1}{2}} = \begin{cases} 1, & \text{若 } p \equiv 1 \pmod 4 \\ -1, & \text{若 } p \equiv -1 \pmod 4 \end{cases}$$
$\left(\dfrac{n}{m}\right) = \prod_{}^{} \left(\dfrac{n}{pi}\right)$  
m=$p_1$$p_2$...$p_n$  
# 原根  
1.整数阶gcd(a,m)=1,使$a^l$≡1(modm)成立的最小整数l为a关于m的阶，记$ord_m$a  
设$ord_m$b=l，则$a^l$≡1(modm)当且仅当l整除n
,特别地，l整除
φ(m)  

2.原根设 \(m\) 是正整数，\((g,m)=1\)。如果
$
\operatorname{ord}_m g = \varphi(m)
$
那么称 \(g\) 为模 \(m\) 的一个原根  


# 题目  
1）
```
def encrypt(m, e1, e2):
p = getPrime(512)
q = getPrime(512)
N = p*q
c1 = pow((3*p + 7*q), e1, N)
c2 = pow((2*p + 5*q), e2, N)
e = 65537
c = pow(m, e, N)
return c
```  
先$c_1$,$c_2$两边取$e_2$,$e_1$次幂  
由二项式定理化简  
(3p+7q)^$e_1$$e_2$≡(3p)^$e_1$$e_2$+(7p)^$e_1$$e_2$(modN)  
(2p+5q)^$e_1$$e_2$≡(2p)^$e_1$$e_2$+(5q)^$e_1$$e_2$(modN)  
后消去p得  
S≡(14^$e_1$$e_2$-15$e_1$$e_2$)q^$e_1$$e_2$(modN)  
最后求q为s，N最大公约数  

# 未完  


{{< css.inline >}}
<style>
.canon { background: white; width: 100%; height: auto; }
</style>
{{< /css.inline >}}
