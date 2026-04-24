@echo off
REM NLP Chatbot Project Starter
REM Run in project root: c:/Users/manda/Downloads/NLP_Chatbot_Project_Final

echo Installing/Updating dependencies...
python -m pip install -r backend/requirements.txt

REM Create/activate venv if needed (already exists)
if not exist venv (
    python -m venv venv
)

echo Starting Backend Server (port 5000)...
start "Backend Server" cmd /k "venv\Scripts\activate.bat ^&^& python run_backend.py"

timeout /t 5 /nobreak >nul

echo Starting Frontend Server (port 5500)...
start "Frontend Server" cmd /k "py -m http.server 5500 --directory frontend"

echo.
echo ========================================
echo Servers Started!
echo Backend: http://127.0.0.1:5000
echo Frontend: http://localhost:5500
echo ========================================
echo Open browser to http://localhost:5500
echo Close terminals with Ctrl+C when done.
echo ========================================
pause
