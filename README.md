# URL Shortener System Design

This repository contains a minimal URL shortener designed with a Node.js/Express backend, MongoDB for storage, and a SwiftUI iOS app for testing. The system is built to demonstrate a complete
end-to-end solution for URL shortening, focusing on clear use cases, requirements, and a simple yet extensible design.

# System Overview
The URL shortener system allows users to convert long URLs into short unique codes and redirect from these codes to the orginal URLs. It includes a RESTful backend API and an iOS app for user interaction, 
designed with scalability and simplicity in mind.

# Use Cases:
- A user enters a URL and gets back a short URL.
- The short URL will direct to the orginal URL when it is accessed.
- The short URL will have a default lifespan and can be customized.
- The short URL tracks its usage through metrics and analytics, but this tracking does not have to be performed in real-time.

# Requirements

### Functional Requirements:
- Users can submit a valid long URL to receive a short URL.
- Short URLs redirect to the original long URL.
- iOS app provides a simple interface to shorten URLs and display results.
- System stores URL mappings persistently.
- Short codes are unique and collision-free.

### Non-Functional Requirements:
- Performance: Handle basic API requests with low latency (< 1s for redirects).
- Scalability: Design supports future scaling (e.g., distributed database, load balancing).
- Reliability: Ensure short URLs remain valid indefinitely.
- Simplicity: Minimal implementation for local testing and development.
- Security: Validate input URLs to prevent malicious redirects.

# System Design

### Architecture:
- Backend: Node.js with Express for RESTful APIs.
   - Endpoints:
      - POST /shorten: Accepts a long URL and returns a short URL.
      - GET /:code: Redirects to the original URL based on the short code.
   - Short code generation: Uses shortid for random, unique codes (6–8 characters, base62-like).

- Database: MongoDB for storing URL mappings.
  - Schema: { shortCode: String, longUrl: String, createdAt: Date }.
  - Indexes on shortCode for fast lookups.

- iOS App: SwiftUI app for testing URL shortening and redirection.
  - Features: URL input, shorten button, short URL display, and tap-to-open functionality.

- Communication: HTTP/JSON for API requests, URLSession for iOS app communication.

### Design Decisions:
- Short Code Generation: Random shortid for simplicity; base62 with counter-based encoding can be added for scalability.
- Database Choice: MongoDB for flexibility and ease of setup (local or cloud-based with Atlas).
- iOS App: SwiftUI for modern, lightweight UI; minimal features for testing.
- Local Testing: Backend runs on localhost:3000, accessible by the iOS app in Xcode simulator.
- Extensibility: Modular design allows adding rate limiting later.

### Project Structure:
- server.js: Express backend with API logic.
- .env: Environment variables (MongoDB URI, base URL, port).
- 



