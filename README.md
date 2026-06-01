<h1 align="center">
  🍔 BoBo Delivery App
</h1>

<p align="center">
  A modern, full-stack E-Commerce & Food Delivery application built with Flutter and Firebase.
  <br>
  Designed to demonstrate clean architecture, robust state management, and real-time database integrations.
</p>

<p align="center">
  <a href="#features">Features</a> •
  <a href="#architecture">Architecture</a> •
  <a href="#tech-stack">Tech Stack</a> •
  <a href="#getting-started">Getting Started</a>
</p>

---

## 📱 Screenshots
*(Add your screenshots here to impress recruiters!)*

<p align="center">
  <img src="https://via.placeholder.com/250x500.png?text=Home+Screen" width="22%" />
  <img src="https://via.placeholder.com/250x500.png?text=Product+Details" width="22%" />
  <img src="https://via.placeholder.com/250x500.png?text=Cart+&+Checkout" width="22%" />
  <img src="https://via.placeholder.com/250x500.png?text=My+Orders" width="22%" />
</p>

---

## ✨ Features

- **🔐 Authentication System:** Secure email/password login, account creation, and OTP verification flow using Firebase Auth.
- **🛒 Real-time Products:** Fetches dynamic product data from Cloud Firestore. Includes Skeleton loading screens for a premium UI feel.
- **🛍️ Cart & Checkout:** Add/remove items, apply coupons, and calculate total prices dynamically.
- **📦 Order Management:** Real-world checkout logic. Orders are securely saved to Firestore and linked to the user's account (`userId`).
- **🧾 Order History (My Orders):** Users can view their past orders, total price paid, delivery dates, and product summaries fetched directly from the backend.
- **❤️ Favorites System:** Save and remove favorite items with smooth elastic animations.
- **🌗 Dark / Light Mode:** Full support for system-based theme switching.

---

## 🏗️ Architecture & State Management

This project strictly follows **Clean Architecture principles** combined with a Feature-First folder structure to ensure high scalability and testability.

### 🧩 Repository Pattern
The application separates the UI from data fetching logic. We use dedicated Repositories to interact with Firebase:
- `ProductRepository`: Handles fetching products.
- `OrderRepository`: Manages placing new orders and fetching user-specific order history.
- `UserRepository`: Manages user data reads/writes.

### 🔄 State Management (Cubit/BLoC)
State is managed centrally using **Cubit** (from `flutter_bloc`), ensuring the UI only rebuilds when necessary and eliminating spaghetti code:
- `OrderCubit`: Manages the loading, success, and error states of order placement and retrieval.
- `ProductCubit`: Handles the lifecycle of fetching products.
- `CartCubit` & `FavoriteCubit`: Manages local cart and wishlist states across the entire application.

---

## 🛠️ Tech Stack

- **Framework:** [Flutter](https://flutter.dev/) (Dart 3+)
- **Backend as a Service:** [Firebase](https://firebase.google.com/)
  - **Firebase Auth:** User Identity & Security.
  - **Cloud Firestore:** NoSQL Real-time Database.
- **State Management:** `flutter_bloc` (Cubit)
- **UI Enhancements:**
  - `skeletonizer` (For loading effects)
  - `cached_network_image` (Image caching)
  - `flutter_screenutil` (Responsive design)

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK `>=3.10.0`
- Android Studio / VS Code
- A Firebase Project

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Aboody241/BoBo-Delivery.git
   cd BoBo-Delivery
   ```

2. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup:**
   - Go to the [Firebase Console](https://console.firebase.google.com/).
   - Create a new project and enable **Authentication** (Email/Password) and **Firestore**.
   - Set up your Firestore database rules.
   - Run `flutterfire configure` in the terminal to automatically connect the app to your Firebase project.

4. **Run the App:**
   ```bash
   flutter run
   ```

---

<p align="center">
  <i>Developed with ❤️ for Portfolio Demonstration.</i>
</p>
