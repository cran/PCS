\name{PCS-package}
\alias{PCS-package}
\alias{PCS}
\docType{package}
\title{ Probability of Correct Selection (PCS) }

\description{ These functions calculate the probability of correct selection (PCS) with G-best, 
d-best, and L-best selection as described in Cui & Wilson (2008) and Cui, Zhao, & Wilson (2008).  
The specific parameters (G,d,L), distributional assumptions (normal, Student's t, non-parametric),
and calculation method (exact, bootstrap) are user-settable.
}

\details{
\tabular{ll}{
Package: \tab PCS\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2009-04-15\cr
License: \tab What license is it under?\cr
LazyLoad: \tab yes\cr
}
Probability of Correct Selection (PCS) is the probability of selecting the best t of k populations.
This package allows the user to calculate the PCS for a given dataset.  When k is large, even if the best 
t populations are significantly different from the rest, the PCS may be small due to sample variance.  To
address this issue, Cui & Wilson (2008, 2009) developed three tuning parameters whereby the definition of 
correct selection is modified (d-best, G-best, L-best) to more realistic and acceptable standards for 
large k problems.  This package is the implementation of these three definitions, using different 
calculation methods. 

The PCS package consists of three primary functions for users: PCS.boot.par, PCS.boot.np, and PCS.exact.
PCS.boot.par and PCS.boot.np use parametric and non-parametric bootstraps, respectively, to calculate 
d-best, G-best, and L-best PCS.  PCS.boot.par is the fastest function for large k problems.  
It is expected to be the most commonly used, as the parametric distributional (normal & Student's t) 
assumptions are reasonable and moderately robust (Cui & Wilson 2009).  When k is large and the 
distributional assumptions are not met, then PCS.boot.np may be used.  For information regarding the 
necessary sample size, see (Cui & Wilson 2009).  When k is small to moderate, PCS.exact may be used to 
obtain PCS using the analytic formula. 
}

\author{Jason Wilson,
Maintainer: Jason Wilson <jason.wilson@biola.edu>
}

\note{ I would like to thank Xinping Cui for her support while creating this package, Thomas Girke
for use of the UCR Bioinformatics Cluster, Bushi Wang for stress testing the code, and God for all
the help on the way.
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
Communications in Statistics - Simulation and Computation, 38:6.
\url{ https://docs.google.com/a/biola.edu/viewer?a=v&pid=sites&srcid=YmlvbGEuZWR1fGphc29ud2lsc29ufGd4OjMxYTdjNjJkNzY3NTU4NzA }
\cr
Cui, X.; Zhao, H. and Wilson, J.  2010.  Optimized Ranking and Selection Methods for Feature Selection with Application in Microarray Experiments.  Journal of Biopharmaceutical Statistics.  Volume 20, No. 2, pp. 223-239.
\url{https://docs.google.com/a/biola.edu/viewer?a=v&pid=sites&srcid=YmlvbGEuZWR1fGphc29ud2lsc29ufGd4OjY0ZTJkNDNlMzNiNjE0ZDg}
}

\keyword{ htest }
\keyword{ math }

\examples{
##### Small example for PCS.boot.par & PCS.exact
theta = c(4.2, 2.5, 2.3, 1.7, 1.5, 1.0)
theta = sort(theta)
T = c(1,2,3,5); G = 1:3; D = c(0.5,1,1.5); L = 1:2
PCS.boot.par(theta, T, G, D, L, B=100, SDE=1, dist="normal", df=14, trunc=6)
PCS.exact(theta, t=2, g=1, d=NULL, m=20, tol=1e-8)

##### Small example for PCS.boot.np
k=20 #number of populations
n=10 #sample size
SD=.1 #standard deviation
theta = seq(0,6,length.out=k)
X1 = rnorm(k*n,0,SD)   #Sample 1
X1 = matrix(X1,nrow=k,ncol=n,byrow=FALSE)
X2 = rnorm(k*n,theta,SD) #Sample 2, shifted
X2 = matrix(X2,nrow=k,ncol=n,byrow=FALSE)
T = c(1,2,3,5); G = 1:3; D = c(0.5,1,1.5)
PCS.boot.np(X1, X2, T, G, D, B=100, trunc=6)

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
