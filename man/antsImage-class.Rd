\name{antsImage-class}
\Rdversion{1.1}
\docType{class}
\alias{antsImage-class}
\alias{as.array,antsImage-method}
\alias{as.numeric,antsImage-method}
\alias{<=,antsImage,ANY-method}
\alias{<,antsImage,ANY-method}
\alias{==,antsImage,ANY-method}
\alias{>=,antsImage,ANY-method}
\alias{>,antsImage,ANY-method}
\alias{!=,antsImage,ANY-method}
\alias{[<-,antsImage,array,antsRegion,ANY-method}
\alias{[<-,antsImage,array,ANY,ANY-method}
\alias{[<-,antsImage,list,ANY,ANY-method}
\alias{[<-,antsImage,logical,antsRegion,ANY-method}
\alias{[<-,antsImage,logical,ANY,ANY-method}
\alias{[<-,antsImage,matrix,antsRegion,ANY-method}
\alias{[<-,antsImage,matrix,ANY,ANY-method}
\alias{[<-,antsImage,NULL,antsRegion,ANY-method}
\alias{[<-,antsImage,NULL,ANY,ANY-method}
\alias{[<-,antsImage,NULL,NULL,numeric-method}
\alias{[<-,antsImage,NULL,numeric,numeric-method}
\alias{[<-,antsImage,numeric,NULL,numeric-method}
\alias{[<-,antsImage,numeric,numeric,numeric-method}
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
\alias{int_antsExtractXptrAsString,antsImage-method}

\title{Class \code{"antsImage"}}
\description{
Encapsultates the external pointer to the underlying image along with details used to identify the 'type' of the image on C++ side.
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("antsImage", pixeltype, dimension)}. Image created this way will have invalid external pointer in the slot 'pointer' right after construction. At this point the image is considered 'empty'. This kind of construction is used to create a buffer to hold the result of a function like 'ThresholdImage'. After a successful function call like this, the image will become a valid object that can be used, for example to query a 'region'.
}
\section{Slots}{
  \describe{
    \item{\code{pixeltype}:}{Object of class \code{"character"}. C++ datatype used to represent the pixels in the image. Allowed values: "double", "float", "unsigned int", "unsigned char".}
    \item{\code{dimension}:}{Object of class \code{"integer"}. Number of dimensions of the image. Allowed values: 4, 3, 2}
    \item{\code{pointer}:}{Object of class \code{"externalptr"}. External pointer to the actual image in the memory. User should \emph{not} set or manipulate it at any point.}
  }
}
\section{Methods}{
  \describe{
    \item{as.array}{\code{signature(x = "antsImage")}: Create \code{array} from an \code{antsImage}. }
    \item{as.numeric}{\code{signature(x = "antsImage")}: Create \code{array} from an \code{antsImage}. }
    \item{<=}{\code{signature(e1 = "antsImage", e2 = "ANY")}: Pixelwise comparison optionally within an given region of \code{antsImage}. }
    \item{<}{\code{signature(e1 = "antsImage", e2 = "ANY")}: Pixelwise comparison optionally within an given region of \code{antsImage}. }
    \item{==}{\code{signature(e1 = "antsImage", e2 = "ANY")}: Pixelwise comparison optionally within an given region of \code{antsImage}. }
    \item{>=}{\code{signature(e1 = "antsImage", e2 = "ANY")}: Pixelwise comparison optionally within an given region of \code{antsImage}. }
    \item{>}{\code{signature(e1 = "antsImage", e2 = "ANY")}: Pixelwise comparison optionally within an given region of \code{antsImage}. }
    \item{!=}{\code{signature(e1 = "antsImage", e2 = "ANY")}: Pixelwise comparison optionally within an given region of \code{antsImage}. }
    \item{[<-}{\code{signature(x = "antsImage", i = "array", j = "antsRegion", value = "ANY")}: Set an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[<-}{\code{signature(x = "antsImage", i = "array", j = "ANY", value = "ANY")}: Set an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[<-}{\code{signature(x = "antsImage", i = "list", j = "ANY", value = "ANY")}: Set an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[<-}{\code{signature(x = "antsImage", i = "logical", j = "antsRegion", value = "ANY")}: Set an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[<-}{\code{signature(x = "antsImage", i = "logical", j = "ANY", value = "ANY")}: Set an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[<-}{\code{signature(x = "antsImage", i = "matrix", j = "antsRegion", value = "ANY")}: Set an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[<-}{\code{signature(x = "antsImage", i = "matrix", j = "ANY", value = "ANY")}: Set an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[<-}{\code{signature(x = "antsImage", i = "NULL", j = "antsRegion", value = "ANY")}: Set an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[<-}{\code{signature(x = "antsImage", i = "NULL", j = "ANY", value = "ANY")}: Set an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[<-}{\code{signature(x = "antsImage", i = "NULL", j = "NULL", value = "numeric")}: Set an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[<-}{\code{signature(x = "antsImage", i = "NULL", j = "numeric", value = "numeric")}: Set an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[<-}{\code{signature(x = "antsImage", i = "numeric", j = "NULL", value = "numeric")}: Set an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[<-}{\code{signature(x = "antsImage", i = "numeric", j = "numeric", value = "numeric")}: Set an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[}{\code{signature(x = "antsImage", i = "array", j = "antsRegion")}: Get an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[}{\code{signature(x = "antsImage", i = "array", j = "ANY")}: Get an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[}{\code{signature(x = "antsImage", i = "list", j = "ANY")}: Get an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[}{\code{signature(x = "antsImage", i = "logical", j = "antsRegion")}: Get an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[}{\code{signature(x = "antsImage", i = "logical", j = "ANY")}: Get an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[}{\code{signature(x = "antsImage", i = "matrix", j = "antsRegion")}: Get an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[}{\code{signature(x = "antsImage", i = "matrix", j = "ANY")}: Get an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[}{\code{signature(x = "antsImage", i = "NULL", j = "antsRegion")}: Get an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[}{\code{signature(x = "antsImage", i = "NULL", j = "ANY")}: Get an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[}{\code{signature(x = "antsImage", i = "NULL", j = "NULL")}: Get an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[}{\code{signature(x = "antsImage", i = "NULL", j = "numeric")}: Get an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[}{\code{signature(x = "antsImage", i = "numeric", j = "NULL")}: Get an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{[}{\code{signature(x = "antsImage", i = "numeric", j = "numeric")}: Get an \code{array} of pixels within an \code{antsRegion} using a \code{logical array} as index }
    \item{int_antsExtractXptrAsString}{\code{signature(object = "antsImage")}: \emph{internal} method for extracting the external pointer as a string }
	 }
}
\author{
Shrinidhi KL
}
\examples{
showClass("antsImage")
}
\keyword{classes}
