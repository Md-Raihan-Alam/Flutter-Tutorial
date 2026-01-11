### ❌ **Level 6 (Restart) Evaluation — Strict Review**

You improved **visually**, but you **did not follow a critical requirement**. I must be strict here because this pattern is foundational.

---

## ❌ **Score Breakdown**

| Criteria                             | Points    | Comments                                        |
| ------------------------------------ | --------- | ----------------------------------------------- |
| Correct ListView.separated + Divider | **3 / 3** | Correct.                                        |
| Selected text accurate               | **2 / 2** | Text format is correct.                         |
| Correct item highlighting            | **2 / 3** | Highlight works, but logic is not as required.  |
| **Index-based state logic**          | **0 / 2** | ❌ You used string comparison instead of index. |

---

### ❗ **Final Score: 7 / 10 — FAIL**

According to the rules:

> 🔁 **Score < 8 ⇒ Level must be restarted again**

---

## ⚠️ **Why This Failed (Very Important)**

The requirement **explicitly stated**:

> “Track the selected index (not string)”

### ❌ Your implementation:

```dart
tileColor: selected == colors[index]
```

### ✅ Required pattern:

```dart
int selectedIndex = -1;

tileColor: selectedIndex == index ? Colors.grey.shade300 : null;
```

Using **index-based state**:

- Prevents bugs
- Scales to large lists
- Is required for advanced widgets (ListView.builder, animations, Firebase lists)

This is **non-negotiable** in real Flutter apps.

---

# 🔁 LEVEL 6 (RESTART #2) — Mandatory Index State

This is the **final restart** for Level 6.
Failing again means we **pause progression** until this concept is mastered.

---

## **NEW LEVEL 6 TASK (Different Question)**

### 🎯 Objective

Use **index-based selection correctly**.

---

### **Requirements**

1. Use this list:

```dart
["Dog", "Cat", "Bird"]
```

2. Store:

```dart
int selectedIndex = -1;
```

3. Display items using **ListView.separated**

4. Add a **Divider**

5. On tap:

   - Update text:

     ```
     Selected Animal: Dog
     ```

   - Highlight selected item using:

     ```dart
     tileColor: Colors.orange.shade100
     ```

6. Highlight must be based **ONLY on index**, not string comparison.

---

### **Scoring (10 points)**

| Requirement                  | Points |
| ---------------------------- | ------ |
| ListView.separated + Divider | 3      |
| Text updates correctly       | 2      |
| Highlight via index logic    | 3      |
| Correct state structure      | 2      |

---

### 🧠 **Skeleton Hint (Do NOT copy blindly)**

```dart
int selectedIndex = -1;

onTap: () {
  setState(() {
    selectedIndex = index;
  });
}

tileColor: selectedIndex == index ? Colors.orange.shade100 : null
```

---

🔥 **Submit Level 6 again.**
Once you pass this, **Level 7 will feel easy** — but this concept must be solid first.
