\name{G.H.Quad}
\alias{G.H.Quad}
\title{Gauss-Hermite Quadrature function}
\description{
  Performs Gauss-Hermite Quadrature for an arbitrary number of nodes.  Function for use in PofCSt.
}
\usage{
G.H.Quad(x, m)
}
\arguments{
  \item{x}{  is an m-vector upon which Gauss-Hermite Quadrature is to be applied }
  \item{m}{  is the number of nodes desired for the Gauss-Hermite Quadrature }
}
\details{ This function uses gauss.quad.prob in the statmod package to perform Gauss-Hermite 
Quadrature inside of the PofCSt function. }
\value{ The result of the Gauss-Hermite Quadrature. }
\references{ Hildebrand, F.B.  1956.  Introduction to Numerical Analysis.  McGraw-Hill. }
\author{ Jason Wilson, <jason.wilson@biola.edu> }
\seealso{ \code{\link{PofCSt}} }

\keyword{ math }
