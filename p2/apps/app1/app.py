from http.server import SimpleHTTPRequestHandler, HTTPServer
import random, os

class RandomArtHandler(SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/plain')
        self.end_headers()
        file = random.choice(os.listdir('/ascii-art'))
        with open(f'/ascii-art/{file}') as f:
            self.wfile.write(f.read().encode())

if __name__ == '__main__':
    server = HTTPServer(('0.0.0.0', 80), RandomArtHandler)
    print('Server running on port 80...')
    server.serve_forever()
