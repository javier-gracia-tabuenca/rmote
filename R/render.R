
#' Print an htmlwidget to servr
#'
#' @import rmarkdown
#' @param x rmd file
#' @param \ldots  additional parameters
#' @export
render <- function(x, ...) {

  #widget_opt <- getOption("rmote_htmlwidgets", FALSE)

  #if(is_rmote_on() && widget_opt) {
  if(is_rmote_on()) {
    message("serving render through rmote")

    res <- try({
     
      server_dir <- get_server_dir()     

      #render 
      rmote::rmote_off()
      html <- rmarkdown::render(x)
      rmote::rmote_on(server_dir)
	
      file.copy(html, file.path(server_dir, "index.html"), overwrite = TRUE)     

      #write_html(html)
    })

 
  } else {
    getFromNamespace("render", "rmarkdown")(x)
  }
}