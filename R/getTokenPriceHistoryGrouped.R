#' Querying price history of a token address
#'
#' Returns a data frame of price history of a token
#'
#' @param address Address
#' @return Data frame of price history of a token

getTokenPriceHistoryGrouped <- function(address) {

  print("Querying Ethplorer API.....")

  # Create url from various pieces of information
  base <- "https://api.ethplorer.io/"
  method <- "getTokenPriceHistoryGrouped/"
  address <- address
  api_key <- "apiKey=freekey"

  url <- paste0(base, method, address, "?", api_key)

  # Submit a GET request with the URL and save the response in a variable
  response <- httr::GET(url)

  # If HTTP Status Code is a success (200), then extract the data out into a data frame
  # If not, indicate the error to the user
  if (response$status_code == 200) {

    data <- as.data.frame(jsonlite::fromJSON(rawToChar(response$content)))

    return(data)

  } else {

    print("Invalid address format")

  }

  # Set sleep time of 0.25 seconds to prevent overload of the free API rates
  Sys.sleep(0.25)
}
