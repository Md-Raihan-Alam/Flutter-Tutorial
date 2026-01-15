# 🚀 LEVEL 9 — Returning Data from a Screen

Now we go one step deeper.

---

## **LEVEL 9 TASK**

### 🎯 Objective

Return data **back** from `DetailScreen` to `HomeScreen`.

---

### **Requirements**

1. `HomeScreen`:

   - Displays text:

     ```
     Returned value: None
     ```

   - Has a button: `"Open Details"`

2. On button press:

   - Navigate to `DetailScreen`
   - Wait for a returned value using:

     ```dart
     final result = await Navigator.push(...)
     ```

3. `DetailScreen`:

   - Has two buttons:

     - `"Return YES"` → returns `"YES"`
     - `"Return NO"` → returns `"NO"`

   - Use:

     ```dart
     Navigator.pop(context, "YES");
     ```

4. After returning:

   - Update the text in `HomeScreen`:

     ```
     Returned value: YES
     ```

---

### **Widgets / Concepts you MUST use**

- `async` / `await`
- `Navigator.push`
- `Navigator.pop`
- State update with returned value

---

### **Scoring (10 points)**

| Requirement             | Points |
| ----------------------- | ------ |
| Await navigation result | 3      |
| Return data correctly   | 3      |
| UI updates after return | 2      |
| Clean async handling    | 2      |

---

### ⚠️ Important Hint

Your button handler **must** be `async`:

```dart
onPressed: () async {
  final result = await Navigator.push(...);
  setState(() {});
}
```

---

🔥 **Submit your Level 9 solution when ready.**
This pattern is heavily used in forms, dialogs, and settings screens.
