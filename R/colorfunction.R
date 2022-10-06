#' costum color package base function
#'
#' @param palette choose a pellet from the 'colorlist'
#' @param alpha sets the transparency
#' @param reverse if set to true, the order of the colorlist is reversed
#'
#' @return
#' @export
#'
#' @examples
#' show_col(blackwhite_pal("blackwhite")(7))
#' filled.contour(volcano,color.palette = blackwhite_pal("blackwhite"), asp=1)
#'
blackwhite_pal <- function(palette="blackwhite", alpha = 1, reverse = FALSE) {
  pal <- colorlist[[palette]]
  if (reverse){
    pal <- rev(pal)
  }
  return(colorRampPalette(pal, alpha))
}



#' color palette for ggplot2
#'
#' @param ... allows for additional arguments to scale_color_gradient, is not a requirement to fill in
#' @param palette choose a pellet from the 'colorlist'
#' @param discrete allows to choose a discrete color palette or not
#' @param alpha sets the transparency
#' @param reverse if set to true, the order of the colorlist is reversed
#'
#' @return
#' @export
#'
#' @examples
#' ggplot(mtcars, aes(hp, mpg)) +
#' geom_point(aes(color = factor(carb)), size = 4) +
#'  color_pallete_blackwhite()
#'
#'
 color_pallete_blackwhite <- function(..., palette = "blackwhite",
                                       discrete = TRUE, alpha = 1,
                                     reverse = FALSE) {
  if (discrete) {
    discrete_scale("color", "colorlist", palette=blackwhite_pal(palette, alpha = alpha, reverse = reverse))
  } else {
    scale_color_gradientn(colors = blackwhite_pal(palette, alpha = alpha, reverse = reverse, ...)(256))
  }
}

#' fill palette
#'
#' @param ... allows for additional arguments to scale_color_gradient, is not a requirement to fill in
#' @param palette choose a pellet from the 'colorlist'
#' @param discrete allows to choose a discrete color palette or not
#' @param alpha sets the transparency
#' @param reverse if set to true, the order of the colorlist is reversed
#'
#' @return
#' @export
#'
#' @examples
#' ggplot(mtcars) + geom_bar(aes(x = hp, fill = mpg)) + fill_pallete_blackwhite()
#'
fill_pallete_blackwhite <- function(..., palette="blackwhite",
                                     discrete = TRUE, alpha=1, reverse = TRUE) {
  if (discrete) {
    discrete_scale("fill", "colorlist", palette=blackwhite_pal(palette, alpha = alpha, reverse = reverse))
  }
  else {
    scale_fill_gradientn(colors = blackwhite_pal(palette, alpha = alpha, reverse = reverse, ...)(256))
  }
}
