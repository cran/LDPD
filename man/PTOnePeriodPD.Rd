\name{PTOnePeriodPD}
\alias{PTOnePeriodPD}
\title{
One-period Pluto and Tasche Model
}
\description{
Estimates probability of default according to One-period Pluto and Tasche model.
}
\usage{
PTOnePeriodPD(portf.uncond, portf.def, conf.interval = 0.9)
}
\arguments{
  \item{portf.uncond}{
Unconditional portfolio distribution (e.g. number of counterparts by rating classes).
}
  \item{portf.def}{
Number of defaults by rating classes.
}
  \item{conf.interval}{
Confidence interval for PD estimation.
}
}
\details{
Implementation of simple one-period Pluto and Tasche probability of default (PD) calibration model.
}
\value{
Conditional PDs according to one-period Pluto and Tasche model 
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
\code{\link[LDPD:PTMultiPeriodPD]{PTMultiPeriodPD}}
}
\examples{
portfolio <- c(10,20,30,40,10)
defaults <- c(1,2,0,0,0)
PTOnePeriodPD(portfolio, defaults, conf.interval = 0.5)
}
\keyword{ credit risk }
\keyword{ probability of default }
\keyword{ PD calibration }
\keyword{ low default porfolios }

