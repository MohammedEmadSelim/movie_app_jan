# 🎬 Movies Station App – Flutter Movie Application

<p align="center">
  <img src="assets/images/popcorn.png" width="140"/>
</p>

## 📌 Overview

**Movies Station App** is a modern Flutter movie application built using Clean Architecture principles and powered by the TMDB API.

The application allows users to browse trending movies, explore top-rated films, search for specific titles, and manage a personal watchlist — all within a smooth, responsive, and web-supported experience.

🌐 **Live Demo:**  
https://films-station-ghanima.netlify.app/

---

## 🏗️ Architecture

The project follows a **Feature-Based Clean Architecture** approach to ensure scalability, maintainability, and separation of concerns.

### 📂 Project Structure

```
lib/
│
├── core/
│   ├── constants/
│   ├── di/
│   ├── errors/
│   ├── network/
│   ├── routing/
│   ├── shared/
│   └── utils/
│
├── data/
│   ├── movies/
│   │   ├── data_source/
│   │   ├── model/
│   │   └── repositories/
│   │
│   └── movie_details/
│       ├── data_source/
│       ├── model/
│       └── repositories/
│
├── domain/
│   ├── movies/
│   └── movie_details/
│
├── presentation/
│   ├── home/
│   │   ├── cubit/
│   │   ├── screens/
│   │   ├── tabs/
│   │   └── widgets/
│   │
│   └── movie_details/
│       ├── cubit/
│       ├── screens/
│       ├── tabs/
│       └── widgets/
│
└── main.dart
```

---

## 🧠 Clean Architecture Layers

| Layer | Responsibility |
|-------|---------------|
| **Presentation** | UI rendering & state management using Cubit |
| **Domain** | Business logic (Entities, UseCases, Repository contracts) |
| **Data** | API calls, Models, Repository implementations |
| **Core** | Networking, DI, Routing, Error handling |

---

## ⚙️ Tech Stack

- ✅ Flutter
- ✅ Clean Architecture
- ✅ Cubit (Bloc State Management)
- ✅ Dio (Networking)
- ✅ TMDB API
- ✅ GetIt (Dependency Injection)
- ✅ Responsive UI
- ✅ Web Deployment (Netlify)

---

## ✨ Features

### 🎥 Movies Browsing
- Now Playing Movies
- Popular Movies
- Top Rated Movies
- Upcoming Movies

### 🔎 Search
- Search movies by name
- Real-time UI updates using Cubit

### 📄 Movie Details
- Movie overview
- Rating
- Release date
- Cast
- Reviews

### ❤️ Watchlist
- Add / Remove movies
- Reactive state updates

### 🌐 Web Support
- Fully responsive design
- Deployed on Netlify

---

## 🖼️ Screenshots

> All images are located inside `assets/images/`

---

### 🏠 Home

![Home](assets/images/home_screen.png)

---

### 🔎 Search

![Search](assets/images/search_tab.png)

---

### 🔍 Empty Search State

![Empty Search](assets/images/empty_search_tab.png)

---

### 📄 Movie Details – About

![About Movie](assets/images/movie_details_about_movie.png)

---

### 🎭 Movie Details – Cast

![Cast](assets/images/movie_details_cast.png)

---

### ⭐ Movie Details – Reviews

![Reviews](assets/images/movie_details_reviews.png)

---

### ❤️ Watchlist

![Watchlist](assets/images/watch_list_tab.png)

---

## 🚀 Getting Started

Clone the repository:

```bash
git clone https://github.com/abdalrhmanghanima/movies_station_app.git
cd films_app
```

Install dependencies:

```bash
flutter pub get
```

Run the project:

```bash
flutter run
```

If using code generation:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 🔌 API Configuration

This app uses **TMDB API**.

1. Create an account on https://www.themoviedb.org/
2. Generate your API Key
3. Add it inside:

```
core/network/api_manager.dart
```

---

## 📈 Technical Highlights

- Modular feature-based structure
- Scalable Clean Architecture implementation
- Proper separation between Data & Domain layers
- Reusable UI components
- Dependency Injection via GetIt
- Robust error handling
- Fully responsive UI
- Web-ready deployment

---

## 👨‍💻 Author

**Abdo Ghanima**  
Flutter Developer

