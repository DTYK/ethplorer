#' Querying the last block
#'
#' Returns the last block in a vector
#'
#' @param
#' @return A vector containing the last block number

getLastBlock <- function() {

  print("Querying Ethplorer API.....")

  # Create url from various pieces of information
  base <- "https://api.ethplorer.io/"
  request_type <- "getLastBlock"
  api_key <- "apiKey=freekey"

  url <- paste0(base, request_type, "?", api_key)

  # Submit a GET request with the URL and save the response in a variable
  response <- httr::GET(url)

  # Extract the data out into a vector
  data <- jsonlite::fromJSON(rawToChar(response$content))
  data <- data$lastBlock
  return(data)

  # Set sleep time of 0.25 seconds to prevent overload of the free API rates
  Sys.sleep(0.25)
}
