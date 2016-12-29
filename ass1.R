imdb <- read.csv(file="/Users/EugeneTan/Downloads/DataMining/movie_metadata.csv" , header = TRUE) 

imdb[imdb==""] <- NA

imdb$num_critic_for_reviews <- NULL
imdb$facenumber_in_poster <- NULL
imdb$plot_keywords <- NULL
imdb$director_facebook_likes <- NULL
imdb$num_user_for_reviews <- NULL
imdb$movie_imdb_link <- NULL
imdb$movie_facebook_likes <- NULL
imdb$num_voted_users <- NULL
imdb$actor_3_facebook_likes <- NULL
imdb$actor_2_facebook_likes <- NULL
imdb$actor_1_facebook_likes <- NULL
imdb$cast_total_facebook_likes <- NULL

imdb <- imdb [-c(5),]
rownames(imdb) <- NULL

imdb$content_rating[which(is.na(imdb$content_rating))]<- "PG"
imdb$color[which(is.na(imdb$color) & imdb$title_year > 1932)] <- "Color"

library(Hmisc)
imdb$aspect_ratio <- impute(imdb$aspect_ratio,mean)
is.imputed(imdb$aspect_ratio)

library(Hmisc)
imdb$budget <- impute(imdb$budget,mean)
is.imputed(imdb$budget)

library(Hmisc)
imdb$duration <- impute(imdb$duration,mean)
is.imputed(imdb$duration)

library(Hmisc)
imdb$gross <- impute(imdb$gross,mean)
is.imputed(imdb$gross)

imdb <- imdb[c("color","movie_title","title_year","genres","duration","country","language","imdb_score","content_rating","director_name","actor_1_name","actor_2_name","actor_3_name","budget","gross","aspect_ratio")]

sum(is.na(imdb$movie_title))
sum(is.na(imdb$genres))

imdb <- imdb[!is.na(imdb$director_name), ]
rownames(imdb) <- NULL

imdb <- imdb[!is.na(imdb$actor_1_name), ]
rownames(imdb) <- NULL

imdb <- imdb[!is.na(imdb$actor_2_name), ]
rownames(imdb) <- NULL

imdb <- imdb[!is.na(imdb$actor_3_name), ]
rownames(imdb) <- NULL

imdb <- imdb[!is.na(imdb$color), ]
rownames(imdb) <- NULL

imdb <- imdb[!is.na(imdb$country), ]
rownames(imdb) <- NULL

imdb <- imdb[!is.na(imdb$language), ]
rownames(imdb) <- NULL

imdb <- imdb[!is.na(imdb$title_year), ]
rownames(imdb) <- NULL

setwd("/Users/EugeneTan/Downloads/DataMining")
write.csv(imdb,file = "pre_processed.csv")


