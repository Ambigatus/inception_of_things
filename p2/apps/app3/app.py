from http.server import SimpleHTTPRequestHandler, HTTPServer
import random

facts = [
    'Cats sleep 70% of their lives.',
    'A group of cats is called a clowder.',
    'Cats can make over 100 different sounds.',
    'The first cat in space was a French cat named Felicette in 1963.',
    'Cats have five toes on their front paws, but only four on the back.',
]

class CatFactsHandler(SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/plain')
        self.end_headers()
        self.wfile.write(random.choice(facts).encode())

if __name__ == '__main__':
    server = HTTPServer(('0.0.0.0', 80), CatFactsHandler)
    print('Cat Facts API running on port 80...')
    server.serve_forever()
