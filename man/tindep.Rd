\name{tindep}
\alias{tindep}
\title{ Standardized Scores for Two Independent Samples }
\description{
  Calculate the independent two-sample Welch t-statistics for k populations simultaneously. 
This function is used in PCS.bootstrap.np.  It may also be used to summarize data from two sample experiments 
for use in PCS.exact and PCS.bootstrap.par.
}
\usage{
tindep(X, Y, flag = 0)
}
\arguments{
  \item{X}{  k by n1 matrix of data.  k is the number of populations and n1 the sample size 
		of the first treatment. }
  \item{Y}{  k by n2 matrix of data.  k is the number of populations and n2 the sample size 
		of the second treatment. }
  \item{flag}{  Determines whether the output is t-statistics (flag=0) or t-statistics with p-values 
		(flag!=0) }
}
\details{
  X & Y are the data matrices for input.  When called inside of the function PCS.bootstrap.np, or when 
used to obtain t-statistics for use with PCS.exact and PCS.bootstrap.par, setting 'flag'=0 will return the 
needed vector of t-statistics.  If flag!=0, then the function 'mt.rawp2adjp' from the multtest 
library is called, producing multiple comparison adjustd pvalues ("Bonferroni", "Holm", "Hochberg", 
"SidakSS", "SidakSD", "BH", "BY").  The t-statistics and p-values are stored in a matrix.
}
\value{
  If flag = 0, the result is a k by 1 vector of t-statistics.
  If flag != 0, the result is a k by 7 vector of t-statistics and pvalues (see details).
}
\author{ Jason Wilson <jason.wilson@biola.edu> }
\seealso{ \code{\link{PCS.boot.np}}  }
\examples{
### Small example
k=20 #number of populations
n=10 #sample size
SD=.1 #standard deviation
theta = seq(0,6,length.out=k)
X1 = rnorm(k*n,0,SD)   #Sample 1
X1 = matrix(X1,nrow=k,ncol=n,byrow=FALSE)
X2 = rnorm(k*n,theta,SD) #Sample 2, shifted
X2 = matrix(X2,nrow=k,ncol=n,byrow=FALSE)
tindep(X1,X2, flag=1)

### Microarray example
#require(multtest)
data(golub)
sub = 500 #Subset index for speed
golub.Tp = tindep(golub[1:sub,1:27], golub[1:sub,28:38], flag=0) #Obtain t-statistics + p-values

ans = tindep(golub[1:sub,1:27], golub[1:sub,28:38], flag=1)  #Obtain t-statistics
golub.T = sort(abs(ans[,1]))
}

\keyword{ htest }
