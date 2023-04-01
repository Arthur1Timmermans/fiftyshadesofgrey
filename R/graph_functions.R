#' quick select function to form data frame for other quick functions
#'
#' @param groupselect selects a group from a data frame
#' @param xselect selects values for x axis in quick graph functions
#' @param yselect selects values for y axis in quick graph function
#'
#' @return
#' @export
#'
#' @examples
#' quick_select_function(data$gender, data$age, data$hight)
#'
quick_Select_function <- function (groupselect = data$gender, xselect = data$age, yselect = data$hight){
  # save the group, x and y to a data frame. This format is used in all other "quick" functions
  quick_select_data <<- data.frame(
    id = 1:length(groupselect),
    group = groupselect,
    x = xselect,
    y = yselect)


  print(quick_select_data)

}



#' quick graph function allowing to quickly make different graph types
#'
#' @param graphdata input data, usually the "quick_select_data" from the "quick_select_function"
#' @param graphtype allows to choose different graph types, currently supported: dotplot, boxplot, bargraph, columngraph and linegraph
#' @param graphpalette choose a pellet from the 'colorlist' from the basic fiftyshades of grey color function
#'
#' @return
#' @export
#'
#' @examples
#' graph_function()
#' graph_function(graphtype="boxplot")
#' graph_function(graphtype="linegraph", graphpalette="lavenderblush")
#'
graph_function <- function(graphdata= quick_select_data, graphtype="dotplot", graphpalette="blackwhite") {

  if (graphtype == "dotplot"){
  ggplot(graphdata, aes(x, y)) +
    geom_point(aes(color = factor(group)), size = 4) +
    color_pallete_blackwhite(graphpalette) +
    labs(title = "quick dot plot function",
         x = "x axis values",
         y = "y axis values",
         subtitle = "this function quickly allows for scanning of data")
  } else if (graphtype == "boxplot"){
    ggplot(graphdata, aes(x, y)) +
      geom_boxplot( aes(color = group))+
      color_pallete_blackwhite(graphpalette) +
      labs(title = "quick boxplot function",
           x = "x axis values",
           y = "y axis values",
           subtitle = "this function quickly allows for scanning of data")
  } else if (graphtype == "bargraph"){
    ggplot(graphdata, aes(y)) +
      geom_bar(aes(colour = group)) +
      color_pallete_blackwhite(graphpalette) +
      labs(title = "quick bar graph function",
           x = "x axis values",
           y = "y axis values",
           subtitle = "this function quickly allows for scanning of data")
  } else if (graphtype == "columngraph"){
    ggplot(graphdata, aes(x, y)) +
    geom_col(aes(colour = group)) +
    color_pallete_blackwhite(graphpalette) +
    labs(title = "quick column graph function",
         x = "x axis values",
         y = "y axis values",
         subtitle = "this function quickly allows for scanning of data")
  } else if (graphtype == "linegraph") {
    ggplot(graphdata, aes(x, y)) +
      geom_line(aes(colour = group)) +
      color_pallete_blackwhite(graphpalette) +
      labs(title = "quick line graph function",
           x = "x axis values",
           y = "y axis values",
           subtitle = "this function quickly allows for scanning of data")
  }
  else{print("this graph type is currently not supported")}}




#' quick correlation function allowing to quickly analyse if the x and y variable are correlated
#'
#' @param data1 input data, usually the "quick_select_data" from the "quick_select_function"
#'
#' @return
#' @export
#'
#' @examples
#' correlation_function()
#' correlation_function(data1 = quick_select_data)
#'
correlation_function <- function(data1 = quick_select_data) {
  shapiro1 <-  shapiro.test(data1$x)
  shapiro2 <- shapiro.test(data1$y)

  print("the p. values from x and y of the shapiro test are")
  print(shapiro1$p.value)
  print(shapiro2$p.value)

if(shapiro1$p.value & shapiro2$p.value <0.05) {
  cor1<-  cor(quick_select_data$x, quick_select_data$y, method = "spearman")
  print("the data was not normaly distrubuted, a spearman correlation test was run and the P-value is")
  cor1

} else {cor2 <- cor(quick_select_data$x, quick_select_data$y, method = "pearson")
  print("the data was normaly distrubuted, a pearson correlation test was run to compare x and y and the P-value is")
  cor2}
}
