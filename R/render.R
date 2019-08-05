
#' Print an htmlwidget to servr
#'
#' @param x rmd file
#' @param \ldots  additional parameters
#' @S3method render rmd file
render <- function(x, ...) {

  #widget_opt <- getOption("rmote_htmlwidgets", FALSE)

  #if(is_rmote_on() && widget_opt) {
  if(is_rmote_on()) {
    message("serving render through rmote")

    res <- try({
      
      #render 
      rmote::rmote_off()
      html <- rmarkdown::render(x)
      rmote::rmote_on()
      
      write_html(html)
    })

 
  } else {
    getFromNamespace("render", "rmarkdown")(x)
  }
}