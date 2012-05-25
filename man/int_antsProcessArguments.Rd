\name{int_antsProcessArguments}
\alias{int_antsProcessArguments}

\title{
Extract pointer
}

\description{
Extract the external pointer in the object as a string.
}

\usage{
int_antsExtractXptrAsString( object )
}

\arguments{
\item{object}{
Object of class \code{antsImage} or \code{antsImageList} or \code{antsMatrix} or a R fundamental class.
}
}

\value{
string of the form <pointer: xxxxx> -- Success ; NA -- Failure
}

\author{
Shrinidhi KL
}

\keyword{internal}
