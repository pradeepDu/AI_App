# AI App

A cross-platform AI-powered chat and search application built with Flutter (mobile/web/desktop) and FastAPI (Python) backend.

## Features
- **AI Chat:** Ask questions and get intelligent answers powered by LLMs.
- **Source Search:** See sources and references for each answer.
- **Responsive UI:** Works on mobile, web, and desktop with adaptive layouts.
- **Shimmer/Skeleton Loading:** Modern loading effects for answers and sources.
- **Sidebar Navigation:** Collapsible sidebar for desktop, hidden on mobile.
- **WebSocket Communication:** Real-time, low-latency chat using WebSockets.

## Tech Stack
- **Frontend:** Flutter (Dart)
- **Backend:** FastAPI (Python)
- **WebSocket:** Real-time communication between client and server
- **LLM Integration:** Pluggable LLM service for generating answers

## Getting Started

### Prerequisites
- [Flutter](https://flutter.dev/docs/get-started/install) (3.x or newer)
- [Python 3.8+](https://www.python.org/downloads/)
- [Android Studio](https://developer.android.com/studio) (for emulator)
- [VS Code](https://code.visualstudio.com/) or any IDE

### Backend Setup (FastAPI)
1. Navigate to the `server/` directory:
   ```bash
   cd server
   ```
2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
3. Start the FastAPI server:
   ```bash
   uvicorn main:app --host 0.0.0.0 --port 8000 --reload
   ```

### Frontend Setup (Flutter)
1. Navigate to the project root:
   ```bash
   cd ..
   flutter pub get
   ```
2. Run on Android emulator:
   ```bash
   flutter run
   ```
   - For Android emulator, the app will connect to the backend using `ws://10.0.2.2:8000/ws/chat`.
   - For web, it uses `ws://localhost:8000/ws/chat`.

## Usage
- Type your question in the search bar and press the send button.
- The app will show a shimmer effect while loading.
- Answers and sources will appear in real-time as they are received from the backend.

## Troubleshooting
- **WebSocket not connecting on Android emulator?**
  - Ensure the backend is running with `--host 0.0.0.0`.
  - The app uses `10.0.2.2` to connect to the host machine from the emulator.
  - Make sure you have internet permission in `AndroidManifest.xml`.
- **App freezes or crashes?**
  - Check Logcat or Device File Explorer for tombstone files and logs.
  - Avoid blocking operations on the main thread.

## Project Structure
```
ai_app/
├── lib/
│   ├── main.dart
│   ├── pages/
│   ├── widgets/
│   ├── services/
│   └── theme/
├── server/
│   ├── main.py
│   └── ...
├── android/
├── ios/
├── web/
├── README.md
└── ...
```

## License
MIT License
