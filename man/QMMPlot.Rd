\name{QMMPlot}
\alias{QMMPlot}
\title{
Plot Results of Probability of Default Calibration
}
\description{
Plot detailed results of probability of default calibration using Quasi Moment Matching algorithm.
}
\usage{
QMMPlot(x)
}
\arguments{
  \item{x}{
Output of \code{\link[LDPD:QMMRecalibrate]{QMMRecalibrate}}  function.
}
}
\details{
Plot contains conditional PD (probability of default) values:
\tabular{ll}{
  before re-calibration (sample Central Tendency and AR (accuracy ratio));\cr
  after re-calibration (target Central Tendency and AR);\cr
  upper confidence interval PDs (target Central Tendency and target AR minus one standard deviation of sample AR);\cr
  lower confidence interval PDs (target Central Tendency and target AR plus one standard deviation of sample AR).
  }
}
\value{
Plot of conditional PDs.
}
\references{
Tasche, D. (2009) Estimating discriminatory power and PD curves when the number of defaults is small. Working paper, Lloyds Banking Group. \cr
Tasche, D. (2013) The art of probability-of-default curve calibration. Journal of Credit Risk, 9:63-103.
}
\author{
Denis Surzhko <densur@gmail.com>
}
\note{
In case rating.type is 'RATING', PD plot is produced against unconditional cumulative portfolio distribution. \cr
In case rating.type is 'SCORE', PD plot is produced against scores.
}
\seealso{
\code{\link[LDPD:QMMRecalibrate]{QMMRecalibrate}}
}
\examples{
pd <- c(0.2, 0.1, 0.005, 0.001, 0.001)
porfolio <- c(100, 200, 200, 200, 100)
qmm <- QMMRecalibrate(0.05, pd, porfolio, rating.type = 'RATING')
QMMPlot(qmm)
}
\keyword{ credit risk }
\keyword{ probability of default }
\keyword{ PD calibration }
