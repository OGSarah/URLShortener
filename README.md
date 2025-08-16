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

