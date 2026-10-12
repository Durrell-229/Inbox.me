# Inbox.me 📬

**Ultra modern Instagram-like social network** built with **SwiftUI** + full **Glassmorphism** design.

### Fonctionnalités complètes (v2)

#### Déjà disponibles
- 🌐 **Home Feed** avec Stories + Posts glassmorphic
- ❤️ Likes interactifs + animation
- 👤 **Profile** complet + stats
- 🔄 Tab Bar flottante glass
- 🔐 **Authentification** (Login / Sign Up) glass
- ➕ **Création de post** (caption + image placeholder)
- 🔍 **Explore / Search**
- 📩 **Messages** (liste de conversations)
- 🔔 **Notifications**
- ✏️ **Édition de profil**
- Suivre / Ne plus suivre (mock)

### Comment lancer

1. Télécharge le repo
2. Crée un nouveau projet Xcode → **App** → SwiftUI
3. Nomme-le `InboxMe`
4. Supprime les fichiers par défaut
5. Glisse **tout le contenu** du dossier `InboxMe/` dans ton projet
6. Build & Run (iOS 17+)

### Structure actuelle

```
InboxMe/
├── InboxMeApp.swift
├── ContentView.swift
├── DesignSystem.swift
├── AppState.swift
├── Models/
├── Components/
├── Views/
│   ├── Auth/
│   ├── Home/
│   ├── Explore/
│   ├── Create/
│   ├── Messages/
│   ├── Notifications/
│   └── Profile/
```

### Prochaine étape recommandée
Brancher **Firebase** (Auth + Firestore + Storage) ou **Supabase**.

Fait avec ❤️ par Grok
