# Next.js-deployment
This is my project of deploying friends web app which is made in Next.js on cloud server.

There were 3 stages of deployment this app:
Stage 1
- Deploying Ubuntu server on linode platform and installing all the requirements(Docker, git, nginx) and also update it.
- Configuring Firewall 

Stage 2
- Dockerizing next.js app 
- Setting up local registry and nginx as reverse proxy

Stage 3
- Registering a domain and configuring HTTPS with certbot.
- Configure nginx to redirect http traffic to https
- Set up firewall on server to restrict access only to necessary ports and services


Since most of these actions were preformed on server, I have copied most of the files in the pdf so you can see the process of creation configuration files.

I have taken note of everything, including the early process of creating, my mistakes, and some useful tips.
I will also upload Dockerfile.
