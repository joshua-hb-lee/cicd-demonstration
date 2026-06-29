# CI/CD Demonstration with Jenkins and Ansible (+ Deployment Strategies)

## Jenkins Plugin Requirement

- Publish over SSH
- Lockable Resources Plugin
- Pipeline: Stage View Plugin (optional)
- Ansible Plugin

## Deployment Scripts

- [Jenkinsfile](https://github.com/joshua-hb-lee/cicd-demonstration/blob/jenkins-ansible/jenkins-ansible-strategies/Jenkinsfile)
- [Ansible Playbook](https://github.com/joshua-hb-lee/cicd-demonstration/tree/jenkins-ansible/jenkins-ansible-strategies/playbook)

## Deployment Strategies
- Rolling Update
- Blue-Green Deployments

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
│   │   ├── files/
│   │   │   ├── BLUE
│   │   │   └── GREEN
│   │   ├── tasks/
│   │   │   ├── blue_green/
│   │   │   │   ├── check_file.yml
│   │   │   │   ├── deploy.yml
│   │   │   │   └── main.yml
│   │   │   ├── rolling_update/
│   │   │   │   ├── deploy.yml
│   │   │   │   └── main.yml
│   │   │   └── main.yml
│   │   └── templates/
│   │       ├── blue-green-deploy.sh.j2
│   │       └── rolling-update-deploy.sh.j2
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
