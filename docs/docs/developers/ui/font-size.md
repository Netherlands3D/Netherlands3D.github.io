# Font Size

Netherlands3D’s UI Toolkit theme defines a typographic scale inspired by modern digital design systems.  
Just like the spacing system uses **`--spacing-4 = 16px`** as its reference unit, our font sizes are also built from 
the same base value.

> **`--font-size-base = 16px`**  
> This is the reference font size used across the UI.  
> All other font sizes scale up or down from this base step.

This ensures consistent, predictable typography throughout all UI elements.

***

## Default Font Sizes

Below is the full font size scale as defined in the USS theme.  
Each token shows its pixel value **and its scale relative to the base font size (16px)**.

| Token    | Variable           | Value (px) | Relation to Base |
| -------- | ------------------ | ---------- | ---------------- |
| **xs**   | `--font-size-xs`   | 12px       | 0.75 × 16px      |
| **sm**   | `--font-size-sm`   | 14px       | 0.875 × 16px     |
| **base** | `--font-size-base` | 16px       | 1 × base         |
| **lg**   | `--font-size-lg`   | 20px       | 1.25 × 16px      |
| **xl**   | `--font-size-xl`   | 36px       | 2.25 × 16px      |
| **2xl**  | `--font-size-2xl`  | 48px       | 3 × 16px         |
| **3xl**  | `--font-size-3xl`  | 60px       | 3.75 × 16px      |
| **4xl**  | `--font-size-4xl`  | 72px       | 4.5 × 16px       |
| **5xl**  | `--font-size-5xl`  | 96px       | 6 × 16px         |
| **6xl**  | `--font-size-6xl`  | 128px      | 8 × 16px         |
| **7xl**  | `--font-size-7xl`  | 160px      | 10 × 16px        |

***

## How to Use These Tokens

### Body Text

```css
.body-text {
    font-size: var(--font-size-base); /* 16px */
}
```

### Small Labels

```css
.label-small {
    font-size: var(--font-size-sm); /* 14px */
}
```

### Section Headers

```css
.header-title {
    font-size: var(--font-size-xl); /* 36px */
}
```

### Large Display Text

```css
.display-large {
    font-size: var(--font-size-4xl); /* 72px */
}
```