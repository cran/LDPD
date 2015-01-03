\name{LDPD-package}
\alias{LDPD-package}
\alias{LDPD}
\docType{package}
\title{
Probability of Default Calibration
}
\description{
Implementation of most popular approaches to PD (probability of default) calibration: Quasi Moment Matching approach, M.van der Burgt algorithm, K.Pluto and D.Tasche's most prudent estimate methodology.
}
\details{
\tabular{ll}{
Package: \tab LDPD\cr
Type: \tab Package\cr
Version: \tab 1.0.2\cr
Date: \tab 2015-01-03\cr
License: \tab GPL-2\cr
}
The package implements three most popular among practitioners approaches to PD calibration: \cr
  \enumerate{
    \item Quasi Moment Matching approach proposed by D.Tasche (see \code{\link[LDPD:QMMRecalibrate]{QMMRecalibrate}}).
    \item M. van der Burgt algorithm based on CAP curve smoothing (see \code{\link[LDPD:VDBCalibratePD]{VDBCalibratePD}}).
    \item K.Pluto and D.Tasche "most prudent" estimate methodology (see \code{\link[LDPD:PTOnePeriodPD]{PTOnePeriodPD}},\code{\link[LDPD:PTMultiPeriodPD]{PTMultiPeriodPD}}).
  }
}
\author{
Denis Surzhko <densur@gmail.com>
}
\references{
Pluto, K. and Tasche, D. (2005) Thinking Positively. Risk, August, 72-78.\cr
Van der Burgt, M. (2008) Calibrating low-default portfolios, using the cumulative accuracy profile. Journal of Risk Model Validation, 1(4):17-33. \cr
Tasche, D. (2009) Estimating discriminatory power and PD curves when the number of defaults is small. Working paper, Lloyds Banking Group. \cr
Tasche, D. (2013) The art of probability-of-default curve calibration. Journal of Credit Risk, 9:63-103.
}

\keyword{ credit risk }
\keyword{ probability of default }
\keyword{ PD calibration }
\keyword{ low default porfolios }
\keyword{ PD calibration }

\seealso{
\code{\link[LDPD:QMMRecalibrate]{QMMRecalibrate}} 
\code{\link[LDPD:VDBCalibratePD]{VDBCalibratePD}}
\code{\link[LDPD:PTOnePeriodPD]{PTOnePeriodPD}}
\code{\link[LDPD:PTMultiPeriodPD]{PTMultiPeriodPD}}
\code{\link[Hmisc:somers2]{somers2}}
}
\examples{
# PD calibration using Multi-period Pluto and Tasche approach
portfolio <- c(10,20,30,40,10)
defaults <- c(1,2,0,0,0)
PTMultiPeriodPD(portfolio, defaults, 0.3, cor.St = 0.3, kT = 5, kNS = 1000, conf.interval = 0.5)

# PD Calibration using M. van der Burgt algorithm, 
# portfolio distribution is given by rating classes.
portf.rating <- c(20,50,60,70,10,5)
VDBCalibratePD(portf.rating, 0.1, 0.15, 0.5, rating.type = 'RATING')
# PD Calibration using M. van der Burgt algorithm, 
# portfolio distribution is given by scores.
portf.scores <- seq_len(1000)
VDBCalibratePD(portf.scores, 0.1, 0.15, 0.5, rating.type = 'SCORE')

# PD calibration using QMM algorithm, 
# portfolio distribution is given by rating classes.
pd <- c(0.2, 0.1, 0.005, 0.001, 0.001)
porfolio <- c(100, 200, 200, 200, 100)
qmm <- QMMRecalibrate(0.05, pd, porfolio, rating.type = 'RATING')
# Plot results of PD calibration.
QMMPlot(qmm)
}
