\name{QMMRecalibrate}
\alias{QMMRecalibrate}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Probability of Default Calibration using Quasi Moment Matching Algorithm
}
\description{
Calibrates conditional probabilities of default (PD) according to Quasi Moment Matching (QMM) algorithm. \cr
Calibration is based on target accuracy ratio (AR) and mean portfolio PD (Central Tendency). For the information purposes, also AR standard deviation is estimated using bootstrap approach.
}
\usage{
QMMRecalibrate(pd.uncond.new, pd.cond.old, portf.uncond, portf.condND = NULL,
AR.target = NULL, rating.type = "RATING", calib.curve = "robust.logit")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{pd.uncond.new}{
Target Mean PD (Central Tendency) for the portfolio. 
}
  \item{pd.cond.old}{
Conditional PD distribution.
}
  \item{portf.uncond}{
Unconditional portfolio distribution.
}
  \item{portf.condND}{
Conditional on non-default portfolio distribution. \cr
If portf.condND is NULL, portf.uncond will be used as a proxy. 
}
  \item{AR.target}{
Target accuracy ratio(AR), in case is NULL - implied by pd.cond.old AR is used (\code{\link[LDPD:ARestimate]{ARestimate}} is called for AR estimation purposes).
}
  \item{rating.type}{
In case 'RATING', each item in the portf.uncond contains number of counterparts in a given rating class. \cr
In case 'SCORE', each item in the portf.uncond is treated as an exact score of counterparty.
}
  \item{calib.curve}{
In case 'logit', simple logit calibration curve is used (is applicable only for rating.type = 'SCORE'). \cr
In case 'robust.logit', robust logit function is used (see Tasche D. (2013) for details).
}
}
\details{
PD curve is fitted using robust logit function proposed by D. Tasche.\cr
For the information purposes output of the function also contains PD fitted using target CT and AR plus/minus one standard deviation.
}
\value{
\item{alpha }{Itercept parameter of the calibration curve.}
\item{beta }{Slope parameter of the calibration curve.}
\item{CT.ac }{Mean PD after calibration, e.g. target CT.}
\item{AR.ac }{AR after calibration, e.g. target AR.}
\item{CT.bc }{Mean PD before calibration, as implied by conditional PDs and portfolio unconditional distribution.}
\item{AR.bc }{AR before calibration estimated from conditional PDs.}
\item{AR.sdev }{AR standard deviation (based on sample data).}
\item{condPD.ac }{Conditional PDs after QMM calibration.}
\item{condPD.bc }{Conditional PDs before calibration.}
\item{condPD.ac.upper }{Conditional PDs given AR as initial AR plus one standard deviation and target CT.}
\item{condPD.ac.lower }{Conditional PDs given AR as initial AR minus one standard deviation and target CT.}
\item{portf.cumdist }{Cumulative portfolio distribution needed to estimate logit PDs (conditional on non-default portfolio distribution if such data is given).}
\item{portf.uncond }{Unconditional portfolio distribution from the worst to the best credit quality.}
\item{rating.type }{In case 'RATING', each item in the portf.uncond contains number of counterparts in a given rating class. \cr
In case 'SCORE', each item in the portf.uncond is treated as an exact score of counterparty.}
}
\references{
Tasche, D. (2009) Estimating discriminatory power and PD curves when the number of defaults is small. Working paper, Lloyds Banking Group. \cr
Tasche, D. (2013) The art of probability-of-default curve calibration. Journal of Credit Risk, 9:63-103.
}
\author{
Denis Surzhko <densur@gmail.com>
}
\note{
Portfolio and default data should be sorted by rating classes from lowest credit quality to higher one.
}

\seealso{
\code{\link[LDPD:QMMPlot]{QMMPlot}}
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
