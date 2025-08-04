#!/bin/bash
# Script to start the FastAPI server with virtual environment

echo "🚀 Starting GlobalChef Recipe API Server..."
echo "📍 Server will be available at: http://localhost:8001"
echo "📖 API Documentation at: http://localhost:8001/docs"
echo ""

# Activate virtual environment and start server
source venv/bin/activate && python api_backend/main.py 