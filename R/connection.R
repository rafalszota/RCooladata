#' Cooladata Connection
#'
#' This function creates a connection to Cooladata. The connection can be used to run CQL queries.
#' The function requires Cooladata developer token in your home repository.
#' The token should be stored in ~/.cooladata-dev-token
#' 
#' @param project_id the internal Cooladata ID of the evironment where to execute the query.
#' @keywords cats
#' @export
#' @return the function returns the connection that takes query string as an argument and return a data frame
#' @examples
#' cooladata <- cooladataConnection(123456)
#' cooladata("SELECT event_name FROM cooladata WHERE date_range(last 7 days)  limit 10")
#' 
cooladataConnection <- function(project_id) {
  
  
  require(httr)
  
  TOKEN_NOT_FOUND <- "Developer token not found. Make sure the file 
  .cooladata-dev-token exist in your home repository"
  
  URL <- "https://app.cooladata.com/api/v2/projects/"
  CONTENT_TYPE = "application/x-www-form-urlencoded"
  NO_CACHE <- "&noCache=true"
  TXQ <- "&tqx=out:csv"
  TQ <- "tq="
  
  token = tryCatch({scan("~/.cooladata-dev-token", what="character")},
                   warning = function(e) {message(TOKEN_NOT_FOUND)},
                   error = function(e) {message(TOKEN_NOT_FOUND)})
  
  url <- paste(URL, project_id, "/cql/", sep="")
  
  
  function(query) {
    
    body <- paste(TQ, query, TXQ, NO_CACHE, sep="")
    request <- POST(url=url, body=body, 
                    add_headers(Authorization = paste("Token", token)), content_type(CONTENT_TYPE))
    read.csv(text=content(request, "text"), stringsAsFactors = F)
  }
  
}
