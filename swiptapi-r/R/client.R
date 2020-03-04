#' @title Object to interact with the Swiss Public Transit API
#' @name SwiPtApiClient
#' @description An object to streamline interactions with the Swiss Public Transit API.
#' @references (https://transport.opendata.ch/)
#' @export
SwiPtApiClient <- R6::R6Class(
    classname = "swiptapi",
    public = list(
        initialize = function(){
            logging::loginfo("Client initialized")
        },
        SearchAroundPoint = function(lat,long){
            query <- private$ConstructPostitionalSearchQuery(lat,long)
            return(private$GetAndCleanRequest(query))
        }
    ),
    private = list(
        ConstructPostitionalSearchQuery = function(x,y){
            baseString <- 'http://transport.opendata.ch/v1/locations?'
            fullString <- paste0(baseString,'x=',x,'&y=',y)
            return(fullString)
        },
        GetAndCleanRequest = function(query){
            return(jsonlite::fromJSON(rawToChar(httr::GET(query)$content)))
        }
    )
)
