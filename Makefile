USER = wxuerui

local:
	ansible-playbook playbooks/playbook.yml \
		-l vagrant \
		-u vagrant \
		--ask-become-pass

cloud:
	ansible-playbook playbooks/playbook.yml \
		-l cloud_server \
		-u ${USER} \
		--ask-become-pass

setup_local:
	ansible-playbook playbooks/playbook.yml \
		-l vagrant \
		-u vagrant \
		--tags "setup" \
		--ask-become-pass

setup_cloud:
	ansible-playbook playbooks/playbook.yml \
		-l cloud_server \
		-u ${USER} \
		--tags "setup" \
		--ask-become-pass

deploy_local:
	ansible-playbook playbooks/playbook.yml \
		-l vagrant \
		-u vagrant \
		--tags "deploy" \
		-e "state=present" \
		--ask-become-pass

deploy_cloud:
	ansible-playbook playbooks/playbook.yml \
		-l cloud_server \
		-u ${USER} \
		--tags "deploy" \
		-e "state=present" \
		--ask-become-pass

restart_local:
	ansible-playbook playbooks/playbook.yml \
		-l vagrant \
		-u vagrant \
		--tags "deploy" \
		-e "state=restarted" \
		--ask-become-pass

restart_cloud:
	ansible-playbook playbooks/playbook.yml \
		-l cloud_server \
		-u ${USER} \
		--tags "deploy" \
		-e "state=restarted" \
		--ask-become-pass

down_local:
	ansible-playbook playbooks/playbook.yml \
		-l vagrant \
		-u vagrant \
		--tags "deploy" \
		-e "state=absent" \
		--ask-become-pass

down_cloud:
	ansible-playbook playbooks/playbook.yml \
		-l cloud_server \
		-u ${USER} \
		--tags "deploy" \
		-e "state=absent" \
		--ask-become-pass

# default service, overrisde by env
SERVICE = nginx

deploy_service_local:
	ansible-playbook playbooks/playbook.yml \
		-l vagrant \
		-u vagrant \
		--tags "${SERVICE}" \
		-e "state=present" \
		--ask-become-pass

deploy_service_cloud:
	ansible-playbook playbooks/playbook.yml \
		-l cloud_server \
		-u ${USER} \
		--tags "${SERVICE}" \
		-e "state=present" \
		--ask-become-pass

down_service_local:
	ansible-playbook playbooks/playbook.yml \
		-l vagrant \
		-u vagrant \
		--tags "${SERVICE}" \
		-e "state=absent" \
		--ask-become-pass

down_service_cloud:
	ansible-playbook playbooks/playbook.yml \
		-l cloud_server \
		-u ${USER} \
		--tags "${SERVICE}" \
		-e "state=absent" \
		--ask-become-pass

restart_service_local:
	ansible-playbook playbooks/playbook.yml \
		-l vagrant \
		-u vagrant \
		--tags "${SERVICE}" \
		-e "state=restarted" \
		--ask-become-pass

restart_service_cloud:
	ansible-playbook playbooks/playbook.yml \
		-l cloud_server \
		-u ${USER} \
		--tags "${SERVICE}" \
		-e "state=restarted" \
		--ask-become-pass

.PHONY: local cloud setup_local setup_cloud deploy_local deploy_cloud down_local down_cloud \
	restart_local restart_cloud down_service_local down_service_cloud restart_service_local restart_service_cloud
