# Note17 — SwiftUI & Firebase Notes App

A cloud-backed iOS note-taking application built with **SwiftUI**, **Firebase Authentication**, and **Cloud Firestore**. Users can create an account, sign in with email and password, and perform real-time CRUD (Create, Read, Update, Delete) operations on personal notes synchronized across sessions.

---

## Features

- **Email & Password Authentication:** User registration, login, and session persistence powered by `FirebaseAuth`.
- **Real-Time Cloud Sync:** Live document streaming and automatic UI updates using Cloud Firestore snapshot listeners (`FirebaseFirestore` & `FirebaseFirestoreSwift`).
- **Declarative SwiftUI Interface:** Clean, reactive views structured around the MVVM (`ObservableObject`, `@StateObject`, `@EnvironmentObject`) pattern.
- **Note Management:** Create new notes via modal sheets, view alphabetically ordered notes in real time, and delete notes instantly.

---

## Tech Stack & Environment

- **Framework:** SwiftUI
- **Language:** Swift 5
- **Backend:** Google Firebase (`FirebaseAuth`, `FirebaseFirestore`, `FirebaseFirestoreSwift`)
- **Firebase iOS SDK:** `9.6.0` (via Swift Package Manager)
- **IDE & Target:** Xcode 14.1+ / iOS 16.1+

---

## Project Structure

```text
Note17/
├── Note17App.swift          # App entry point, Firebase initialization, and Auth gate
├── AuthViewModel.swift      # ObservableObject handling Sign In, Sign Up, and Sign Out
├── NoteViewModel.swift      # Note model (@DocumentID) and FirestoreManager CRUD operations
├── ContentView.swift        # Main notes list UI, delete action, and Sign Out button
├── AddNoteView.swift        # Modal form sheet to add new notes to Firestore
├── GoogleService-Info.plist # Firebase project configuration file
└── Assets.xcassets          # App icons and color assets
```

---

## Getting Started

### 1. Clone the Repository
```bash
git clone [https://github.com/mesbaul2022/Note17-SwiftUI-Firebase.git](https://github.com/mesbaul2022/Note17-SwiftUI-Firebase.git)
cd Note17-SwiftUI-Firebase
```

### 2. Configure Firebase
1. Go to the [Firebase Console](https://console.firebase.google.com/) and create or select your project (`noteb17`).
2. Register an **iOS+** app with Bundle Identifier `com.mesbaul.Note17`.
3. Download **`GoogleService-Info.plist`** and drag it into the `Note17` folder in Xcode (ensure **Copy items if needed** and target **`Note17`** are checked).
4. In the Firebase Console:
   - Enable **Email/Password** under **Build → Authentication → Sign-in method**.
   - Create a **Cloud Firestore** database under **Build → Firestore Database**.

### 3. Enable Keychain Sharing in Xcode
1. Select the **`Note17`** project in the Xcode Project Navigator.
2. Select the **`Note17`** target → **Signing & Capabilities**.
3. Click **`+ Capability`** and add **Keychain Sharing** (required for Firebase Auth session storage on the iOS Simulator).

### 4. Xcode 14.1 Beta Workaround (If Applicable)
If building on Xcode 14.1 Beta with Firebase SDK `9.6.0`, stub out `FIRGameCenterAuthProvider.m` in `DerivedData` to prevent a GameKit compilation issue:

```bash
rm -f ~/Library/Developer/Xcode/DerivedData/Note17-*/SourcePackages/checkouts/firebase-ios-sdk/FirebaseAuth/Sources/AuthProvider/GameCenter/FIRGameCenterAuthProvider.m
for f in ~/Library/Developer/Xcode/DerivedData/Note17-*/SourcePackages/checkouts/firebase-ios-sdk/FirebaseAuth/Sources/AuthProvider/GameCenter; do
  echo "//test dummy file" > "$f/FIRGameCenterAuthProvider.m"
done
```

### 5. Build and Run
Select an **iPhone Simulator** (e.g., iPhone 14 Pro — iOS 16.1) in Xcode and press **Cmd + R** to build and run the application.

---

## Author

**Md. Mesbaul Islam**  
GitHub: [@mesbaul2022](https://github.com/mesbaul2022)
