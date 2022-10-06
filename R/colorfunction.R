#base function:

blackwhite_pal <- function(palette="blackwhite", alpha = 1, reverse = FALSE) {
  pal <- colorlist[[palette]]
  if (reverse){
    pal <- rev(pal)
  }
  return(colorRampPalette(pal, alpha))
}


#color palette:
color_pallete_blackwhite <- function(..., palette = "blackwhite",
                                      discrete = TRUE, alpha = 1,
                                      reverse = FALSE) {
  if (discrete) {
    discrete_scale("color", "colorlist", palette=blackwhite_pal(palette, alpha = alpha, reverse = reverse))
  } else {
    scale_color_gradientn(colors = blackwhite_pal(palette, alpha = alpha, reverse = reverse, ...)(256))
  }
}

#fill palette:
fill_pallete_blackwhite <- function(..., palette="blackwhite",
                                     discrete = TRUE, alpha=1, reverse = TRUE) {
  if (discrete) {
    discrete_scale("fill", "colorlist", palette=blackwhite_pal(palette, alpha = alpha, reverse = reverse))
  }
  else {
    scale_fill_gradientn(colors = blackwhite_pal(palette, alpha = alpha, reverse = reverse, ...)(256))
  }
}
