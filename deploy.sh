#!/bin/bash
set -e  # Exit on error

echo "🚀 Starting Deployment..."

# 🔑 Login to Docker Hub securely
echo "🔑 Logging into Docker Hub..."
echo "Virat@18vk" | sudo docker login -u "sanjay188" -p "Virat@18vk"

# 🐳 Build and Push Docker Image
echo "🐳 Building Docker Image..."
sudo docker build -t sanjay188/devops:latest .

echo "📤 Pushing Image to Docker Hub..."
sudo docker push sanjay188/devops:latest



# 🗑 Clean old images
echo "🗑 Removing old Docker images..."
sudo docker image prune -f

# 🚀 Run New Container
echo "🚀 Deploying New Container..."
sudo docker run -d -p 8000:5000 --name=my-service-repo sanjay188/devops:latest

echo "✅ Deployment Successful!"
