\name{as.antsMatrix}
\alias{as.antsMatrix}

\title{
numeric matrix/array to antsImage
}

\description{
Create an \code{antsMatrix} object from a \code{list} or \code{data.frame}.
}

\usage{
as.antsMatrix( object , elementtype )
}

\arguments{
\item{object}{
  \code{list} or \code{data.frame} to be used to construct the \code{antsMatrix}. 'names' of the 'object' turn into column-names of the resulting matrix.
}

\item{elementtype}{
  C++ datatype to be used to represent the elements of the matrix constructed. Make sure you use a type that can represent all the values in the input list or dataframe. Allowed values: "double", "float", "unsigned int", "unsigned char". Default: "double"
}
}

\value{
Object of class \code{antsMatrix} -- Success ; NA -- Failure
}

\author{
Shrinidhi KL
}

\examples{
\dontrun{
# create an image from a numeric array with details as shown ; here the image pixeltype is assumed to be 'double'
df = data.frame( col1 = c(1,2,3) , col2 = c(4,5,6) , col3 = c(7,8,9) )
am = as.antsMatrix( df , "double" )
}
}
