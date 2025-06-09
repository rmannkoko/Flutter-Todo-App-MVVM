# Flutter Todo App with BLoC & MVVM 

---

## Vue d'ensemble du Projet

Ce projet est une application de gestion de tâches (Todo App) développée avec **Flutter**, mettant en œuvre une architecture **MVVM** robuste. Il sert de démonstration pratique de l'intégration de **BLoC (Business Logic Component)** pour la gestion de l'état, combiné au pattern **MVVM (Model-View-ViewModel)**, avec une communication réactive basée sur les **Streams**.

L'objectif principal de ce projet est de montrer comment construire une application Flutter scalable, maintenable et testable, en séparant clairement les préoccupations entre la couche UI (Vues), la couche de présentation (ViewModels) et la couche métier (BLoCs/Repository/Services).

![MVVM Architecture](https://docs.flutter.dev/assets/images/docs/app-architecture/case-study/mvvm-case-study-ui-state-highlighted.png)
---


## Particularités


1.  **Architecture Modulaire (MVVM Architecture)**:
    * **SRP (Single Responsibility Principle).** Chaque couche (UI, ViewModel, BLoC, Repository, Service) a une responsabilité unique, ce qui facilite la compréhension, la maintenance et l'évolution du code.

2.  **Gestion d'État avec BLoC (Business Logic Component)**:
    * Utilisation du populaire pattern BLoC pour gérer l'état de l'application de manière **prévisible et découplée**.
    * Chaque opération CRUD (Create, Read/Index, Read/Show, Update, Delete) dispose de son propre BLoC dédié, garantissant une **granuralité** et une **spécificité** de la logique métier.

3.  **Pattern MVVM (Model-View-ViewModel)**:
    * Une couche ViewModel dédiée pour **transformer les états complexes des BLoCs** en un format simple et facile à consommer pour la Vue.
    * Les ViewModels exposent leur état et leurs actions via des **Streams**, offrant une approche réactive pour la mise à jour de l'UI.

4. **Fonctionnalités**:
    * CRUD (Create, Read/Index, Read/Show, Update, Delete)
    * Recherche par title/ID
---


