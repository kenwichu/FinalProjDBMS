# 🌿 **Feather Quest: Local Bird Watching App** 🌿

## **Project Overview** 🚀  
**Feather Quest** is a Java-based console application designed to enhance the experience of birdwatching enthusiasts, particularly in Batangas, Philippines. The app provides users with a platform to log and track their bird sightings, learn about various bird species, and participate in a ranking system based on the number of sightings. It features an extensive database containing detailed information on **over 50 bird species** found across the Philippines, including endemic, rare, and common birds.  

The app is designed with two types of users in mind: regular users and administrators. Regular users can log bird sightings, view their personal progress, and climb ranks through their contributions. Administrators, on the other hand, have the ability to manage the bird database by adding or removing species. This ensures that the bird data remains accurate, relevant, and up-to-date, while also allowing for the expansion of the database as new species are observed or recorded.  

The primary aim of **Feather Quest** is to make birdwatching more accessible and engaging while also promoting conservation efforts. By using the app, users can gain valuable insights into the birds of the Philippines and understand the importance of protecting local wildlife. The app fosters a sense of community by encouraging users to log sightings, compare progress through rankings, and motivate others to explore the rich birdlife of the region.  

In addition to its educational component, the app introduces a competitive element through a ranking system that rewards users for logging sightings. As users progress, they unlock higher ranks, from "No Rank" to "Phoenix," encouraging active participation. The integration of admin functionality ensures that the bird database is curated effectively, providing a robust foundation for the community.  

Through **Feather Quest**, birdwatching becomes not just a personal hobby but a tool for learning, community engagement, and contributing to environmental conservation efforts.  

---

## **How MySQL is Used in the Application** 🔧

The app integrates with MySQL as its database management system (DBMS) to handle data storage, retrieval, and updates efficiently. Here is how MySQL supports various functionalities in the app:

### **1. Database Schema Design**
The MySQL database consists of well-structured tables representing key components:
- **Users Table:** Manages user profiles, including `id`, `name`, and `password`.
- **Admins Table:** Stores admin-specific credentials for privileged access.
- **Birds Table:** Contains data on bird species, including `name`, `description`, `size`, and `rarity`.
- **Sightings Table:** Logs user-reported sightings with `user_id`, `bird_id`, and timestamp.

### **2. CRUD Operations**
- **Create:** Admins can add new bird species; users log sightings.
- **Read:** Retrieve bird information and user ranks.
- **Update:** Modify bird details.
- **Delete:** Remove obsolete records by admins.

### **3. Role Management**
The app distinguishes between regular users and administrators through role-based access control, ensuring appropriate privileges for each.

### **4. Security Measures**
- **Prepared Statements:** Prevent SQL injection.
- **Role-Based Authentication:** Separate tables and access levels for users and admins.

---

## **How OOP Principles Were Applied** 🔄  

### 1. **Encapsulation** 🔒  
Encapsulation ensures that the app’s data is securely managed. Sensitive fields like passwords are private, and access is provided through getter and setter methods.

Example:
```java
public class Bird {
    private String name;
    private String description;

    public Bird(String name, String description) {
        this.name = name;
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }
}
```

---

### 2. **Inheritance** 🔄  
The `AdminBirdWatcher` class inherits from `BirdWatcher`, reusing common functionalities while extending capabilities like managing bird species.

Example:  
```java
// Subclass: AdminBirdWatcher (inherits from BirdWatcher)
public class AdminBirdWatcher extends BirdWatcher {
    public void addBird(BirdDatabase db, String name, String description) {
        db.add(new Bird(name, description));
    }
}
```

---

### 3. **Polymorphism** 🔄  
Polymorphism is evident in overridden methods, where subclasses provide specialized implementations for shared behaviors.

---

### 4. **Abstraction** 🔍  
High-level methods like `logSighting()` simplify database interactions, hiding complex SQL operations from the user.


---

## **Chosen SDG and Its Integration** 🌍  
This project aligns with **SDG 15: Life on Land**, promoting biodiversity and conservation through education and community participation. By raising awareness about endemic and rare bird species, the app encourages users to protect local wildlife.

---

## **Instructions for Running the Program** 🛠️  

### **Prerequisites**  
1. Install **Java JDK 8+**.
2. Install MySQL Server and create the database using provided schema.
3. Configure the `config.properties` file with MySQL credentials.

### **Steps to Run**
1. **Clone the Repository:**
   ```bash
   git clone https://github.com/yourusername/feather-quest.git
   ```

2. **Compile the Code:**
   ```bash
   javac BirdWatchingApp.java
   ```

3. **Run the Application:**
   ```bash
   java BirdWatchingApp
   ```

---

## **Files and Storage** 📂  
- **MySQL Database:** Stores user, admin, bird, and sighting data.
- **Configuration File:** `config.properties` stores database credentials.

---

## **Sample Sightings Data**  
```plaintext
Bird Name: Philippine Eagle
Location: Mount Apo
Date: 2024-12-18
Time: 10:30 AM
```

