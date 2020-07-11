#' Querying the top 50 most active tokens
#'
#' Returns the top 50 of the most active tokens for the last 30 days period
#'
#' @param
#' @return A list containing data of the top 50 most active tokens in the past 30 days period

getTopTokens <- function() {

  print("Querying Ethplorer API.....")

  # Create url from various pieces of information
  base <- "https://api.ethplorer.io/"
  method <- "getTopTokens"
  api_key <- "apiKey=freekey"

  url <- paste0(base, method, "?", api_key)

  # Submit a GET request with the URL and save the response in a variable
  response <- httr::GET(url)

  # Extract the data out into a list
  data <- jsonlite::fromJSON(rawToChar(response$content))
  return(data)

  # Set sleep time of 0.25 seconds to prevent overload of the free API rates
  Sys.sleep(0.25)
}
