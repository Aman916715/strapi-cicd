# Strapi Assignment - my-strapi-app

## Steps I followed
1. Created Strapi project: npx create-strapi@latest my-strapi-app --quickstart
2. Created content type "Article" at src/api/article/content-types/article/schema.json
   - fields: title (string), content (richtext)
  <img width="1440" height="900" alt="Screenshot 2025-09-15 at 8 20 14 PM" src="https://github.com/user-attachments/assets/adf90070-00bc-4b8c-aa7f-12aff61ee7f8" />

   
3. Built admin and ran: npm run build && npm run develop
  <img width="1440" height="900" alt="Screenshot 2025-09-15 at 8 25 01 PM" src="https://github.com/user-attachments/assets/a8f6be81-96fa-4f9e-b8e1-637a9f01b361" />
  
4. Pushed code to branch `Aman` of repository https://github.com/PearlThoughtsInternship/The-Config-Crew

## Run locally
git clone <repo-url>
cd my-strapi-app
npm install
npm run develop
open http://localhost:1337/admin

Pull Request link: https://github.com/PearlThoughtsInternship/The-Config-Crew/pull/2

Loom video link:  https://www.loom.com/share/b9d8f83617ba4323879a90081e5af18c

** Task 2 **
Containerization strapi application on Docker locally

## Run with Docker
1. Ensure *Docker Desktop* is running.  
2. Build a Docker image from this project directory.  
3. Start a container using the built image.  
4. Open a browser and navigate to *http://localhost:1337/admin* to access the adm*panel.

PR link : *https://github.com/PearlThoughtsInternship/The-Config-Crew/pull/10*

<<<<<<< HEAD
**Task 3**    setup postgreSQl container and strapi container and setup Nginx container as reverse proxy.
## ⚙️ Setup Instructions

### 1️ Clone the repository
git clone https://github.com/PearlThoughtsInternship/The-Config-Crew.git

### 2 Switch to branch 
git checkout Aman

### 3 To start the application
docker compose up -d --build

### 4 To access Strapi
http://localhost/admin

update README to trigger pr

