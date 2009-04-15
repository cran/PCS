\name{PofCSLt.bootstrap5}
\alias{PofCSLt.bootstrap5}
\title{ Parametric bootstrap for computing L-best PCS }
\description{
  Parametric bootstrap for computing L-best PCS.  This function is called by the wrapper PCS.boot.np.
}
\usage{
PofCSLt.bootstrap5(theta, T, L, B, SDE, dist = c("normal", "t"), df = 14, trunc = 6, est.names = c("O"))
}
\arguments{
  \item{theta}{ \code{theta} Vector of statistics (or parameters) from which it is desired to select 
			the top t of them }
  \item{T}{ \code{T} Vector of the number of statistics (or parameters) desired to be selected }
  \item{L}{ \code{L} Vector of L-best selection parameters }
  \item{B}{ \code{B} Bootstrap sample size }
  \item{SDE}{ \code{SDE} Standard error of the statistics theta (row-wise) }
  \item{dist}{ \code{dist} Distributional assumption used for estimating PCS }
  \item{df}{ \code{df} Common degrees of freedom for one of the t-statistics in theta;
		the parameter is only used if dist="t" }
  \item{trunc}{ \code{trunc} Number of standard errors below the minimum selected
		population to disregard in the estimation of PCS; it is a truncation parameter
		to decrease run time }
  \item{est.names}{ \code{est.names} Kind of shrinkage estimator employed.  Default estimator 
		is "O" for the Olkin estimator.  Other estimators will be considered for future releases. }
}
\details{ }
\value{
  An array, the non-empty part of which is a matrix whose rows are the entries of L and 
whose columns are the entries of T.
}
\references{ 
Cui, X.; Zhao, H. and Wilson, J.  2008.  Optimization of Gene Selection in Microarray Experiments.  Submitted.
}
\author{ Jason Wilson, <jason.wilson@biola.edu> }
\seealso{ \code{\link{PCS.boot.par}} }
\examples{ }

\keyword{ htest }
