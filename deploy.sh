#!/bin/bash
set -e  # Exit on error

echo "🚀 Starting Deployment..."

# 🔑 Login to Docker Hub securely
echo "🔑 Logging into Docker Hub..."
echo "virat@18vk" | docker login -u "$sanjay188" --password-stdin

# 🐳 Build and Push Docker Image
echo "🐳 Building Docker Image..."
docker build -t sanjay188/devops:latest .

echo "📤 Pushing Image to Docker Hub..."
docker push sanjay188/devops:latest



# 🗑 Clean old images
echo "🗑 Removing old Docker images..."
docker image prune -f

# 🚀 Run New Container
echo "🚀 Deploying New Container..."
docker run -d -p 8000:5000 --name=my-service-repo sanjay188/devops:latest

echo "✅ Deployment Successful!"
