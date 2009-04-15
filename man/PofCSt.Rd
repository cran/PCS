\name{PofCSt}
\alias{PofCSt}
\title{ Probability of correct selection (PCS) for selecting t out of k populations }
\description{
  Implementation of the Gupta & Liang (1998) formula for computing the probability of 
correct selection (PCS) for selecting t out of k populations.  The results are exact
up to a user-settable tolerance parameter.  This function is modular and is called by 
PdofCSt.T1or2, PdofCSt.cyc2, and PofCSGt.
}
\usage{ PofCSt(theta, T, m, tol = 1e-07) }
\arguments{
  \item{theta}{ \code{theta} Vector of statistics (or parameters) from which it is desired to select 
			the top t of them }
  \item{T}{ \code{T} The number of statistics (or parameters) desired to be selected }
  \item{m}{ \code{m} Number of nodes employed in the Gauss-Hermite quadrature }
  \item{tol}{ \code{tol} Tolerance parameter to set the cut-off level for the inclusion of additional 
		probability components in PCS }
}
\details{ The analytic formula for computing PCS for t of k populations is an integral whose integrad
is the product of normal densities.  This function obtains the appropriate values and computes the
integral using a Gauss-Hermite quadrature.  See equation 2.4 of Gupta (1998). }
\value{ The probability of correct selection. }
\references{ 
Cui, X. and Wilson, J.  2007.  On How to Calculate the Probability of Correct Selection for Large k 
Populations.  University of California, Riverside Statistics Department Technical Report 297.
\url{ http://www.bubbs.biola.edu/~jason.wilson/Article2_tech_techreport.pdf }
\cr
Gupta, S.S. and Liang, T.C.  1998.  Simultaneous lower confidence bounds for probabilities of correct 
selections. Journal of Statistical Planning and Inference.  72(1-2), 279-290.
}
\author{ Jason Wilson, <jason.wilson@biola.edu> }
\seealso{ \code{\link{PdofCSt.T1or2}}, \code{\link{PdofCSt.cyc2}}, \code{\link{PofCSGt}} }
\examples{ }

\keyword{ htest }
