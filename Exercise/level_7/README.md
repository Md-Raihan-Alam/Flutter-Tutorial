# 🚀 LEVEL 7 — Navigation (Push & Pop)

Now we move into **multi-screen apps**, a major Flutter milestone.

---

## **LEVEL 7 TASK**

### 🎯 Objective

Navigate between screens and pass data.

---

### **Requirements**

1. Create **two screens**:

   - `HomeScreen`
   - `DetailScreen`

2. `HomeScreen`:

   - Shows a button: `"Go to Details"`
   - On press → navigate to `DetailScreen`

3. `DetailScreen`:

   - Displays text:

     ```
     Welcome to Details Screen
     ```

   - Has a button: `"Go Back"`
   - Pressing button returns to `HomeScreen`

4. Use:

   ```dart
   Navigator.push()
   Navigator.pop()
   ```

---

### **Widgets you MUST use**

- Navigator.push
- Navigator.pop
- MaterialPageRoute
- Scaffold

---

### **Scoring (10 points)**

| Requirement                  | Points |
| ---------------------------- | ------ |
| Two screens created properly | 3      |
| Navigation push works        | 3      |
| Navigation pop works         | 2      |
| Clean structure              | 2      |

---

### ⚠️ Important Rule

Both screens **must be separate widgets**, not inline builders.

---

🔥 **Submit your Level 7 solution when ready.**
You are officially entering **real Flutter app territory** 🚀
