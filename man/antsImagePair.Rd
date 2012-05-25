\name{antsImagePair}
\alias{antsImagePair}

\title{
Pair Images
}

\description{
Used as an input to functions that expect two images in one argument. Create a pair of 'antsImage's.
}

\usage{
antsImagePair( img1 , img2 )
}

\arguments{
\item{img1}{
Non-empty object of class 'antsImage'.
}

\item{img2}{
Non-empty object of class 'antsImage'.
}
}

\value{
pair of 'antsImage' that can be used as input to functions -- Success\cr
                             1 -- Failure
}

\author{
Shrinidhi KL
}

\examples{
\dontrun{
img1 = antsImageRead( "img1.nii" , "double" , 4 )
img2 = antsImageRead( "img2.nii" , "double" , 4 )
antsImagePair( img1 , img2 )
}
}
