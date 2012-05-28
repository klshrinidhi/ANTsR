\name{[-methods}
\docType{methods}
\alias{[-methods}
\alias{[,antsImage,array,antsRegion-method}
\alias{[,antsImage,array,ANY-method}
\alias{[,antsImage,list,ANY-method}
\alias{[,antsImage,logical,antsRegion-method}
\alias{[,antsImage,logical,ANY-method}
\alias{[,antsImage,matrix,antsRegion-method}
\alias{[,antsImage,matrix,ANY-method}
\alias{[,antsImage,NULL,antsRegion-method}
\alias{[,antsImage,NULL,ANY-method}
\alias{[,antsImage,NULL,NULL-method}
\alias{[,antsImage,NULL,numeric-method}
\alias{[,antsImage,numeric,NULL-method}
\alias{[,antsImage,numeric,numeric-method}

\title{ Methods for Function \code{[} in Package \pkg{base} }
\description{
Set of methods extract a \code{numeric vector} from an \code{antsImage}.
}

\usage{
# Extract the pixels of the entire image into an array -- form 1
\S4method{[}{antsImage,NULL,ANY}(x,i)
\S4method{[}{antsImage,logical,ANY}(x,i)
\S4method{[}{antsImage,array,ANY}(x,i)
\S4method{[}{antsImage,matrix,ANY}(x,i)
# Extract the pixels of a region in the image using an array -- form 2
\S4method{[}{antsImage,list,ANY}(x,i)
\S4method{[}{antsImage,NULL,antsRegion}(x,i,j)
\S4method{[}{antsImage,logical,antsRegion}(x,i,j)
\S4method{[}{antsImage,array,antsRegion}(x,i,j)
\S4method{[}{antsImage,matrix,antsRegion}(x,i,j)
# Extract the pixels of the entire image into a vector -- form 3
\S4method{[}{antsImage,NULL,NULL}(x,i,j,k,l)
\S4method{[}{antsImage,numeric,numeric}(x,i,j,k,l)
\S4method{[}{antsImage,NULL,numeric}(x,i,j,k,l)
\S4method{[}{antsImage,numeric,NULL}(x,i,j,k,l)
}

\section{Methods}{
  \describe{

  \item{\code{signature(x = "antsImage", i = "array", j = "antsRegion")}}{
  }

  \item{\code{signature(x = "antsImage", i = "array", j = "ANY")}}{
  }

  \item{\code{signature(x = "antsImage", i = "list", j = "ANY")}}{
  }

  \item{\code{signature(x = "antsImage", i = "logical", j = "antsRegion")}}{
  }

  \item{\code{signature(x = "antsImage", i = "logical", j = "ANY")}}{
  }

  \item{\code{signature(x = "antsImage", i = "matrix", j = "antsRegion")}}{
  }

  \item{\code{signature(x = "antsImage", i = "matrix", j = "ANY")}}{
  }

  \item{\code{signature(x = "antsImage", i = "NULL", j = "antsRegion")}}{
  }

  \item{\code{signature(x = "antsImage", i = "NULL", j = "ANY")}}{
  }

  \item{\code{signature(x = "antsImage", i = "NULL", j = "NULL")}}{
  }

  \item{\code{signature(x = "antsImage", i = "NULL", j = "numeric")}}{
  }

  \item{\code{signature(x = "antsImage", i = "numeric", j = "NULL")}}{
  }

  \item{\code{signature(x = "antsImage", i = "numeric", j = "numeric")}}{
  }
  }
}

\arguments{
\item{x}{
Image object of S4 class 'antsImage' to be indexed.
}

\item{i}{
  \itemize{
  \item{
    Usage forms 1,2 -- \code{x[i]},\code{x[i,j]} -- \code{logical vector/matrix/array} to be used as mask while extracting pixel values from the image. \code{1/TRUE}s return corresponding pixel values ; \code{0/FALSE}s return \code{NA}. The vector provided will be 'matched' against the image-region column-wise meaning that first column of image-region is extracted using first column-length values from the vector, second column is extracted using the next column-length values from the vector and so on. Default: entire region is extracted.
  }
  \item{
    Usage forms 2 -- \code{x[i]} -- \code{list} of named arguments containing names 'mask' and 'region'. \code{lst$mask} is used as 'mask' and \code{lst$region} is used as 'region'.
  }
  \item{
    Usage forms 3 -- \code{x[i,j,k,l]} -- \code{numeric vector} used to select the 'row' dimension of the image. Use 'NULL' to access the entire 'row' of the image.
  }
  }
}

\item{j}{
  \itemize{
  \item{
    Usage forms 2 -- \code{x[i,j]} -- \code{antsRegion} with in the \code{antsImage} to be considered for extraction. An \code{antsRegion} object can be created using \code{new}. Default: largest-possible-region( entire image ) in the image.
  }
  \item{
    Usage forms 3 -- \code{x[i,j,k,l]} -- \code{numeric vector} used to select the 'column' dimensin of the image. Use 'NULL' to access the entire 'column' of the image.
  }
  }
}

\item{k}{
  Usage forms 3 -- \code{x[i,j,k,l]} -- \code{numeric vector} used to select the 'slice' dimension of the image. Use 'NULL' to access the all 'slice's of the image.
}

\item{l}{
  Usage forms 3 -- \code{x[i,j,k,l]} -- \code{numeric vector} used to select the 'time' dimension of the image. Use 'NULL' to access all the 'time's of the image.
}
}

\details{
  \describe{
  \item{All forms}{
    When not specified, image-region considered is the largest-possible-region( entire image ) of the image.
  }

  \item{\code{x[i,j]} , \code{x[i,j,...]}}{
    Number of indices must match the number of dimensions of the image. A 2D image requires and allows indices 'row' and 'col' only. A 3D image requires and allows indices 'row', 'col' and 'slice' only. A 4D image requires and allows indices 'row', 'col', 'slice' and 'time'.
  }
  }
}

\value{
  \code{numeric vector} of dimensions equal to that of 'region' considered or number of 'pixels' considered -- Success ; NA -- Failure \cr
}

\author{
Shrinidhi KL
}

\examples{
\dontrun{
# extract a vector from an image 'img' of class 'antsImage' by considering only the region starting at index (1,1,1) with size (10,10,10) ;
# here the first 10 elements of vect correspond to first column ( row = 1:10 , col = 1 , slice = 1 ) of image-region, next 10 elements come from
# second column ( row = 1:10 , col = 2 , slice = 1 ) of the image-region and so on
reg = new( "antsRegion" , index = c(1,1,1) , size = c(10,10,10) )
vect = img[ NULL , region = reg ] # OR
vect = img[ list( mask = NULL , region = reg ) ]
# set the values of pixels in the square ( row = 1:10 , col = 1:10 , slice = 3 ) using the vector c(1:100) ; 
# here the first column ( row = 1:10 , col = 1 , slice = 3 ) of image gets values c(1:10), second column ( row = 1:10 , col = 2 , slice = 3 ) gets
# values c(11:20) and so on
img[ 1:10 , 1:10 , 3 ] <- c(1:100)
}
}

\keyword{methods}
