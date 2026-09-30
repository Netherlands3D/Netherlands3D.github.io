# Spacing

Netherlands3D's UI Toolkit theme uses a spacing scale inspired by web technologies.  
Just like the web defaults to **1rem = 16px**, our design system uses:

> **`--spacing-4 = 16px`**  
> This is the reference unit for all spacing.  
> All other spacing values scale up or down from this base step.

This creates a consistent, predictable spacing system for margins, padding, gaps, and layout measurements.

---

## Default Spacing Scale

Below is the full spacing scale as defined in the USS theme. Each size shows the pixel value **and its scale relative 
to 16px (spacing‑4)**.

| Token   | Variable        | Value (px) | Relation to Base |
| ------- | --------------- | ---------- | ---------------- |
| **0.5** | `--spacing-0_5` | 2px        | 0.125 × 16px     |
| **1**   | `--spacing-1`   | 4px        | 0.25 × 16px      |
| **2**   | `--spacing-2`   | 8px        | 0.5 × 16px       |
| **3**   | `--spacing-3`   | 12px       | 0.75 × 16px      |
| **3.5** | `--spacing-3_5` | 14px       | 0.875 × 16px     |
| **4**   | `--spacing-4`   | 16px       | 1 × base         |
| **4.5** | `--spacing-4_5` | 18px       | 1.125 × 16px     |
| **5**   | `--spacing-5`   | 20px       | 1.25 × 16px      |
| **6**   | `--spacing-6`   | 24px       | 1.5 × 16px       |
| **7**   | `--spacing-7`   | 28px       | 1.75 × 16px      |
| **7.5** | `--spacing-7_5` | 30px       | 1.875 × 16px     |
| **8**   | `--spacing-8`   | 32px       | 2 × 16px         |
| **9**   | `--spacing-9`   | 36px       | 2.25 × 16px      |
| **10**  | `--spacing-10`  | 40px       | 2.5 × 16px       |
| **11**  | `--spacing-11`  | 44px       | 2.75 × 16px      |
| **12**  | `--spacing-12`  | 48px       | 3 × 16px         |
| **14**  | `--spacing-14`  | 56px       | 3.5 × 16px       |
| **15**  | `--spacing-15`  | 60px       | 3.75 × 16px      |
| **16**  | `--spacing-16`  | 64px       | 4 × 16px         |
| **18**  | `--spacing-18`  | 72px       | 4.5 × 16px       |
| **20**  | `--spacing-20`  | 80px       | 5 × 16px         |
| **24**  | `--spacing-24`  | 96px       | 6 × 16px         |
| **28**  | `--spacing-28`  | 112px      | 7 × 16px         |
| **32**  | `--spacing-32`  | 128px      | 8 × 16px         |
| **36**  | `--spacing-36`  | 144px      | 9 × 16px         |
| **40**  | `--spacing-40`  | 160px      | 10 × 16px        |

---

## Percentage‑Based Layout Scale (12‑Column Grid)

These spacing tokens support responsive layout widths in Unity panels, chunks, and tool windows.

| Token     | Variable          | Value      |
| --------- | ----------------- | ---------- |
| **1/12**  | `--spacing-1_12`  | 8.333333%  |
| **2/12**  | `--spacing-2_12`  | 16.666667% |
| **3/12**  | `--spacing-3_12`  | 25%        |
| **4/12**  | `--spacing-4_12`  | 33.333333% |
| **5/12**  | `--spacing-5_12`  | 41.666667% |
| **6/12**  | `--spacing-6_12`  | 50%        |
| **7/12**  | `--spacing-7_12`  | 58.333333% |
| **8/12**  | `--spacing-8_12`  | 66.666667% |
| **9/12**  | `--spacing-9_12`  | 75%        |
| **10/12** | `--spacing-10_12` | 83.333333% |
| **11/12** | `--spacing-11_12` | 91.666667% |
| **auto**  | `--spacing-auto`  | auto       |
| **full**  | `--spacing-full`  | 100%       |

---

## How to Use These Tokens

### Padding

```css
.card {
    padding: var(--spacing-6); /* 24px */
}
```

### Margin

```css
.list-item {
    margin-bottom: var(--spacing-3); /* 12px */
}
```

### Column Widths

```css
.col-1-3 {
    width: var(--spacing-4_12); /* 33.333% */
}
```
