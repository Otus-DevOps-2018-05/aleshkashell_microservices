#!/bin/bash
docker run -d --network=reddit --network-alias=my_post_db --network-alias=my_comment_db mongo:latest
docker run -d --network=reddit --network-alias=my_post -e POST_DATABASE_HOST='my_post_db' aleshkashell/post:1.0 #-e POST_DATABASE='my_posts'
docker run -d --network=reddit --network-alias=my_comment -e COMMENT_DATABASE_HOST='my_comment_db' aleshkashell/comment:1.0 #-e COMMENT_DATABASE='my_comment'
docker run -d --network=reddit -p 9292:9292 -e POST_SERVICE_HOST='my_post' -e COMMENT_SERVICE_HOST='my_comment' aleshkashell/ui:3.0
