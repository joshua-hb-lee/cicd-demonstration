# CI/CD Demonstration with Jenkins and Ansible

## Jenkins Plugin Requirement

- Publish over SSH
- Lockable Resources Plugin
- Pipeline: Stage View Plugin (optional)
- Ansible Plugin

## Deployment Scripts

- [Jenkinsfile](https://github.com/joshua-hb-lee/cicd-demonstration/blob/jenkins-ansible/jenkins-ansible/Jenkinsfile)
- [Ansible Playbook](https://github.com/joshua-hb-lee/cicd-demonstration/tree/jenkins-ansible/jenkins-ansible/playbook)

## Ansible Playbook Structure
```
playbook/
├── group_vars/
│   └── all.yml
├── roles/
│   ├── nginx/
│   │   ├── files/
│   │   │   └── nginx.conf
│   │   ├── tasks/
│   │   │   └── main.yml
│   │   ├── templates/
│   │   │   └── cicd-demo.conf.j2
│   │   └── vars/
│   │       └── main.yml
│   ├── package/
│   │   ├── tasks/
│   │   │   └── main.yml
│   │   └── vars/
│   │       └── main.yml
│   ├── run-app/
│   │   ├── tasks/
│   │   │   ├── simple_deploy/
│   │   │   │   └── main.yml
│   │   │   └── main.yml
│   │   └── templates/
│   │       └── simple-deploy.sh.j2
│   └── setup/
│       └── tasks/
│           └── main.yml
└── deploy-app.yaml
```

### Playbook Process (based on Roles)
- package
- nginx
- setup
- run-app

## Blog Post
...