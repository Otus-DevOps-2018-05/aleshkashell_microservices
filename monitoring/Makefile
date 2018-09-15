
ROOT_PATH				?= $(shell pwd)/..
UI_PATH					?=$(ROOT_PATH)/src/ui
COMMENT_PATH			?=$(ROOT_PATH)/src/comment
POST_PATH				?=$(ROOT_PATH)/src/post-py
PROMETHEUS_PATH			?=$(ROOT_PATH)/monitoring/prometheus
MONGODB_EXPORTER_PATH	?=$(ROOT_PATH)/monitoring/mongodb_exporter
BLACKBOX_EXPORTER_PATH	?=$(ROOT_PATH)/monitoring/blackbox_exporter
USER_NAME				?=aleshkashell
UI_NAME					?=$(USER_NAME)/ui
COMMENT_NAME			?=$(USER_NAME)/comment
POST_NAME				?=$(USER_NAME)/post
PROMETHEUS_NAME			?=$(USER_NAME)/prometheus
MONGODB_EXPORTER_NAME	?=$(USER_NAME)/mongodb_exporter
BLACKBOX_EXPORTER_NAME	?=$(USER_NAME)/blackbox_exporter


all: build_all push_images

build_ui:
	cd $(UI_PATH); \
	echo `git show --format="%h" HEAD | head -1` > build_info.txt; \
	echo `git rev-parse --abbrev-ref HEAD` >> build_info.txt; \
	docker build -t $(UI_NAME) .
build_comment:
	cd $(COMMENT_PATH); \
	echo `git show --format="%h" HEAD | head -1` > build_info.txt; \
	echo `git rev-parse --abbrev-ref HEAD` >> build_info.txt; \
	docker build -t $(COMMENT_NAME) .
build_post:
	cd $(POST_PATH); \
	echo `git show --format="%h" HEAD | head -1` > build_info.txt; \
	echo `git rev-parse --abbrev-ref HEAD` >> build_info.txt; \
	docker build -t $(POST_NAME) .
build_prometheus:
	cd $(PROMETHEUS_PATH); docker build -t $(PROMETHEUS_NAME) .
build_mongodb_exporter:
	cd $(MONGODB_EXPORTER_PATH); docker build -t $(MONGODB_EXPORTER_NAME) .
build_blackbox_exporter:
	cd $(BLACKBOX_EXPORTER_PATH); docker build -t $(BLACKBOX_EXPORTER_NAME) .
build_all: build_ui build_comment build_post build_prometheus build_mongodb_exporter build_blackbox_exporter
push_all: push_ui push_post push_comment push_prometheus push_mongodb_exporter push_blackbox_exporter
push_ui:
	docker push $(UI_NAME)
push_post:
	docker push $(POST_NAME)
push_comment:
	docker push $(COMMENT_NAME)
push_prometheus:
	docker push $(PROMETHEUS_NAME)
push_mongodb_exporter:
	docker push $(MONGODB_EXPORTER_NAME)
push_blackbox_exporter:
	docker push $(BLACKBOX_EXPORTER_NAME)

.PHONY: all build_ui build_comment build_post build_prometheus build_mongodb_exporter build_blackbox_exporter build_all push_all push_ui push_post push_comment push_prometheus push_mongodb_exporter push_blackbox_exporter