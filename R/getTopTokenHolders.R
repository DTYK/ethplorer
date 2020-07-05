#' Querying the top token holders of a token
#'
#' Returns the top token holders of a token as a data frame
#'
#' @param address Token Contract Address
#' @param limit Maximum number of token holders (1 - 100)
#' @return Data frame containing address of token holders, percentage of ownership of tokens

getTopTokenHolders <- function(address, limit = 10) {

  print("Querying Ethplorer API.....")

  # Create url from various pieces of information
  base <- "https://api.ethplorer.io/"
  request_type <- "getTopTokenHolders/"
  address <- address
  api_key <- "apiKey=freekey"
  limit <- limit

  url <- paste0(base, request_type, address, "?", api_key, "&limit=", limit)

  # Submit a GET request with the URL and save the response in a variable
  response <- httr::GET(url)

  # If HTTP Status Code is a success (200), then extract the data out into a data frame
  # If not, indicate the error to the user
  if (response$status_code == 200) {

    data <- as.data.frame(jsonlite::fromJSON(rawToChar(response$content)))

    return(data)

  } else {
    print("Address provided is not a token contract")
  }

  # Set sleep time of 0.25 seconds to prevent overload of the free API rates
  Sys.sleep(0.25)
}
