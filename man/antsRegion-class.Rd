\name{antsRegion-class}
\Rdversion{1.1}
\docType{class}
\alias{antsRegion-class}
\alias{[<-,antsImage,array,antsRegion,ANY-method}
\alias{[<-,antsImage,logical,antsRegion,ANY-method}
\alias{[<-,antsImage,matrix,antsRegion,ANY-method}
\alias{[<-,antsImage,NULL,antsRegion,ANY-method}
\alias{[,antsImage,array,antsRegion-method}
\alias{[,antsImage,logical,antsRegion-method}
\alias{[,antsImage,matrix,antsRegion-method}
\alias{[,antsImage,NULL,antsRegion-method}

\title{Class \code{"antsRegion"}}
\description{
S4 class representing a region in an 'antsImage'. 
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("antsRegion", ...)}. A region constructed this way can be used to index into a non-empty 'antsImage' to Get or Set pixels.
}
\section{Slots}{
  \describe{
    \item{\code{index}:}{Object of class \code{"numeric"} Coordinates of start of the region within the image in the form (row,col,slice,time) depending on dimensions of the image. }
    \item{\code{size}:}{Object of class \code{"numeric"} Extents of the region within the image in the form (numrows,numcols,numslices,numtime) depending on the dimensions of the image. }
  }
}
\section{Methods}{
  \describe{
    \item{[<-}{\code{signature(x = "antsImage", i = "array", j = "antsRegion", value = "ANY")}: Set an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[<-}{\code{signature(x = "antsImage", i = "logical", j = "antsRegion", value = "ANY")}: Set an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[<-}{\code{signature(x = "antsImage", i = "matrix", j = "antsRegion", value = "ANY")}: Set an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[<-}{\code{signature(x = "antsImage", i = "NULL", j = "antsRegion", value = "ANY")}: Set an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[}{\code{signature(x = "antsImage", i = "array", j = "antsRegion")}: Get an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[}{\code{signature(x = "antsImage", i = "logical", j = "antsRegion")}: Get an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[}{\code{signature(x = "antsImage", i = "matrix", j = "antsRegion")}: Get an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[}{\code{signature(x = "antsImage", i = "NULL", j = "antsRegion")}: Get an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
	 }
}
\author{
Shrinidhi KL
}
\examples{
showClass("antsRegion")
}
\keyword{classes}
