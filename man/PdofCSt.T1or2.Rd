\name{PdofCSt.T1or2}
\alias{PdofCSt.T1or2}
\alias{PdofCSt.cyc2}
\alias{PofCSGt}
\title{ Exact PCS, When Selecting t=1 or t=2 or More Populations }
\description{
  PdofCSt.T1or2 calls PofCSt to implement the d-best PCS formula for the case of t=1 or t=2 
populations.  It is called by PdofCSt.cyc2, which implements the d-best PCS formula for 
general t populations.  PofCSGt calls PofCSt to implement the G-best formula for general t. 
These functions are modular and implement the time reduction techniques of Cui and Wilson (2007).
}
\usage{
PdofCSt.T1or2(theta, T, d, m = 20, tol = 1e-08)
PdofCSt.cyc2(theta, T, d, m = 20, tol = 1e-08)
PofCSGt(theta, T, Gd, m = 20, tol = 1e-08)
}
\arguments{
  \item{theta}{  Vector of statistics (or parameters) from which it is desired to select 
			the top t of them }
  \item{T}{  The number of statistics (or parameters) desired to be selected }
  \item{d}{  The d-best selection parameter (scalar) }
  \item{Gd}{  The G-best selection parameter (scalar) }
  \item{m}{  Number of nodes employed in the Gauss-Hermite quadrature }
  \item{tol}{  Tolerance parameter to set the cut-off level for the inclusion of additional 
		probability components in PCS }
}

\value{ The probability of correct selection. }
\references{ 
Cui, X. and Wilson, J.  2007.  On How to Calculate the Probability of Correct Selection for Large k 
Populations.  University of California, Riverside Statistics Department Technical Report 297.
\url{ https://docs.google.com/a/biola.edu/viewer?a=v&pid=sites&srcid=YmlvbGEuZWR1fGphc29ud2lsc29ufGd4OjJmYTY2YTJjY2EwYjg2ZmY }
}
\author{ Jason Wilson <jason.wilson@biola.edu> }
\seealso{ \code{\link{PofCSt}}, \code{\link{PdofCSt.T1or2}}, \code{\link{PdofCSt.cyc2}}, \code{\link{PofCSGt}}  }

\keyword{ htest }
