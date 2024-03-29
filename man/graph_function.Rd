% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/graph_functions.R
\name{graph_function}
\alias{graph_function}
\title{quick graph function allowing to quickly make different graph types}
\usage{
graph_function(
  graphdata = quick_select_data,
  graphtype = "dotplot",
  graphpalette = "blackwhite"
)
}
\arguments{
\item{graphdata}{input data, usually the "quick_select_data" from the "quick_select_function"}

\item{graphtype}{allows to choose different graph types, currently supported: dotplot, boxplot, bargraph, columngraph and linegraph}

\item{graphpalette}{choose a pellet from the 'colorlist' from the basic fiftyshades of grey color function}
}
\description{
quick graph function allowing to quickly make different graph types
}
\examples{
graph_function()
graph_function(graphtype="boxplot")
graph_function(graphtype="linegraph", graphpalette="lavenderblush")

}
