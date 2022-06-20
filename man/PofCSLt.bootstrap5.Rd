\name{PofCSLt.bootstrap5}
\alias{PofCSLt.bootstrap5}
\title{ Parametric Bootstrap for Computing L-best PCS }
\description{
  Parametric bootstrap for computing L-best PCS.  This function is called by the wrapper PCS.boot.np.
}
\usage{
PofCSLt.bootstrap5(theta, T, L, B, SDE, dist = c("normal", "t"), 
     df = 14, trunc = 6, est.names = c("O"))
}
\arguments{
  \item{theta}{  Vector of statistics (or parameters) from which it is desired to select 
			the top t of them }
  \item{T}{  Vector of the number of statistics (or parameters) desired to be selected }
  \item{L}{  Vector of L-best selection parameters }
  \item{B}{  Bootstrap sample size }
  \item{SDE}{  Standard error of the statistics theta (row-wise) }
  \item{dist}{  Distributional assumption used for estimating PCS }
  \item{df}{  Common degrees of freedom for one of the t-statistics in theta;
		the parameter is only used if dist="t" }
  \item{trunc}{  Number of standard errors below the minimum selected
		population to disregard in the estimation of PCS; it is a truncation parameter
		to decrease run time }
  \item{est.names}{  Kind of shrinkage estimator employed.  Default estimator 
		is "O" for the Olkin estimator.  Other estimators will be considered for future releases. }
}

\value{
  An array, the non-empty part of which is a matrix whose rows are the entries of L and 
whose columns are the entries of T.
}
\references{ 
Cui, X.; Zhao, H. and Wilson, J.  2010.  Optimized Ranking and Selection Methods for Feature Selection with Application in Microarray Experiments.  Journal of Biopharmaceutical Statistics.  Volume 20, No. 2, pp. 223-239.
\url{ https://docs.google.com/a/biola.edu/viewer?a=v&pid=sites&srcid=YmlvbGEuZWR1fGphc29ud2lsc29ufGd4OjY0ZTJkNDNlMzNiNjE0ZDg }
}
\author{ Jason Wilson <jason.wilson@biola.edu> }
\seealso{ \code{\link{PCS.boot.par}} }

\keyword{ htest }
