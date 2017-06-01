setwd("C:/Users/caoyujin/Desktop/twitter/Martial")

library(twitteR)
library(ROAuth)


# API Keys from https://apps.twitter.com/app/new 
apiKey <- "oif3e8kqSrE0wPfwRSOnwYCk3"
apiSecret <- "oYCJmIesGuNIvNUfls4tUfP0mg0o9sXdLEe7mysYCVZq64hRiR"
access_token = "2269314123-U149EUuH2EFatcrQ3VgrmJWaujBXAKGow0H6hi6"
access_token_secret = "1jaaIcVsHYdptHqOUYoG467X0j5gn0miOxhBZTRK1y02I"

setup_twitter_oauth(apiKey, apiSecret, access_token, access_token_secret)

tweets = searchTwitter("#NotoMartialLaw OR #NeverAgain OR Duterte OR Marawi City OR Marcos OR MartialLaw OR Mindanao OR Dictator", n=1000, lang = "en")
tweetsDF = twListToDF(tweets)

userInfo = lookupUsers(tweetsDF$screenName)
userFrame = twListToDF(userInfo)

