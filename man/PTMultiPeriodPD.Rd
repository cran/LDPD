\name{PTMultiPeriodPD}
\alias{PTMultiPeriodPD}
\title{
Multi-period Pluto and Tasche Model
}
\description{
Estimates probability of default (PD) according to Multi-period Pluto & Tasche model.
}
\usage{
PTMultiPeriodPD(portf.uncond, portf.def, rho, cor.St, kT, kNS = 1000, conf.interval = 0.9)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{portf.uncond}{
Unconditional portfolio distribution (e.g. number of counterparts by rating classes).
}
  \item{portf.def}{
Number of defaults by rating classes.
}
  \item{rho}{
Correlation with systematic factor.
}
  \item{cor.St}{
Correlation matrix of systematic factor realization through the time. In case constant is given - power matrix is used: \cr
Correlation matrix (i, j) = cor.St ^ |s - t|, s = 1..kT, t = 1..kT.
}
  \item{kT}{
Number of periods used in the PD estimation.
}
  \item{kNS}{
Number of simulations for integral estimation (using Monte-Carlo approach).
}
  \item{conf.interval}{
Confidence interval for PD estimation.
}
}
\details{
Estimates probabilities of default according to multi-period Pluto and Tasche model (additionally captures the inter-temporal correlation effects).
}
\value{
Conditional PDs according to Multi-period Pluto and Tasche model 
}
\references{
Pluto, K. and Tasche, D., 2005. Thinking Positively. Risk, August, 72-78.
}
\author{
Denis Surzhko <densur@gmail.com>
}
\note{
Portfolio and default data should be sorted by rating classes from lowest credit quality to higher one.
}

\seealso{
\code{\link[LDPD:PTOnePeriodPD]{PTOnePeriodPD}}
}
\examples{
portfolio <- c(10,20,30,40,10)
defaults <- c(1,2,0,0,0)
PTMultiPeriodPD(portfolio, defaults, 0.3, cor.St = 0.3, kT = 5, kNS = 1000, conf.interval = 0.5)
}

\keyword{ credit risk }
\keyword{ probability of default }
\keyword{ PD calibration }
\keyword{ low default porfolios }
