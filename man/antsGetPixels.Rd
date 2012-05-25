\name{antsGetPixels}
\alias{antsGetPixels}

\title{
antsGetPixels
}

\description{
Read the pixels of an object of class 'antsImage'.
}

\usage{
antsGetPixels( x , i , j , k , l )
}

\arguments{
\item{x}{
Non-empty object of class 'antsImage'.
}

\item{i}{
Index vector to select rows.
}

\item{j}{
Index vector to select cols.
}

\item{k}{
Index vector to select slice.
}

\item{i}{
Index vector to select time.
}
}

\value{
Numeric vector of pixel values -- Success\cr
                             1 -- Failure
}

\author{
Shrinidhi KL
}

\keyword{internal}
