\name{VDBCalibratePD}
\alias{VDBCalibratePD}
\title{
Probability of Default Calibration using M. Van Der Burgt Algorithm
}
\description{
Calibrates conditional probabilities of default (PD) according to algorithm proposed by M. van der Burgt. \cr
Decomposition of PDs by rating classes is based on smoothed Cumulative Accuracy Profile (CAP) curve and target mean portfolio PD (Central Tendency - CT).
}
\usage{
VDBCalibratePD(portf.uncond, pd.uncond.old, pd.uncond.new, AR, rating.type)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{portf.uncond}{
Unconditional portfolio distribution.
}
  \item{pd.uncond.old}{
Unconditional PD of the sample on which AR had been estimated (in case is zero, approximation AR = 2*AUC - 1 is used for parameters estimation).  
}
  \item{pd.uncond.new}{
Target Mean PD (Central Tendency) for the portfolio.
}
  \item{AR}{
Accuracy ration (AR) of the ranking model.
}
  \item{rating.type}{
In case 'RATING', each item in the portf.uncond contains number of counterparts in a given rating class. \cr
In case 'SCORE', each item in the portf.uncond is treated as an exact score of counterparty.
}
}
\details{
One parameter approximation of CAP curve is used. Parameter is fitted in the way that the AUC (Cumulative Accuracy Profile)  implied by the provided AR should be equal to the area under the approximation curve. 
}
\value{
\item{pd.cond }{Conditional PDs after calibration.}
\item{portf.cumdist }{Cumulative portfolio distribution needed to estimate logit PDs (conditional on non-default if such data is given).}
\item{portf.uncond }{Unconditional portfolio distribution from the worst to the best credit quality.}
\item{rating.type }{In case 'RATING', each item in the portf.uncond contains number of counterparts in a given rating class.
In case 'SCORE', each item in the portf.uncond is treated as an exact score of counterparty.}
}
\references{
Van der Burgt, M. (2008) Calibrating low-default portfolios, using the cumulative accuracy profile. Journal of Risk Model Validation, 1(4):17-33.
}
\author{
Denis Surzhko <densur@gmail.com>
}
\note{
Portfolio and default data should be sorted by rating classes from lowest credit quality to higher one.
}
\seealso{
\code{\link[LDPD:ARestimate]{ARestimate}}
}
\examples{
portf.rating <- c(20,50,60,70,10,5)
portf.scores <- seq_len(1000)
VDBCalibratePD(portf.scores, 0.1, 0.15, 0.5, rating.type = 'SCORE')
VDBCalibratePD(portf.rating, 0.1, 0.15, 0.5, rating.type = 'RATING')
}

\keyword{ credit risk }
\keyword{ probability of default }
\keyword{ PD calibration }

