query <- 'http://transport.opendata.ch/v1/locations?x=46.801111&y=8.226667'
response <- jsonlite::fromJSON(rawToChar(httr::GET(query)$content))

closestMatch <- response[["stations"]][["name"]][[1]]

ConstructSearchQuery <- function(searchString, type="poi"){
    baseString <- 'http://transport.opendata.ch/v1/locations?'
    fullString <- paste0(baseString,'query="',searchString,'"&type=',type)
    return(fullString)
}

ConstructPostitionalSearchQuery <- function(x,y){
    baseString <- 'http://transport.opendata.ch/v1/locations?'
    fullString <- paste0(baseString,'x=',x,'&y=',y)
    return(fullString)
}

GetAndCleanRequest <- function(query){
    
    return(jsonlite::fromJSON(rawToChar(httr::GET(query)$content)))
}

GetRandomSwissishPoint <- function(){
    swiCenterX <- 46.801111
    swiCenterY <- 8.226667
    radius <- sample(seq(0,2.3,0.01),1)
    theta <- sample(seq(0,2*pi,.1),1)
    x <- swiCenterX + radius*cos(theta)
    y <- swiCenterY + radius*sin(theta)
    return(list(x = x,y = y))
}

point <- GetRandomSwissPoint()
query <- ConstructPostitionalSearchQuery(point$x,point$y)
response <- GetAndCleanRequest(query)
m <- leaflet::leaflet()
m <- leaflet::addTiles(m)
m <- leaflet::addMarkers(
    m,
    lng = response[["stations"]][["coordinate"]][["y"]],
    lat = response[["stations"]][["coordinate"]][["x"]],
    popup = response[["stations"]][["name"]]
    )
m
htmltools::save_html(html = m,file = "~/Desktop/map.html")

response <- GetAndCleanRequest(ConstructSearchQuery("Bieri"))
closestMatch <- response[["stations"]][["name"]][[1]]
response2 <- GetAndCleanRequest(ConstructSearchQuery(closestMatch))

ConstructSearchQuery(closestMatch)

httr::GET(ConstructSearchQuery(closestMatch))


cos