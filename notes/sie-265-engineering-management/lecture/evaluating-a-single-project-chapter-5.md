# Evaluating A Single Project | Chapter 5



## Section 5.1 - 5.3

### Single Project Economic Evaluation
**Objective**: We will be able to evaluate the economic trade-off between annual savings/revenues of an investment project and the up-front and ongoing costs of that project to determine whether it is a smart trade-off


Proposed capital projects can be evaluated in several ways:
- Present Worth
- Future Worth
- Annual Worth
- Internal Rate of Return (IRR)
- External Rate of Return (ERR)
- Payback Period (generally not appropriate as a primary decision rule)

To be attractive, a capital project must provide a return that exceed a minimum level established by the top management of an organization.

This minimum level is reflected in a firm's **Minimum Attractive Rate of Return (MARR)**

In theory, the MARR is sometimes called the **hurdle rate**, it should be chosen to maximize the economic well-well being of an organization

Many elements contribute to determining the MARR:
- Account, source, and const of money available
- Number and purpose of good projects available
- Perceived risk of investment opportunities.
- Type of organization (e.g., government, utility company, private company)


### Present Worth (PW) Method
Present worth is based on the concept of equivalent worth of all cash flows relative to some base or beginning point in time.

PW Deesicino Rule:
$$If PW (i=MARR) \ge 0$$
Then the investment is justified.


It is important to observe that the higher the interest rate and the farther into the future a cash flow occurs, the lower its PW is.

![[Pasted image 20230206094434.png]]

*Example*: PW of $1,000 recieved at end of ear k at an interest rate of i% per year.


### Example
A retrofitted space heating system is being considered for a small office building. The system can be purchased and installed for \$100,000, and it will save an estimated 300,000 kilowatt-hours 9kWh) of electric power each year over a six-year period. A kilowatt-hour of electricity costs \$0.10, and the company uses a MARR 15% per year in its economic evaluations of refurbished systems. The market value of the system will be \$8,000 at the end of six years, and the additional annual operating and maintenance expenses are negligible. Use the PW method to determine whether this system should be installed.

**Solution**
$$P_{0\_investment} = 100,000; N = 6; MARR = 15\%, F_{6\_futurevalue}$$




### Bond Value

- Bond value is a good example of present worth.
- A bond is an IOU where you agree  to lend the bond issuer money , $V_{N}$, for a specified length of time $N$ and yield rate per period $i$
- In return, you receive:
	- Periodic interest payments, $rZ$, where $Z$ is the face (par) value.
	- A single payment equal in amount to $C$ when the bond is reutered or sole, where $C$ is redemption of disposal price.
- The commercial value of a bond is the Present Worth of the future net cash flows that are expected to be received through ownership of an interest-bearing certificate.

The present worth (PW) of a bond is:
$$V_{N} = C\left(\frac{P}{F}, i\%, N\right) + rZ\left(\frac{P}{A}, i\%, N\right)$$

where,
![[Pasted image 20230208091808.png]]

**Example 1**
A bond with a face value of $5,000 pays interest of 8% per year. This bond will be redeemed at par value at the end of its 20-year life, and the first interest payment is due one year form now.
- How much should be paid now for this bond in order to receive a yield of 10% per year on the investment?
$$V_{N} = C\left(\frac{P}{F}, i\%, N\right) + rZ\left(\frac{P}{A}, i\%, N\right)$$
$$V_{N} = 5000\left(\frac{P}{F}, 10\%, 20\right) + (8\%)(5000)\left(\frac{P}{A}, 10\%, 20\right)$$
$$V_{N} = 5000(0.148644) + (8\%)(5000)(8.5136)$$
$$V_{N} = 743.22 + 3405.4 = \$4148.66$$

- If this bond is purchased now for $4,600, what annual yield would the buyer receive?


### Capitalized Worth (CW)
- Capitalized worth (CW) is the present worth of all revenues or expenses over an infinite length of time (i.e., perpetual series)
- If only expenses are considered, this is sometimes referred to as **capitalized costs**
- The capitalized worth method is especially useful in problems involving endowments and public projects with indefinite lives.
- The CW of a series of end-of-period uniform perpetual payments A, with interest $i$% per period is:
$$CW(i\%) = PW_{N\rightarrow \infty} = A\left(\frac{P}{A,}i\%, \infty \right)= A \left[lim_{N\rightarrow \infty} \frac{(1+i)^{N}-1}{i(i+1)^{N}}\right]= A\frac{1}{i}$$

But what analysis period (N), is practically speaking, defined as forever?

**Example 2:**
Betty has decided to donate some funds to her local community college. Betty would like to fund an endowment that will provide a scholarship of $25,000 each year in perpetuity, and also a special award, “Student of the Decade,” each ten years (again, in perpetuity) in the amount of $50,000. How much money does Betty need to donate today, in one lump sum, to fund the endowment? Assume the fund will earn a return of 8% per year.

- First, convert the 'Student of the Decade' funds into an equivalent annual amount over the ten years:
$$A = 50,000\left(\frac{A}{F,}8\%, 10\right)= 3,451.47$$


- We can add this to the annual scholarship (25,000) and then use the capitalized worth to bring it all back to time zero.


**Example 3**
A new bridge across the Cumberland River is being planned near a busy highway intersection in the commercial part of a mid-western town. The construction (first) cost of the bridge is $1,900,000 and annual upkeep is estimated to be $25,000. In addition to annual upkeep, major maintenance work is anticipated every eight years at a cost of $350,000 per occurrence. The town government’s MARR is 8% per year. If the bridge has an expected life of 50 years, what is the capitalized worth (CW) of the bridge over a 100-year study period?

[TODO] **Look at the posted slides this time.**



# Section 5.5 | Evaluating a Single Project

### Annual Worth

- An equal periodic series of dollar amounts that is *equivalent* to the cash inflows and outflows, at an interest rate that is generally the MARR.

AW Decision Rule: $\text{If AW}(i = MARR) \ge 0$, the project is economically justified.

- The AW of a project is equivalent to its PW and FW.

$$AW = PW\left(\frac{A}{P,}i\%, N\right)$$

$$AW = FW\left(\frac{A}{F}, i\%, N\right)$$

The AW of a project is periodic equivalent revenue or savings minus expenses, lesss its annual capital recovery (CR) amount.

$$AW(i\%) = R - E - CR(i\%)$$

When revenues are absent, AW(i%) is seen as the **Equivalent Uniform Annual Cost EUAC(i%)**

A low valued EUAC is preferred to a high valued EUAC

### Capital Recovery #capitalRecovery
Capital recovery reflects the annual equivalent invested capital cost of the asset.

The capital recovery (CR) reflects the following items:
- Loss in values of the asset
- Interest on the invested capital (at the MARR)
- The capital recovery (CR) distributes the initial cost (I) and the salvage (Market) value (s) across the life of the asset. 

$$CR(i\%) = I\left(\frac{A}{P,}i\%, N\right) - S\left(\frac{A}{F}, i\%, N\right)$$

- If the investment will be spread over several periods, then the $I$ is the PW of all investment amounts.


### Assumptions when using PW, FW, AW Methods: #assumptions

There are assumptions that we make when using PW, FW, AW, methods
1. We assume we know the future with certainty (we don't live in a certain world)
2. We assume we can borrow and lend money at the same interest rate (i.e. capital markets are perfect).
- More sophisticated models exits, but they usually do not reverse decisions made with the PW, FW, and AW methods
- A positive valued PW (and AW, and FW) means that accepting a project will increase its worth, or value, of the firm.



# Section 5.6

### Internal Rate of Return
- The Internal Rate of Return (IRR) method is the most widely used rate of return method for performing engineering economic analysis.
- The IRR is the interest rate that equates the equivalent worth (computed using PW, FW, or AW)  of an alternative's cash **inflows** to the equivalent worth of cash **outflows**.
- The IRR can be seen as the **break even interest rate**
- It is also called the **investor's method**, the **discounted cash flow** method, and the **profitability index**
- If the IRR is greater than the MARR, then the project is acceptable.
- For a single alternative from the lender's viewpoint, the IRR is not positive unless:
	- Both receipts and expenses are present in the cash-flow pattern
	- The sum of receipts exceeds the sum of all cash outflows
- Using a PW formulation, we see that the IRR is the i'% at which:
$$\sum\limits_{k=0}^{N}R_{k}\left(\frac{P}{F}, i'\%, k\right) = \sum\limits_{k=0}^{N}E_{k}\left(\frac{P}{F}, i'\%, k\right)$$
where:
- $R_k$ = net revenues or savings for the $k^{th}$ year.
- $E_k$ = net expenditures, including costs for the $k^{th}$ year.
- $N$ = project life


### Interpretation of IRR
- For an alternative with a single investment cost at the present time followed by a series of positive cash inflows over 𝑁, a graph of 𝑃𝑊 versus the interest rate typically has the general convex shown.
- The point at which $PW$ = 0 defines $i'\%$, which is the project’s $IRR$$. The value of $i'\%$ can also be determined as the interest rate at which $FW$ = 0 or $AW$ = 0
- The difference between a project's IRR and the required return (i.e., MARR) is viewed by management as a measure of investment safety. A large difference signals a wider margin of safety (or less relative risk).

A higher internal rate of return is better, but we don't compare IRRs between project.

### Challenges in Applying the IRR Method
- It is computationally difficult without proper tools.
- In rare instances, multiple rates of return can b found. In this case, try another equivalence method
![[Pasted image 20230213092726.png]]
- The IRR method must be carefully applied and interpreted when comparing two more mutually exclusive alternatives (e.g., do not directly compare internal rates of return). More on that in Chapter 6.

**Example 5-13**
A piece of new equipment has been proposed by engineers to increase the productivity of a certain manual welding operation. The investment cost is $25,000, and the equipment will have a market (salvage) value of $5,000 at the end of its expected life of five years. Increased productivity attributable to the equipment will amount to $8,000 per year after extra operating costs have been subtracted from the value of the additional production. Use a spreadsheet to evaluate the IRR of the proposed equipment. Is the investment a good one? Recall that the MARR is 20% per year.


Solution by Excel: 
IRR = RATE(nper, pmt, pv, fv)
IRR = RATE(5, 8000, -2500, 5000)
IRR = 0.2158 
IRR = 21.58%

**OR**

IRR = IRR(-25000, 8000, 8000, 8000, 8000, (8000+5000))

The internal rate of return (21.58%) is grater than the MARR (20%) Thus, we can conclude that the new equipment is economically feasible.

But what if the net annual savings estimate is revised to be \$7,500 instead of $8,000?
The IRR is then 19.xx%, which is less than the MARR. This is called sensitivity analysis.


### Installment Financing


- A rather common application of the IRR method is in so-called installment fincancing types of problems.
- These problems are associated with financing arrangements for purchasing merchandise 'on time'
- The **total interest**, or finance, charge is often paid by the borrower based on the **amount owed at the beginning** of the loan instad of the unpaid loan balance.
	- Clearly, a finance charge based solely on the entire amount of money borrowed involves payment of interest on money not actually borrowed for the full term.  
	- This practice leads to an actual interest rate that often greatly exceeds the stated interest rate.

- To determine the true interest rate being charged in such cases, the IRR method is frequently employed.






























