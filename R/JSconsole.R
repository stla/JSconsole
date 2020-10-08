#' @import V8 rstudioapi
#' @noRd
JSconsole <- function(){
  editor <- getSourceEditorContext()
  selection <- editor[["selection"]][[1L]][["text"]]
  code <- ifelse(selection != "",
                 selection,
                 paste0(editor[["contents"]], collapse = "\n"))
  ctx <- v8()
  if(ctx$validate(code)){
    ctx$eval(code)
    ctx$console()
  }else{
    message("Invalid code.")
    invisible()
  }
}
