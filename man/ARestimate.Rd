\name{ARestimate}
\alias{ARestimate}

\title{
  Accuracy Ratio estimation
}
\description{
Estimate AR (Accuracy Ratio) and mean portfolio PD (probability of default) based on conditional PDs and portfolio unconditional distribution.
}
\usage{
ARestimate(pd.cond, portf.uncond, rating.type = "RATING")
}
\arguments{
  \item{pd.cond}{
      Conditional PD distribution (should be sorted from the worst to the best credit quality).
}
  \item{portf.uncond}{
        Unconditional portfolio distribution (should be sorted from lowest credit quality to higher one).
}
  \item{rating.type}{
      In case 'RATING', each item in the portf.uncond should contain number of companies in each rating class. \cr
      In case 'SCORE', each item in the portf.uncond is an exact score.
}
}
\details{
Approach to AR estimation is consistent with the algorithm proposed by D.Tasche in the paper: Estimating discriminatory power and PD curves when the number of defaults is small. Working paper, Lloyds Banking Group, 2009. \cr
Mean portfolio PD (also known as Central Tendency of the portfolio) is estimated using unconditional portfolio distribution.
}
\value{
    \item{AR }{Estimated accuracy ratio}
    \item{CT }{Mean PD in the portfolio}
}
\references{
Tasche, D. (2009) Estimating discriminatory power and PD curves when the number of defaults is small. Working paper, Lloyds Banking Group. \cr
Tasche, D. (2013) The art of probability-of-default curve calibration. Journal of Credit Risk, 9:63-103.
}
\author{
Denis Surzhko <densur@gmail.com>
}
\note{
The algorithm is using conditional PDs as an input. In case one needs to estimate AR from actual default statistic (BAD/GOOD data), one can use, for example, \code{\link[Hmisc:somers2]{somers2}}.  
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link[LDPD:QMMRecalibrate]{QMMRecalibrate}} 
\code{\link[Hmisc:somers2]{somers2}}
}
\examples{

pd.cond <- c(0.1, 0.05, 0.025, 0.01, 0.001)  # PD for given rating class 
portf.uncond <- c(10, 20, 30, 50, 10)  # Number of borrowers in each rating class
ARestimate(pd.cond, portf.uncond, rating.type = "RATING")
  
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ PD calibration }
\keyword{ Accurancy Ratio } % __ONLY ONE__ keyword per line
\keyword{ Gini }
