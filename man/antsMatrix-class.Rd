\name{antsMatrix-class}
\Rdversion{1.1}
\docType{class}
\alias{antsMatrix-class}

\title{Class \code{"antsMatrix"}}
\description{
Encapsultates the external pointer to the underlying matrix along with details used to identify the 'type' of the matrix on C++ side.
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("antsMatrix", elementtype)}. Matrix created this way will have invalid external pointer in the slot 'pointer' right after construction. At this point the matrix is considered 'empty'. This kind of construction is used to create a buffer to hold the result of a function like 'antsMotionCorr'. After a successful function call like this, the matrix will become a valid object that can be used, for example to create a \code{list} or \code{data.frame}.
}
\section{Slots}{
  \describe{
    \item{\code{elementtype}:}{Object of class \code{"character"} C++ datatype used to represent the elements in the matrix. Allowed values: "double", "float", "unsigned int", "unsigned char". }
    \item{\code{pointer}:}{Object of class \code{"externalptr"} External pointer to the actual matrix in the memory. User should \emph{not} set or manipulate it at any point. }
  }
}
\section{Methods}{
  \describe{
    \item{int_antsExtractXptrAsString}{\code{signature(object = "antsMatrix")}: \emph{internal} method to extract the external pointer as a string for processing. Not written for users of the package. }
	 }
}
\author{
Shrinidhi KL
}
\examples{
showClass("antsMatrix")
}
\keyword{classes}
