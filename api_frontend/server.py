#!/usr/bin/env python3
"""
Simple HTTP server to serve the frontend
"""
import http.server
import socketserver
import os
import webbrowser
from pathlib import Path

PORT = 3000

class MyHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type')
        super().end_headers()

def main():
    # Change to the frontend directory
    frontend_dir = Path(__file__).parent
    os.chdir(frontend_dir)
    
    # Create server
    with socketserver.TCPServer(("", PORT), MyHTTPRequestHandler) as httpd:
        print(f"🚀 Frontend server running at http://localhost:{PORT}")
        print(f"📁 Serving files from: {frontend_dir}")
        print(f"🌐 Open your browser and go to: http://localhost:{PORT}")
        print("Press Ctrl+C to stop the server")
        
        # Open browser automatically
        try:
            webbrowser.open(f'http://localhost:{PORT}')
        except:
            pass
        
        try:
            httpd.serve_forever()
        except KeyboardInterrupt:
            print("\n👋 Server stopped!")

if __name__ == "__main__":
    main() 