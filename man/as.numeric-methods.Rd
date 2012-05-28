\name{as.numeric-methods}
\docType{methods}
\alias{as.numeric-methods}
\alias{as.numeric,antsImage-method}
\alias{as.numeric,ANY-method}
\alias{as.numeric}

\title{ Methods for Function \code{as.numeric} in Package \pkg{base} }
\description{
Convert/coerce an \code{antsImage} object to a \code{numeric vector}. More precisely, extract a \code{numeric vector} from an \code{antsImage}.
}

\usage{
\S4method{as.numeric}{antsImage}(x,mask,region)
}

\arguments{
\item{x}{
  Image object of S4 class 'antsImage' to be coerced.
}

\item{mask}{
  \code{logical vector/matrix/array} to be used as mask while extracting pixel values from the image. \code{1/TRUE}s return corresponding pixel values ; \code{0/FALSE}s return \code{NA}. The vector provided will be 'matched' against the image-region column-wise meaning that first column of image-region is extracted using first column-length values from the vector, second column is extracted using the next column-length values from the vector and so on. Default: entire region is extracted.
}

\item{region}{
  \code{antsRegion} with in the \code{antsImage} to be considered for extraction. An \code{antsRegion} object can be created using \code{new}. Default: largest-possible-region( entire image ) in the image.
}
}

\section{Methods}{
  \describe{

  \item{\code{signature(x = "antsImage")}}{
  }

  \item{\code{signature(x = "ANY")}}{
  }
  }
}

\value{
  \code{numeric vector} of dimensions equal to that of 'region' considered -- Success ; NA -- Failure
}

\author{
Shrinidhi KL
}

\examples{
  \dontrun{
    # extract a vector from an image 'img' of class 'antsImage' by considering only the region starting at index (1,1,1) with size (10,10,10)
    reg = new( "antsRegion" , index = c(1,1,1) , size = c(10,10,10) )
    vect = as.numeric( img , region = reg )
  }
}

\keyword{methods}
