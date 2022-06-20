\name{PdCSGt.bootstrap.NP2}
\alias{PdCSGt.bootstrap.NP2}
\title{ Non-Parametric Bootstrap for Computing G-best and d-best PCS }
\description{
  Non-parametric bootstrap for computing G-best and d-best PCS.  This function is called by the wrapper PCS.boot.np. 
}
\usage{
PdCSGt.bootstrap.NP2(X1, X2, T, D, G, N, trunc = 6)
}
\arguments{
  \item{X1}{  k by n1 matrix of data.  k is the number of populations and n1 the sample size 
		of the first treatment. }
  \item{X2}{  k by n2 matrix of data.  k is the number of populations and n2 the sample size 
		of the second treatment. }
  \item{T}{  Vector of the number of statistics (or parameters) desired to be selected }
  \item{D}{  Vector of d-best selection parameters }
  \item{G}{  Vector of G-best selection parameters }
  \item{N}{  The bootstrap sample size}
  \item{trunc}{  Number of standard errors below the minimum selected
		population to disregard in the estimation of PCS; it is a truncation parameter
		to decrease run time }
}

\value{
  A matrix whose rows are the entries of G or D and 
whose columns are the entries of T.  If both G and D are entered, then a list is returned, 
where the $G element is the G-best matrix, the $d element is the d-best matrix.  
}
\references{ 
Cui, X. and Wilson, J.  2009.  A Simulation Study on the Probability of Correct Selection for Large k Populations.  
Communications in Statistics: Simulation and Computation.  38:6.
\url{ https://docs.google.com/a/biola.edu/viewer?a=v&pid=sites&srcid=YmlvbGEuZWR1fGphc29ud2lsc29ufGd4OjMxYTdjNjJkNzY3NTU4NzA }
}
\author{ Jason Wilson <jason.wilson@biola.edu> }
\seealso{ \code{\link{PCS.boot.np}} }

\keyword{ htest }
