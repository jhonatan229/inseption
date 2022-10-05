DOMAIN = $(shell awk '/jestevam.42.fr/{print $$2}' /etc/hosts)
VOLUME_DIR = /home/jestevam/data/
ALL_VOLUMES = $(shell docker volume ls -q)

all: hosts volume
	cd srcs && docker-compose up --build -d

hosts:
ifneq (${DOMAIN}, jestevam.42.fr)
	sudo touch /etc/hosts
	sudo cp /etc/hosts ./hosts_backup
	sudo rm /etc/hosts
	sudo cp ./srcs/requirements/tools/hosts /etc/
endif

volume:
	sudo mkdir -p $(VOLUME_DIR)wordpress
	sudo mkdir -p $(VOLUME_DIR)mariadb


stop:
	cd srcs && docker-compose down

clean:
	docker rmi wordpress mariadb nginx -f
	docker image prune -f

fclean: clean
	docker system prune -a --force
ifneq ($(ALL_VOLUMES),)
	docker volume rm $(ALL_VOLUMES)
endif
	docker system prune -a --volumes --force
	sudo rm -rf /etc/hosts
	sudo rm -rf ${VOLUME_DIR} 
	sudo mv ./hosts_backup /etc/hosts