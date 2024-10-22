#!/bin/bash

# Stop all running containers
echo "Stopping all running containers..."
docker stop $(docker ps -q)

# Remove all containers
echo "Removing all containers..."
docker rm $(docker ps -a -q)

# Remove all Docker images
echo "Removing all images..."
docker rmi -f $(docker images -q)

# Remove all volumes
echo "Removing all volumes..."
docker volume rm $(docker volume ls -q)

# Remove all networks (except default ones)
echo "Removing all networks..."
docker network rm $(docker network ls | grep "bridge\|host\|none" -v | awk '{print $1}')

# Optional: Prune system (remove all unused data)
echo "Pruning system to remove all unused data..."
docker system prune -a -f --volumes

echo "Docker cleanup complete!"
