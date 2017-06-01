setwd("C:/Users/caoyujin/Desktop/twitter/Martial")

library(streamR)
library(RCurl)
library(RJSONIO)
library(stringr)

library(ROAuth)
requestURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"
consumerKey <- "8O15tlS0cqv0zlnxLLJ6Z8IIj"
consumerSecret <- "agX9gugzRz0h0htAP3ySriBfVIuLH7tOCngsKFoCVp1GPGck6y"

my_oauth <- OAuthFactory$new(consumerKey = consumerKey,
                             consumerSecret = consumerSecret,
                             requestURL = requestURL,
                             accessURL = accessURL,
                             authURL = authURL)



my_oauth$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))

save(my_oauth, file = "my_oauth.Rdata")
