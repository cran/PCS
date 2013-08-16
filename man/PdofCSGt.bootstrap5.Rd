\name{PdofCSGt.bootstrap5}
\alias{PdofCSGt.bootstrap5}
\title{ Parametric bootstrap for computing G-best and d-best PCS }
\description{
  Parametric bootstrap for computing G-best and d-best PCS.  This function is called by the wrapper PCS.boot.par.
}
\usage{
PdofCSGt.bootstrap5(theta, T, D, G, B, SDE, dist = c("normal", "t"), 
	df = 14, trunc = 6, est.names = c("O"))
}
\arguments{
  \item{theta}{  Vector of statistics (or parameters) from which it is desired to select 
			the top t of them }
  \item{T}{  Vector of the number of statistics (or parameters) desired to be selected }
  \item{D}{  Vector of d-best selection parameters }
  \item{G}{  Vector of G-best selection parameters }
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
  An array, the non-empty part of which is a matrix whose rows are the entries of G or D and 
whose columns are the entries of T.  If both G and D are entered, then a list is returned, 
where the $G element is the G-best matrix, the $d element is the d-best matrix.  
}
\references{ 
Cui, X. and Wilson, J.  2007.  On How to Calculate the Probability of Correct Selection for Large k 
Populations.  University of California, Riverside Statistics Department Technical Report 297.
\url{ http://www.bubbs.biola.edu/~jason.wilson/Article2_tech_techreport.pdf }
}
\author{ Jason Wilson, <jason.wilson@biola.edu> }
\seealso{ \code{\link{PCS.boot.par}} }

\keyword{ htest }
