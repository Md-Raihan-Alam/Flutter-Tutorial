# 🚀 LEVEL 8 — Navigation with Data Passing

Now we increase difficulty slightly.

---

## **LEVEL 8 TASK**

### 🎯 Objective

Pass data from one screen to another using `Navigator`.

---

### **Requirements**

1. `HomeScreen`:

   - Has a list:

     ```dart
     ["Flutter", "Dart", "Firebase"]
     ```

   - Display them using **ListView**
   - On tap, navigate to `DetailScreen` and pass the selected string

2. `DetailScreen`:

   - Accepts a **String parameter**
   - Displays:

     ```
     You selected: Flutter
     ```

   - Has a "Go Back" button

3. Use:

   ```dart
   Navigator.push(
     context,
     MaterialPageRoute(
       builder: (_) => DetailScreen(data: value),
     ),
   );
   ```

---

### **Widgets you MUST use**

- Navigator.push
- MaterialPageRoute
- ListView
- Constructor parameter

---

### **Scoring (10 points)**

| Requirement                           | Points |
| ------------------------------------- | ------ |
| List displayed correctly              | 3      |
| Data passed via Navigator             | 3      |
| DetailScreen receives & displays data | 2      |
| Clean architecture                    | 2      |

---

🔥 **Submit your Level 8 solution when ready.**
You’re now learning **real-world Flutter patterns** 🚀
