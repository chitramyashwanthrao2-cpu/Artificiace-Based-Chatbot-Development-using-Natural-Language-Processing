# 🤖 NLP Chatbot Project

A conversational AI chatbot built with Flask, spaCy, NLTK, and a lightweight retriever-based matching engine. Features a modern responsive web interface with dark/light themes, voice input, emoji picker, and analytics.

---

## 📁 Project Structure

```
NLP_Chatbot_Project/
├── README.md                    # This file
├── .gitignore                   # Git ignore rules
├── requirements.txt             # Backend Python dependencies
├── Dockerfile                   # Docker image configuration
├── docker-compose.yml           # Docker Compose orchestration
├── nginx.conf                   # Nginx reverse proxy config
├── run_project.bat              # Windows startup script
│
├── backend/
│   ├── app.py                   # Flask API server
│   ├── requirements.txt         # Minimal backend dependencies
│   └── minimal_requirements.txt # Ultra-minimal deps
│
├── ai/                          # AI / NLP modules
│   ├── __init__.py
│   ├── simple_retriever.py      # Lightweight Q&A retriever
│   ├── conversation_memory.py   # Session memory & personalization
│   ├── intent_classifier.py     # Intent detection
│   ├── ner_extractor.py         # Named entity recognition
│   ├── preprocess.py            # Text preprocessing pipeline
│   ├── profanity_filter.py      # Content filtering
│   ├── response_database.py     # Response templates
│   ├── response_generator.py    # Response generation
│   ├── semantic_analyzer.py     # Semantic analysis
│   ├── sentiment_analyzer.py    # Sentiment detection
│   ├── spell_checker.py         # Spell correction
│   └── topic_detector.py        # Topic classification
│
│   └── training/                # Training scripts
│       ├── train.py
│       ├── train_fixed.py
│       ├── comprehensive_training.py
│       ├── comprehensive_training_mega.py
│       ├── real_datasets.py
│       ├── 25_category_training.py
│       └── ...
│
├── frontend/                    # Web UI
│   ├── index.html               # Chat interface
│   ├── script.js                # Frontend logic
│   ├── style.css                # Modern styling
│   ├── manifest.json            # PWA manifest
│   ├── sw.js                    # Service worker
│   └── robots.txt
│
├── data/                        # Datasets & trained models
│   ├── simple_retriever.json    # Trained knowledge base
│   ├── sample_pairs.txt         # Sample Q&A pairs
│   └── full_training_data.json  # Full training corpus
│
├── saved_conversations/         # User conversation exports
│
└── docs/                        # Documentation
    ├── ADVANCED_PLAN.md
    ├── FRONTEND_GUIDE.md
    ├── TODO.md
    └── ...
```

---

## ✨ Features

- **AI Chatbot Engine** — Simple retriever with Jaccard similarity + overlap scoring
- **Conversation Memory** — Remembers user name and recent exchanges
- **Modern UI** — Responsive web interface with light/dark theme toggle
- **Voice Input** — Speech-to-text support (browser-dependent)
- **Emoji Picker** — Quick emoji insertion
- **Analytics Dashboard** — Message stats and insights
- **Search** — Search through conversation history
- **REST API** — Flask backend with CORS support
- **Real-time Status** — Backend connection indicator
- **XSS Protection** — Safe HTML escaping for messages
- **PWA Ready** — Manifest and service worker included

---

## 🚀 Quick Start

### Prerequisites

- Python 3.10+
- Windows / macOS / Linux

### Setup

```bash
# 1. Create virtual environment
python -m venv .venv
.venv\Scripts\activate          # Windows
# source .venv/bin/activate     # macOS/Linux

# 2. Install dependencies
pip install -r backend/requirements.txt

# 3. Train chatbot (build knowledge base)
python -m ai.training.train

# 4. Start backend
python backend/app.py

# 5. Start frontend (new terminal)
python -m http.server 5500 --directory frontend

# 6. Open browser
# Visit: http://localhost:5500
```

**Or on Windows, simply run:**

```bash
run_project.bat
```

---

## 🔌 API Endpoints

### `POST /chat` — Get chatbot response

**Request:**

```json
{
  "message": "Hello, how are you?"
}
```

**Response:**

```json
{
  "reply": "hello i'm doing good",
  "confidence": 0.85,
  "response_time_ms": 45,
  "metadata": {
    "user_name": "User",
    "timestamp": "2026-01-30T15:45:32.123456"
  }
}
```

### `GET /` — Health check

**Response:**

```json
{
  "status": "Clean Minimal Chatbot Backend ✅",
  "version": "Clean v1.0",
  "timestamp": "2026-01-30T15:45:32.123456"
}
```

---

## 🐳 Docker Deployment

```bash
# Build and run with Docker Compose
docker-compose up --build

# Access the app at http://localhost
```

---

## 🛠️ Tech Stack

| Layer          | Technology                            |
| -------------- | ------------------------------------- |
| **Backend**    | Python 3.10, Flask, Flask-CORS        |
| **Frontend**   | HTML5, Vanilla JS, CSS3               |
| **NLP**        | spaCy 3.8, NLTK 3.9, Custom retriever |
| **Deployment** | Docker, Nginx, Gunicorn               |

---

## 🐛 Troubleshooting

### "Backend Offline" in UI

```bash
# Check backend is running
curl http://127.0.0.1:5000/

# If port 5000 is in use
netstat -ano | findstr :5000
taskkill /PID <PID> /F
```

### "simple_retriever.json not found"

```bash
# Rebuild the knowledge base
python -m ai.training.train
```

---

## 📄 License

MIT
