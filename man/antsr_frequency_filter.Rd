\name{antsr_frequency_filter}
\alias{antsr_frequency_filter}

\title{
Frequency Filter
}

\description{
Band-pass filter.
}

\usage{
antsr_frequency_filter( values , tr , freqLo , freqHi , nuis = NA )
}

\arguments{
\item{values}{
Numeric matrix or a data frame of values to be filtered.
}

\item{tr}{
TR to be used in ButterWorth.
}

\item{freqLo}{
Lower frequency threshold.
}

\item{freqHi}{
Higher frequency threshold.
}

\item{nuis}{
Default -- NA. nuis parameter.
}
}

\value{
filtered object data.frame -- Success\cr
                           1 -- Failure
}

\author{
Shrinidhi KL
}

\examples{
\dontrun{
# here 'mat' is an object of class 'antsMatrix'
filt_mat_df = antsr_frequency_filter( values = as.data.frame(mat) , tr = 0.15 , freqLo = 0.03 , freqHi = 0.1 )
}
}
