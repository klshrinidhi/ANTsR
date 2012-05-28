\name{Comparison-lesserequal-methods}
\docType{methods}
\alias{<=-methods}
\alias{<=,antsImage,ANY-method}
\alias{<=,ANY,ANY-method}

\title{ Methods for Function \code{<=} in Package \pkg{base} }
\description{
Relational operator \code{<=} for \code{antsImage}.
}

\usage{
\S4method{<=}{antsImage,ANY}(e1,e2)
}

\section{Methods}{
  \describe{

  \item{\code{signature(e1 = "antsImage", e2 = "ANY")}}{
  }

  \item{\code{signature(e1 = "ANY", e2 = "ANY")}}{
  }
  }
}

\arguments{
\item{e1}{
  Image object of S4 class 'antsImage' to be indexed.
}

\item{e2}{
  \itemize{
  \item{
    Scalar \code{numeric} to be compared to the pixel values. Image-region considered is the largest-possible-region( entire image ) of the image.
  }
  \item{
    \code{list} of named arguments containing names 'value' and 'region'. \code{lst$value} is used as 'value' and \code{lst$region} is used as the \code{antsRegion} within the image for comparison.
  }
  }
}
}

\value{
\code{logical vector} of dimensions equal to that of 'region' considered -- Success ; NA -- Failure
}

\author{
Shrinidhi KL
}

\examples{
  \dontrun{
    # compare all the values in the region starting at index 'c(1,1,1)' with size 'c(10,10,10)' with value '20' ;
    # here the logical vector 'vect' will have dimensions '10*10*10'
    reg = new( "antsRegion" , index = c(1,1,1) , size = c(10,10,10) )
    vect = ( img <= list( value = 20 , region = reg ) )
    # compare all the pixels in the image with value '30' ;
    # here the logical vector 'vect' will have dimensions of the image
    vect = ( img <= 30 )
  }
}

\seealso{
\code{?"!=-methods"}, \code{?"<-methods"}, \code{?">=-methods"}, \code{?"==-methods"}, \code{?">-methods"}
}

\keyword{methods}
