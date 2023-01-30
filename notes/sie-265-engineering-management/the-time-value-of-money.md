# Time Value of Money

### Money has a Time Value
- **Capital**: refers to wealth in the form of money or property that can be used to produce more wealth.
- Engineering economy studies involve the commitment of capital for extended periods of time.
- A dollar today is worth more than a dollar one or more years from now (for several reasons) because of interest and/or profit it can earn.
- Other factors affecting money time-value are inflation/deflation and currency exchange (chapter 8).

### Return on Capital
- Interest and profit pay the providers of __capital for forgoing its use__ during the time the capital is being used.
- Onterest and profit are payments for __the risk the investor takes__ in letting another use his or her capital.

### Focusing on Interest Effect
- Simple Interest
	- Interest earned or charged is linearly proportional to the initial amount of the loan (**Principal**), the Interest rate, and the number of interest periods.
	- Mathematically, the interest stays constant.
- Compound Interest
	- For any interest period, compound interest reflects both the remaining principal and any accumulated interest up to the beginning of that period.
	- Mathematically, the growth of total capital is exponential.


### Simple vs Compound Interest Examples
For $1,000 loaned for three years at an interest rate of 10% compounded each period, what is the total due for repayment at the end of the third year?


### Computation of Simple Interest
Total interest earned or payed may be computed using the #formula:
$$I = PNi$$
where:

P = Principal amount lent or borrowed
N= Number of periods (e.g., years)
i = interest per period

If $5,000 were loaned for five years at a simple interest rate of 7% per year, the interest earned would be:
$1000 * 7% * 5 years = \$1,750 $

The total amount paid would then be:
$5,000 + $1,750 = $6,750 dollars.


### In-Class Assignment 4-B
You borrow $500 from a family member and agree to pay it back in six months. Because you are part of the family, you are only being charged simple interest at the rate of 0.5% per month. How much will you owe after six months? How much is the interest?

Initial Principle: $500
Interest Rate: 0.5% per month
Period: 6 months

Total Interest:
$\$500 * 0.05\% * 6\ months = \$15 dollars$

Total money paid is $515 dollars


### Economic Equvalence
- How can alternatives for providing the same service or accomplishing the same function be compared when interest is involved over extended periods of time?
	- Each alternative can be reduced to an equivalent basis dependent on interest rate, amount of money involved, and the timing of monetary receipts or expenses
- Using these elements, we can 'move' cash flows on the time-scale so that we can compare them at particular points in time.
![[Pasted image 20230120094347.png]]

### Notation
i = effective interest rate per interest period
N = number of compounding (interest) periods
P = present sum of money; equivalent value of one or more cash flows at a reference point in time; the present
F = future sum of money; equivalent value of one more more cash flows; the future
A = end-of-period cash flows in a uniform series continuing for a certain number of periods, starting at the end of the first period and continuing through the last.


### Cash Flow Diagrams | Basics
Cash Flow diagrams are an indispensable tool for clarifying and visualizing a series of cash flows.

**Example**
Suppose you have a $17,000 balance on your credit card, and you decide to repay the $17,000 debt in four months. An unpaid credit card balance at the beginning of a month will be charged interest at the rate of 1% by your credit card company.

![[Pasted image 20230120094846.png]]

When paying a loan at once (near the end)
$$\$17,690 - \$17,000 = \$690.27\ dollars$$

When paying a loan in early installments.\:
$$I = 4(\$4357.1) - \$17,000 = \$428.4\ dollars$$


*Lesson: pay loans as soon as possible.*


**Example 2**
An investment of $10,000 can be made that will produce uniform annual revenue of $5,310 for five years and then have a market (recovery) value of $2,000 at the end of year (EOY) five. Annual expenses will be $3,000 at the end of each year for operating and maintaining the project. Draw a cash-flow diagram for the five-year life of the project.
![[Pasted image 20230123090915.png]]


- **Down Arrows:** Expenses, negative clash flows, or cash outflows
- **Up Arrows Receipts, positive cash flows, or cash outflows**

**Economic Equivalence**: You must take the time at which the cash-flows are generated into account in order to include the time value of money in mathematical calculations.

### Relating Present and Future Equivalent Values of Single Cash Flows

**Compound Interest**

- We can apply compound interest formulas to 'move' cash flows along the cash flow diagram
- Using standard notation, we can find that a present among $P$, can grow into a future amount, $F$, in $N$ time periods at an interest rate $i$ according to the #formula below
$$F = P(1+i)^N$$

- Also, $(1+i)^N = (F/P, i, N)$ is known as the *single payment compound amount factor*. It is read as, *'F given P at i% interest per period for N interest periods.'*


- In a similar way, we can find $P$ given $F$ by:
$$P = F(1+n)^{-N}$$

- Also, $(1+i)^-N = (P/F, i, N)$ is known as the *single payment present worth factor.*

![[Pasted image 20230123092736.png]]

### Using Factors to Relate P and F

We can use the interest factors to find economically equivalent values at different points in time.

**Example 1**: $2,500 at time zero is equivalent to how much after six years if the interest rate is 8% per year?

$F = P(F/P, i, N) = \$2,500 (F/P, 8\%, 6) = \$2,500(1.5869) = \$3,967$

**Example 2:** $3,000 at the end of year seven is equivalent to how much today (time zero) if the interest rate is 6% per year?

$F = P(F/P, i, N) = \$3,000 (F/P, 6\%, 7) = \$3,000(0.6651) = \$1,995$


## In-Class Assignment

1. You have just invested a​ one-time amount of​ $5,000 in a​ stock-based mutual fund. This fund should earn​ (on average) 9​% per year over a long period of time. How much will your investment be worth in 35​ years?

$$F = P(F/P, i, N) = \$5,000 (F/P, 8\%, 35) = \$5,000(20.4140) = \$102,070$$


2. You just inherited​ $10,000. While you plan to squander some of it​ away, how much should you deposit in an account earning​ 5% interest per year if​ you'd like to have​ $10,000 in the account in 10​ years?

$$P = F(P/F, i, N) = \$10,000 (P/F, 5\%, 10) = \$10,000(0.6139) = \$6,139$$


### Finding $i$ and $N$
- Finding the interest rate $i$ given $N$ and $P$
$$F = P(1+i)^N$$
$$i = \sqrt{F/P} - 1$$

### Class Assignment Continued
3. In​ 1803, Napoleon sold the Louisiana Territory to the United States for​ $0.04 per acre. In​ 2017, the average value of an acre at this location is​ $10,000. What annual compounded percentage increase in value of an acre of land has been​ experienced?

P = $0.04
F = $10,000
N = 2017 - 1803 = 214

$$\therefore i = \sqrt{\frac{10000}{0.04} } - 1 = 0.0598 = \% 5.98$$


4. How long does it take​ (to the nearest whole​ year) for​ $1,000 to quadruple in value when the interest rate is​ 15% per​ year?
F = 4000
P = 1000
i = 15%

![[Pasted image 20230123094837.png]]


5. An enterprising student invests​ $1,000 at an annual interest rate that will grow the original investment to​ $2,000 in 4 years. In 4 more​ years, the amount will grow to​ $4,000, and this pattern of doubling every 4 years repeats over a total time span of 36 years. How much money will the student gain in 36​ years? What is the magical annual interest rate the student is​ earning?

P = 1000
N = 36 years

What is i?
What is F?
![[Pasted image 20230123095020.png]]

F = 512000




### Extra In-Class Example
Date: January 27th, 2022

**Problem Statement:** Your company has a $100,000 loan for a new security system it just bought. The annual payment is $8,800 and the interest rate is 8% per year for 30 years. Your company decides that it can afford to pay $10,000 per year.
1. After how many payments (year) will the loan be paid off?
2. How much will your company save in interest after paying the loan this way?

**Part 1**
$P = \$100,000$, $A = \$8,800$, $N_1 = 30\ years$, $i = 8\%$, $A_2 = \$10,000$

$N_2 = NPER(rate, Amt, Pv) = NPER(8\%, -\$10,000, \$100,000) = 21 Years$

The loan will take 10 years to pay off.

**Part 2**
- Accumulated interest from annual $8,800 payments for 30 years:

$$I_1 = \$8,800 (30) - \$ 100,000 = \$ 166,400$$

- Accumulated interest from annual $10,000 payments for 21 years:

$$I_2 = \$10,000 (21) - \$ 100,000 = \$ 110,000$$

Savings in Interest: 

$$I_2 - I_1 = \$56,400$$

You save $56,400 in interest by paying a little extra for loans.



## Section 4.9 - 4.11

### Deferred Annuity (Uniform Series)
**Problem Statement**: Irene just purchased a new sports car and wants to also set aside cash for future maintenance expenses. The car has a bumper-to-bumper warranty for the first five years. Irene estimates that she will need approximately $2,000 per year in maintenance expenses for years 6-10, at which time she will sell the vehicle. **How much money should Irene deposit into an account today, at 8% per year, so that she will have sufficient funds in that account to cover her projected maintenance expenses?**

- Deferred annuities are Uniform series that do not begin until some time in the future.
- If the annuity is deferred $J$ periods, then the first payment (cash flow) begins at the end of period $J+1$.
- Finding the present value of a Deferred Annuity is a two-step processes:
1. Use $P/A, i\%, N-J)$ to find the value of the deferred annuity at the end of period $J$ (where there are N-J cash flows in the annuity).
2. Use $(P/F, i\%, J)$ to find the value of the deferred annuity at time zero.
$$P_0 = A(P/A, i\%, N-J)(P/F, i\%, J)$$

### In-Class Assignment
Example 1 Question 1.
Leon and Heidi decided to invest $3,000 annually for only the first eight years of their marriage. The first payment was made at age 25. If the annual interest rate is 10%, how much accumulated interest and principal will they have at age 65?











