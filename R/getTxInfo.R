#' Get transaction info
#'
#' Returns transaction info from a transaction hash
#'
#' @param address Transaction Hash
#' @return List containing transaction info from a transaction hash

getTxInfo <- function(transaction_hash) {

  print("Querying Ethplorer API.....")

  # Create url from various pieces of information
  base <- "https://api.ethplorer.io/"
  request_type <- "getTxInfo/"
  transaction_hash <- transaction_hash
  api_key <- "apiKey=freekey"

  url <- paste0(base, request_type, transaction_hash, "?", api_key)

  # Submit a GET request with the URL and save the response in a variable
  response <- httr::GET(url)

  # If HTTP Status Code is a success (200), then extract the data out into a list
  # If not, indicate the error to the user
  if (response$status_code == 200) {

    data <- jsonlite::fromJSON(rawToChar(response$content))

    return(data)

  } else {
    print("Invalid transaction hash format")
  }

  # Set sleep time of 0.25 seconds to prevent overload of the free API rates
  Sys.sleep(0.25)
}
