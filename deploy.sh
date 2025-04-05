#!/bin/bash
set -e  # Exit on error

echo "🚀 Starting Deployment..."

# 🔑 Login to Docker Hub securely
echo "🔑 Logging into Docker Hub..."
echo "sh0f0oj23j" | docker login -u "sanjay188" --password-stdin

# 🐳 Build and Push Docker Image
echo "🐳 Building Docker Image..."
docker build -t sanjay188/devops:latest .

echo "📤 Pushing Image to Docker Hub..."
docker push sanjay188/devops:latest

# 🛑 Stop and Remove Previous Container
echo "🛑 Stopping old container..."
docker stop my-service-repo || true
docker rm my-service-repo || true

# 🗑 Clean old images
echo "🗑 Removing old Docker images..."
docker image prune -f

# 🚀 Run New Container
echo "🚀 Deploying New Container..."
docker run -d -p 8000:5000 --name=my-service-repo sanjay188/devops:latest

echo "✅ Deployment Successful!"
