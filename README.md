# Flutter Todo App with BLoC & MVVM 

---

## Vue d'ensemble du Projet

Ce projet est une application de gestion de tâches (Todo App) développée avec **Flutter**, mettant en œuvre une architecture **MVVM** robuste. Il sert de démonstration pratique de l'intégration de **BLoC (Business Logic Component)** pour la gestion de l'état, combiné au pattern **MVVM (Model-View-ViewModel)**, avec une communication réactive basée sur les **Streams**.

L'objectif principal de ce projet est de montrer comment construire une application Flutter scalable, maintenable et testable, en séparant clairement les préoccupations entre la couche UI (Vues), la couche de présentation (ViewModels) et la couche métier (BLoCs/Repository/Services).

---

## Particularités et Points Forts Clés


1.  **Architecture Modulaire (Clean Architecture)**:
    * **Séparation des préoccupations claire et nette.** Chaque couche (UI, ViewModel, BLoC, Repository, Service) a une responsabilité unique, ce qui facilite la compréhension, la maintenance et l'évolution du code.
    * Favorise la **testabilité** : la logique métier (BLoCs, Repository) est isolée de l'UI, permettant des tests unitaires efficaces.

2.  **Gestion d'État avec BLoC (Business Logic Component)**:
    * Utilisation du populaire pattern BLoC pour gérer l'état de l'application de manière **prévisible et découplée**.
    * Chaque opération CRUD (Create, Read/Index, Read/Show, Update, Delete) dispose de son propre BLoC dédié, garantissant une **granuralité** et une **spécificité** de la logique métier.

3.  **Pattern MVVM (Model-View-ViewModel)**:
    * Une couche ViewModel dédiée pour **transformer les états complexes des BLoCs** en un format simple et facile à consommer pour la Vue.
    * Les ViewModels exposent leur état et leurs actions via des **Streams**, offrant une approche réactive pour la mise à jour de l'UI.

---

## 🛠️ Technologies Utilisées

* **Flutter**: 
* **Dart**: 
* **BLoC 
* **http**: Pour les requêtes réseau (simulation d'API REST avec https://jsonplaceholder.typicode.com/todos).

---

## 🚀 Fonctionnalités

* **CRUD (Create, Read/Index, Read/Show, Update, Delete)** des tâches** (Index)
* **Rechercher une tâche** (Show)

---
