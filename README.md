# Inbox.me 📬

**Ultra modern Instagram-like social network** built with **SwiftUI** + full **Glassmorphism / Liquid Glass** design.

> Design hyper premium : blur, materials, glass cards, floating tab bar, couleurs vibrantes.

### Features (v1)
- 🌐 Home Feed avec Stories + Posts glassmorphic
- 👤 Profile
- 🔄 Custom floating glass Tab Bar
- 🎨 Design System complet (couleurs, GlassCard, GlassButton)
- Prêt pour Firebase / Supabase

### Comment lancer le projet

1. Ouvre **Xcode** → **File > New > Project**
2. Choisis **App** (iOS)
3. Product Name : `InboxMe`
4. Interface : **SwiftUI**
5. Language : **Swift**
6. Une fois le projet créé, **supprime** les fichiers par défaut
7. Glisse tous les fichiers du dossier `InboxMe/` dans ton projet Xcode
8. Build & Run (iPhone 16 / iOS 18+)

### Structure

```
InboxMe/
├── InboxMeApp.swift
├── ContentView.swift
├── DesignSystem.swift
├── Models/
│   ├── User.swift
│   └── Post.swift
├── Views/
│   ├── Home/
│   │   ├── HomeView.swift
│   │   ├── StoryCircle.swift
│   │   └── PostCardView.swift
│   └── Profile/
│       └── ProfileView.swift
└── Components/
    └── GlassTabBar.swift
```

### Prochaines étapes
- Authentification Firebase / Supabase
- Upload d'images
- Likes, Comments, Stories réels
- Explore / Search
- Messages

Fait avec ❤️ par Grok pour Durrell-229
