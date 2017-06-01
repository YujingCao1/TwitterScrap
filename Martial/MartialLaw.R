setwd("C:/Users/caoyujin/Desktop/twitter/Martial/tweets")

library(twitteR)
library(ROAuth)


# API Keys from https://apps.twitter.com/app/new 
apiKey <- "oif3e8kqSrE0wPfwRSOnwYCk3"
apiSecret <- "oYCJmIesGuNIvNUfls4tUfP0mg0o9sXdLEe7mysYCVZq64hRiR"
access_token = "2269314123-U149EUuH2EFatcrQ3VgrmJWaujBXAKGow0H6hi6"
access_token_secret = "1jaaIcVsHYdptHqOUYoG467X0j5gn0miOxhBZTRK1y02I"

setup_twitter_oauth(apiKey, apiSecret, access_token, access_token_secret)

tweets = searchTwitter("#NotoMartialLaw OR #NeverAgain OR Duterte OR Marawi City OR Marcos OR MartialLaw OR Mindanao OR Dictator", resultType="popular", n=10000, since = '2017-05-27', until = "2017-05-28")
tweetsDF = twListToDF(tweets)

userInfo = lookupUsers(tweetsDF$screenName)
userFrame = twListToDF(userInfo)

write.csv(tweetsDF, "tweetsPop_0527_0528.csv", row.names = FALSE)
write.csv(userFrame, "userInfo_0527_0528.csv", row.names = FALSE)

test = searchTwitter("#NotoMartialLaw", n=10)
testDf= twListToDF(test)

tweetsDF = read.csv("tweets_0525_0526.csv", header = TRUE, stringsAsFactors = FALSE)


path = "C:/Users/caoyujin/Desktop/twitter/Martial/tweets" 

out.file = ""

file.names = dir(path, pattern = ".csv")

for (i in 7:11){
  file = read.csv(file.names[i], header = TRUE, stringsAsFactors = FALSE)
  out.file = rbind(out.file, file)
}

out.file = out.file[-1,]

tweetsPop_0523_0528 = unique(out.file)
userInfoDF = lookupUsers(out.file$screenName)
userName = twListToDF(userInfoDF)

write.csv(out.file, "tweetsPop_0523_0528.csv", row.names = FALSE)
write.csv(userName, "userInfoPop_0523_0528.csv", row.names = FALSE)

