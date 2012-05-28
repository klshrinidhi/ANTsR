\name{antsImageList-class}
\Rdversion{1.1}
\docType{class}
\alias{antsImageList-class}

\title{Class \code{"antsImageList"}}
\description{
S4 class to represent a list of images. Useful for functions that accept and return a list of images a an argument.
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("antsImageList", pixeltype, dimension)}. Imagelist created this way will have invalid external pointer in the slot 'pointer' right after construction. At this point the imagelist is considered 'empty'. This kind of construction is used to create a buffer to hold the result of a function like 'Atropos'. After a successful function call like this, the imagelist will become a valid object that can be converted to an R list of 'antsImage's.
}
\section{Slots}{
  \describe{
    \item{\code{pixeltype}:}{Object of class \code{"character"}. C++ datatype used to represent the pixels in the image. Allowed values: "double", "float", "unsigned int", "unsigned char".}
    \item{\code{dimension}:}{Object of class \code{"integer"}. Number of dimensions of the image. Allowed values: 4, 3, 2}
    \item{\code{pointer}:}{Object of class \code{"externalptr"}. External pointer to the actual images in the memory. User should \emph{not} set or manipulate it at any point.}
  }
}
\section{Methods}{
  \describe{
    \item{int_antsExtractXptrAsString}{\code{signature(object = "antsImageList")}: \emph{internal} method for extracting the external pointer of ANTs object as a string. Not written for users of the package.}
	 }
}
\author{
Shrinidhi KL
}
\examples{
showClass("antsImageList")
}
\keyword{classes}
