#!/bin/bash

echo "🚀 GlobalChef Recipe & Meal Planner - Deployment Script"
echo "======================================================"
echo ""

# Check if virtual environment exists
if [ ! -d "venv" ]; then
    echo "❌ Virtual environment not found. Please run the setup first."
    exit 1
fi

# Function to start backend
start_backend() {
    echo "🔧 Starting Backend API Server..."
    echo "📍 Backend will be available at: http://localhost:8001"
    echo "📖 API Documentation at: http://localhost:8001/docs"
    echo ""
    
    # Kill any existing processes on port 8001
    pkill -f "python api_backend/main.py" 2>/dev/null || true
    
    # Start backend in background
    source venv/bin/activate && python api_backend/main.py &
    BACKEND_PID=$!
    echo "✅ Backend started with PID: $BACKEND_PID"
    echo ""
}

# Function to start frontend
start_frontend() {
    echo "🎨 Starting Frontend Server..."
    echo "📍 Frontend will be available at: http://localhost:3000"
    echo ""
    
    # Kill any existing processes on port 3000
    pkill -f "python api_frontend/server.py" 2>/dev/null || true
    
    # Start frontend in background
    python api_frontend/server.py &
    FRONTEND_PID=$!
    echo "✅ Frontend started with PID: $FRONTEND_PID"
    echo ""
}

# Function to show status
show_status() {
    echo "📊 Application Status:"
    echo "====================="
    
    # Check backend
    if curl -s http://localhost:8001/ > /dev/null 2>&1; then
        echo "✅ Backend API: Running (http://localhost:8001)"
    else
        echo "❌ Backend API: Not running"
    fi
    
    # Check frontend
    if curl -s http://localhost:3000/ > /dev/null 2>&1; then
        echo "✅ Frontend: Running (http://localhost:3000)"
    else
        echo "❌ Frontend: Not running"
    fi
    
    echo ""
}

# Function to stop all services
stop_all() {
    echo "🛑 Stopping all services..."
    pkill -f "python api_backend/main.py" 2>/dev/null || true
    pkill -f "python api_frontend/server.py" 2>/dev/null || true
    echo "✅ All services stopped"
    echo ""
}

# Function to open application
open_app() {
    echo "🌐 Opening application in browser..."
    if command -v xdg-open > /dev/null; then
        xdg-open http://localhost:3000
    elif command -v open > /dev/null; then
        open http://localhost:3000
    else
        echo "📋 Please open your browser and go to: http://localhost:3000"
    fi
    echo ""
}

# Main deployment logic
case "${1:-deploy}" in
    "deploy")
        echo "🎯 Starting full deployment..."
        echo ""
        
        start_backend
        sleep 3
        
        start_frontend
        sleep 2
        
        show_status
        
        echo "🎉 Deployment complete!"
        echo "📋 Next steps:"
        echo "   1. Open http://localhost:3000 in your browser"
        echo "   2. Test the recipe generation feature"
        echo "   3. Use Ctrl+C to stop the servers when done"
        echo ""
        
        open_app
        
        # Wait for user to stop
        echo "⏳ Press Ctrl+C to stop all services..."
        wait
        ;;
    
    "backend")
        echo "🔧 Starting backend only..."
        start_backend
        echo "⏳ Press Ctrl+C to stop backend..."
        wait $BACKEND_PID
        ;;
    
    "frontend")
        echo "🎨 Starting frontend only..."
        start_frontend
        echo "⏳ Press Ctrl+C to stop frontend..."
        wait $FRONTEND_PID
        ;;
    
    "status")
        show_status
        ;;
    
    "stop")
        stop_all
        ;;
    
    "restart")
        echo "🔄 Restarting all services..."
        stop_all
        sleep 2
        $0 deploy
        ;;
    
    *)
        echo "Usage: $0 {deploy|backend|frontend|status|stop|restart}"
        echo ""
        echo "Commands:"
        echo "  deploy   - Start both backend and frontend (default)"
        echo "  backend  - Start only the backend API"
        echo "  frontend - Start only the frontend server"
        echo "  status   - Show status of running services"
        echo "  stop     - Stop all running services"
        echo "  restart  - Restart all services"
        echo ""
        exit 1
        ;;
esac 