# 🍳 GlobalChef - Recipe & Meal Planner

An AI-powered recipe and meal planning application that generates personalized recipes, meal plans, and cooking advice using Google's Generative AI.

## 🌟 Features

- **AI Recipe Generation**: Get detailed recipes with ingredients, cooking instructions, and tips
- **Meal Planning**: Generate weekly meal plans based on dietary preferences
- **Multi-Cuisine Support**: Recipes from around the world (Italian, Pakistani, Indian, Chinese, etc.)
- **Dietary Options**: Vegetarian, vegan, gluten-free, diabetic-friendly, high-protein options
- **Interactive Web Interface**: Beautiful, responsive frontend with real-time recipe generation
- **RESTful API**: FastAPI backend with comprehensive documentation

## 🏗️ Project Structure

```
Recipe_and_Meal_Planner/
├── api_backend/           # Backend API server
│   ├── main.py           # FastAPI application
│   ├── gemini.py         # AI recipe generation logic
│   └── requirements.txt  # Python dependencies
├── api_frontend/         # Frontend web interface
│   ├── index.html        # Main web application
│   └── server.py         # Frontend server
├── llm_api/             # LLM development files
│   └── gemini.ipynb     # Jupyter notebook for testing
├── venv/                # Python virtual environment
├── deploy.sh            # Deployment script
├── start_server.sh      # Backend server script
├── run.sh              # Python execution helper
└── README.md           # This file
```

## 🚀 Quick Start

### Prerequisites

- Python 3.8 or higher
- pip (Python package installer)
- Web browser

### Installation

1. **Clone or download the project**
   ```bash
   cd Recipe_and_Meal_Planner
   ```

2. **Create and activate virtual environment**
   ```bash
   python3 -m venv venv
   source venv/bin/activate
   ```

3. **Install dependencies**
   ```bash
   pip install -r api_backend/requirements.txt
   ```

4. **Set up environment variables** (Optional)
   Create a `.env` file in the root directory:
   ```bash
   GEMINI_API_KEY=your_google_api_key_here
   ```

### Running the Application

#### Option 1: Full Deployment (Recommended)
```bash
./deploy.sh
```
This will start both backend and frontend servers automatically.

#### Option 2: Manual Start

**Start Backend API:**
```bash
source venv/bin/activate
python api_backend/main.py
```

**Start Frontend (in new terminal):**
```bash
python api_frontend/server.py
```

#### Option 3: Individual Components

**Backend only:**
```bash
./deploy.sh backend
```

**Frontend only:**
```bash
./deploy.sh frontend
```

## 🌐 Access Points

- **Frontend Application**: http://localhost:3000
- **Backend API**: http://localhost:8001
- **API Documentation**: http://localhost:8001/docs
- **Health Check**: http://localhost:8001/

## 📖 API Endpoints

### Core Endpoints

- `GET /` - Welcome message
- `POST /ask` - Generate recipes and meal plans
- `GET /docs` - Interactive API documentation

### Example API Usage

```bash
# Generate a recipe
curl -X POST http://localhost:8001/ask \
  -H "Content-Type: application/json" \
  -d '{"user_prompt": "Give me a simple pasta recipe"}'

# Health check
curl http://localhost:8001/
```

## 🎯 Usage Examples

### Recipe Generation
- "Give me a simple pasta recipe"
- "Create a healthy breakfast smoothie"
- "Show me a vegetarian curry recipe"
- "How to make authentic biryani"
- "Quick 15-minute dinner ideas"

### Meal Planning
- "Give me a weekly meal plan for weight loss"
- "Create a vegetarian meal plan for the week"
- "Plan meals for a diabetic diet"

### Dietary Preferences
- "Gluten-free dinner options"
- "High-protein breakfast ideas"
- "Vegan dessert recipes"

## 🛠️ Development

### Backend Development

The backend uses FastAPI with the following key components:

- **FastAPI**: Modern web framework for building APIs
- **Google Generative AI**: AI-powered recipe generation
- **Uvicorn**: ASGI server for running the application
- **Pydantic**: Data validation and settings management

### Frontend Development

The frontend is a single-page application with:

- **HTML5/CSS3**: Modern, responsive design
- **JavaScript**: Interactive recipe generation
- **Font Awesome**: Beautiful icons
- **Google Fonts**: Typography (Poppins)

### File Structure Details

#### Backend (`api_backend/`)
- `main.py`: FastAPI application with CORS support
- `gemini.py`: AI recipe generation class
- `requirements.txt`: Python dependencies

#### Frontend (`api_frontend/`)
- `index.html`: Complete web application
- `server.py`: Simple HTTP server for development

## 🔧 Configuration

### Environment Variables

Create a `.env` file in the root directory:

```env
GEMINI_API_KEY=your_google_generative_ai_api_key
```

### Port Configuration

- **Backend API**: Port 8001 (configurable in `main.py`)
- **Frontend**: Port 3000 (configurable in `server.py`)

## 🚀 Deployment Scripts

### Available Commands

```bash
./deploy.sh deploy    # Start both backend and frontend
./deploy.sh backend   # Start backend only
./deploy.sh frontend  # Start frontend only
./deploy.sh status    # Check service status
./deploy.sh stop      # Stop all services
./deploy.sh restart   # Restart all services
```

### Helper Scripts

- `start_server.sh`: Start backend server with virtual environment
- `run.sh`: Execute Python files with virtual environment

## 🧪 Testing

### Backend Testing
```bash
# Test API endpoints
curl http://localhost:8001/
curl -X POST http://localhost:8001/ask \
  -H "Content-Type: application/json" \
  -d '{"user_prompt": "Give me a simple recipe"}'
```

### Frontend Testing
1. Open http://localhost:3000 in your browser
2. Try the example buttons
3. Enter custom recipe requests
4. Test the recipe generation

## 🔍 Troubleshooting

### Common Issues

1. **Port already in use**
   ```bash
   ./deploy.sh stop
   ./deploy.sh deploy
   ```

2. **Virtual environment not activated**
   ```bash
   source venv/bin/activate
   ```

3. **Dependencies not installed**
   ```bash
   pip install -r api_backend/requirements.txt
   ```

4. **API key not set**
   - Create `.env` file with your Google API key
   - Or the application will work with limited functionality

### Service Status

Check if services are running:
```bash
./deploy.sh status
```

## 📦 Dependencies

### Backend Dependencies
- `fastapi`: Web framework
- `uvicorn`: ASGI server
- `python-dotenv`: Environment variable management
- `google-generativeai`: Google's Generative AI
- `google-genai`: Alternative Google AI library

### Frontend Dependencies
- Modern web browser
- No additional installation required

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- **Google Generative AI**: For providing the AI capabilities
- **FastAPI**: For the excellent web framework
- **Font Awesome**: For the beautiful icons
- **Google Fonts**: For typography

## 📞 Support

If you encounter any issues or have questions:

1. Check the troubleshooting section above
2. Review the API documentation at http://localhost:8001/docs
3. Test the health endpoint at http://localhost:8001/

## 🎉 Getting Started

1. **Install the application** (see Installation section)
2. **Start the servers**: `./deploy.sh`
3. **Open your browser**: http://localhost:3000
4. **Start cooking**: Try the example recipes or ask for your own!

---

**Happy Cooking! 🍳✨**

