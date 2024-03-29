\name{PCS.boot.par}
\alias{PCS.boot.par}
\alias{PCS.exact}
\alias{PCS.boot.np}
\title{ Probability of Correct Selection (PCS) Calculator }
\description{
  These functions calculate the probability of correct selection (PCS) with G-best, 
d-best, and L-best selection as described in Cui & Wilson (2008) and Cui, Zhao, & Wilson (2008).  
The specific parameters (G,d,L), distributional assumptions (normal, Student's t, non-parametric),
and calculation method (exact, bootstrap) are user-settable. 
}
\usage{
PCS.boot.par(theta, T = 1:1, G = NULL, D = NULL, L = NULL, B = 100, SDE = 1, 
	dist = c("normal", "t"), df = 14, trunc = 6)
PCS.boot.np(X1, X2, T = 1, G = 1, D = NULL, B, trunc = 6)
PCS.exact(theta, t = 1, g = NULL, d = NULL, m = 20, tol = 1e-08)
}
\arguments{
  \item{theta}{  Vector of statistics (or parameters) from which it is desired to select 
			the top t of them }
  \item{T}{  Vector of the number of statistics (or parameters) desired to be selected }
  \item{t}{  The number of statistics (or parameters) desired to be selected (scalar) }
  \item{G}{  Vector of G-best selection parameters }
  \item{g}{  The G-best selection parameter (scalar) }
  \item{D}{  Vector of d-best selection parameters }
  \item{d}{  The d-best selection parameter (scalar) }
  \item{L}{  Vector of L-best selection parameters }
  \item{X1}{ k by n1 matrix of data.  k is the number of populations and n1 the sample size 
		of the first treatment. }
  \item{X2}{ k by n2 matrix of data.  k is the number of populations and n2 the sample size 
		of the second treatment. }
  \item{B}{  Bootstrap sample size }
  \item{SDE}{  Standard error of the statistics theta (row-wise) }
  \item{dist}{  Distributional assumption used for estimating PCS }
  \item{df}{  Common degrees of freedom for one of the t-statistics in theta;
		the parameter is only used if dist="t" }
  \item{trunc}{  Number of standard errors below the minimum selected
		population to disregard in the estimation of PCS; it is a truncation parameter
		to decrease run time }
  \item{m}{  Number of nodes employed in the Gauss-Hermite quadrature }
  \item{tol}{  Tolerance parameter to set the cut-off level for the inclusion of additional 
		probability components in PCS }
}
\details{
  The probability of correct selection (PCS) is a single statistic calculated on a vector of sample 
statistics whose interpretation is the probability that the top t populations selected according to
the sample rank would be the true top t populations.  PCS may be used in addition to, or
instead of, multiple comparison procedures.  The PCS package is an implementation of the formulas
and ideas in Cui & Wilson (2008) and Cui, Zhao, & Wilson (2008).
\cr
After a multi-population experiment is conducted, whether with one, two, or more treatments, a vector of 
one sample statistic for each population is obtained.  This vector is theta.  Suppose theta has length k.  
The user will want to know the probability of correctly selecting some number t of the k populations.
T is a vector of all such t desired to be checked.  When k is large, the resulting probabilities can be 
uncomfortably small, even if the corresponding multiple-testing p-values are significant.
In order to increase the resulting probabilities (PCS), three tuning parameters have been devised.
\cr
g is the number of populations which will be selected in addition to t.  Thus, g+t populations are selected, 
only t of which must be the true top t populations in order to be considered correct.  (Cui & Wilson 2007).
G is a vector of such g's.  Scalar g is used in the exact function (PCS.exact) and vector G is used in the bootstraps 
(PCS.boot.par & PCS.boot.np).
\cr
d does not directly specify a number of additional populations.  Rather, d is the number of standard errors 
above and below the statistic whose rank is t (hereafter the "tth" statistic).  The other statistics 
which fall in this range are considered close enough to the top t statistics which will be considered 
comparable to the tth population and therefore considered correct (since the tth statistic is an estimate
of the tth population parameter).  Thus, t populations are selected, 
but a random subset of the populations determined by d are considered "close enough" to the top t and are 
also considered correct (Cui & Wilson 2007).  D is a vector of such d's.  Scalar d is used in the exact function 
(PCS.exact) and vector D is used in the bootstraps (PCS.boot.par & PCS.boot.np).  The above interpretation holds when 
the statistics of theta are standardized (SDE=1); when they are not, then d represents the number of units 
from the tth statistic, where the units are given by the data.  Simulation studies suggest d>2 often produces 
significantly biased PCS when standardized statistics are used.  Therefore, it is recommended that d<=2 be used when
theta is standardized and d not greater than two standard errors when theta is not standardized.
\cr
l is the number of populations, out of the top t, which need to be included in the selected t to be considered 
a correct selection.  Thus, t populations are selected, only l of which must be in the true top t, in order to 
be considered correct.  (Cui & Wilson & Zahn 2008).  L is a vector of such l.  The parameter has not been 
implemented in the exact function (PCS.exact) or the non-parametric bootstrap (PCS.boot.np), only the 
parametric bootstrap (PCS.boot.par).
\cr
The run time of the function is directly proportional to the bootstrap sample size, B, (as well as the number
of elements of T, D, G, and L).  In practice, it is recommended that preliminary runs us a small B (e.g. B=100),
in order to obtain estimates of PCS (off by several percent).  Then, when the desired parameters for final 
calculations are known, B should be run at B=10000, or more, depending on the application.
\cr
The SDE needs to be supplied by the user (this potential inconvenience 
is balanced by serving to make the code more general).  
If the statistics in theta are already standardized, as they often will be, then SDE=1.  If the statistics in 
theta are not standardized, then a form of pooled standard error could be used for SDE.  As for distributional 
assumptions, PCS.exact assumes a normal distribution on the elements of theta.  PCS.boot.par allows for a 
"normal" or a "t" (Student's t, with degrees of freedom = df) distribution.  PCS.boot.np is non-parametric, 
and requires significantly larger sample sizes in order to accurately estimate PCS (see Cui & Wilson 2009). 
In order to reduce run time, PCS.exact implements a tolerance parameter, tol, at four different levels of 
the calculations.  It is defaulted conservatively to 1e-8 in order to produce answers exact to at least five 
decimal places of accuracy.  PCS.boot.par and PCS.boot.np both implement a truncation parameter that reduces 
the size of the bootstrapped theta vector.  It works by cutting the vector 'trunc' standard errors below the 
maximum Tth element of theta.  trunc=6 produced no loss of accuracy on the runs attempted, while a loss of 
over 1% accuracy began to be noticed using trunc = 4.  Lastly, PCS.exact uses a Gauss-Hermite quadrature, 
and m is the number of nodes employed.  It is defaulted to m=20, which produced the same accuracy, to four or 
more decimal places, as m=1000.
\cr
As is customary in the Ranking and Selection literature, the three functions PCS.exact, PCS.boot.par, and PCS.boot.np 
all assume that the best statistics in theta are the largest.  If the best statistics are the smallest, then a simple
conversion will allow the functions to work equally well on the data.  See the examples.
}
\value{
  For PCS.exact, the value is a scalar of the PCS for the parameters entered.  For PCS.boot.par and 
PCS.boot.np, a matrix is returned whose rows are the entries of G, D, or L and 
whose columns are the entries of T.  If more than one of G, D, or L is entered, then a list is returned, 
where the G element of the list is the G-best matrix, the d element is the d-best matrix, and the 
L element is the L-best matrix.
}
\references{ 
Cui, X. and Wilson, J.  2007.  On How to Calculate the Probability of Correct Selection for Large k 
Populations.  University of California, Riverside Statistics Department Technical Report 297.
\url{ https://docs.google.com/a/biola.edu/viewer?a=v&pid=sites&srcid=YmlvbGEuZWR1fGphc29ud2lsc29ufGd4OjJmYTY2YTJjY2EwYjg2ZmY }
\cr
Cui, X. and Wilson, J.  2008.  On the Probability of Correct Selection for Large k Populations, 
with Application to Microarray Data.  Biometrical Journal, 50:5, 870-883.
\url{ https://docs.google.com/a/biola.edu/viewer?a=v&pid=sites&srcid=YmlvbGEuZWR1fGphc29ud2lsc29ufGd4OjE2YjI4MGRkNzA0ZTRjMDc }
\cr
Cui, X. and Wilson, J.  2009.  A Simulation Study on the Probability of Correct Selection for Large k Populations.  
Communications in Statistics: Simulation and Computation.  38:6.
\url{ https://docs.google.com/a/biola.edu/viewer?a=v&pid=sites&srcid=YmlvbGEuZWR1fGphc29ud2lsc29ufGd4OjMxYTdjNjJkNzY3NTU4NzA }
\cr
Cui, X.; Zhao, H. and Wilson, J.  2010.  Optimized Ranking and Selection Methods for Feature Selection with Application in Microarray Experiments.  Journal of Biopharmaceutical Statistics.  Volume 20, No. 2, pp. 223-239.
\url{ https://docs.google.com/a/biola.edu/viewer?a=v&pid=sites&srcid=YmlvbGEuZWR1fGphc29ud2lsc29ufGd4OjY0ZTJkNDNlMzNiNjE0ZDg }
\cr
Golub, T. et al.  1999.  Molecular Classification of Cancer Class Discovery and Class Prediction 
by Gene Expression Monitoring.  Science.  286:531-537.
}

\author{Jason Wilson,
Maintainer: Jason Wilson <jason.wilson@biola.edu>
}

\examples{
##### Small example for PCS.boot.par & PCS.exact
theta = c(1.0, 1.5, 1.7, 2.3, 2.5, 4.2)
T = c(1,2,3,5); G = 0:3; D = c(0.5,1,1.5); L = 1:2
PCS.boot.par(theta, T, G, D, L, B=100, SDE=1, dist="normal", trunc=6)
PCS.exact(theta, t=2, g=1, d=NULL, m=20, tol=1e-8)

#The above assumes the largest thetas are best.
#To select the smallest thetas, reverse the order of the indices, e.g.
theta.new = max(theta) - theta + min(theta)
T = c(1,2,3,5); G = 0:3; D = c(0.5,1,1.5); L = 1:2
PCS.boot.par(theta.new, T, G, D, L, B=100, SDE=1, dist="normal", trunc=6)
PCS.exact(theta.new, t=2, g=1, d=NULL, m=20, tol=1e-8)

##### Small example for PCS.boot.np
k=20 #number of populations
n=10 #sample size
SD=.1 #standard deviation
theta = seq(0,6,length.out=k)
X1 = rnorm(k*n,0,SD)   #Sample 1
X1 = matrix(X1,nrow=k,ncol=n,byrow=FALSE)
X2 = rnorm(k*n,theta,SD) #Sample 2, shifted
X2 = matrix(X2,nrow=k,ncol=n,byrow=FALSE)
T = c(1,2,3,5); G = 0:3; D = c(0.5,1,1.5); L = 1:2
PCS.boot.np(X1, X2, T, G, D, B=10, trunc=6)

##### Microarray example of t-statistics with PCS.boot.par
require(multtest)
data(golub)  	#Load microarray data
sub = 500	#Subset index for speed
ans = tindep(golub[1:sub,1:27], golub[1:sub,28:38], flag=1) #Obtain t-statistics
golub.T = sort(abs(ans[,1]))  	#Massage t-statistics
T=c(1,5,10,25,50,92); G=c(1,10,25,50,150); D=c(0,1,2) #Set PCS parameters
df=18 			  #Degrees of freedom from Satterthwaite approximation
sde=sqrt((18/(18-2))/19)  #Estimate SDE by MOM SD, divided by mean sample size
PCS.boot.par(golub.T, T, G, D, L=NULL, B=100, SDE=sde, dist="t", df=18) #Small B for speed

##### Microarray example of Golub's correlation statistics
##### (see reference) with PCS.boot.par
require(multtest)
data(golub)  					#Load microarray data
Pgc <- function(x,y) {  		#Function to calculate Golub's correlation statistics
  xbar1 = apply(x,1,mean)
  xbar2 = apply(y,1,mean)
  sd1   = apply(x,1,sd)
  sd2   = apply(y,1,sd)
  Pgc = abs((xbar1-xbar2))/(sd1+sd2)
  return(Pgc)
} #end function
sub = 500	#Subset index for speed
Pgc.gol = Pgc(golub[1:sub,1:27],golub[1:sub,28:38]) #Calculate correlation statistics
T=c(1,5,10,25,50,92); G=c(1,10,25,50,150); D=c(0,1,2) #Set PCS parameters
sde=0.20 		#Obtained by simulation on Golub data
PCS.boot.par(Pgc.gol, T, G, D, L=NULL, B=100, SDE=0.2, dist="t", df=18) #Small B for speed

##### Microarray example using non-parametric bootstrap
require(multtest)
data(golub)  							#Load microarray data
T=c(1,5,10); G=c(1,3,5); D=c(0,1,2) 	#Set PCS parameters
sub = 100	#Subset index for speed
PCS.boot.np(golub[1:sub,1:27], golub[1:sub,28:38], T, G, D, B=10, trunc=6) #Small B for speed
}

\keyword{ htest }
