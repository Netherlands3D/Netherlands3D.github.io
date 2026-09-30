# Color Palette

Netherlands3D’s UI Toolkit theme uses a color palette inspired by modern web design systems.  
Every color is defined as a USS variable in the USS theme and can be used consistently across all UI elements.

Colors are grouped into three categories:

1.  **Base colors** (white, black)
2.  **Blue palette** (inspired by Tailwind CSS color families)
3.  **App‑specific semantic colors** (text, links, selection, warnings)

This ensures consistent color usage throughout the UI and allows rapid theme adjustments in one place.

---

## Default Color Palette

Below is the full color palette as defined in the USS theme.

| Token     | Variable        | Value (RGB)          | Usage Notes                      |
|-----------|-----------------|----------------------|----------------------------------|
| **White** | `--color-white` | `rgb(255, 255, 255)` | Base white, surfaces, highlights |
| **Black** | `--color-black` | `rgb(0, 0, 0)`       | Base black, shadows              |

---

## Blue Color Scale

These colors form the core Netherlands3D blue palette.  
They are inspired by traditional UI color ramps, going from light backgrounds to deep accents.

| Token        | Variable           | Value (RGB)          | Typical Use |
|--------------|--------------------|----------------------|-------------|
| **Blue‑50**  | `--color-blue-50`  | `rgb(243, 247, 251)` |             |
| **Blue‑100** | `--color-blue-100` | `rgb(223, 232, 242)` |             |
| **Blue‑200** | `--color-blue-200` | `rgb(204, 215, 228)` |             |
| **Blue‑300** | `--color-blue-300` | `rgb(113, 130, 150)` |             |
| **Blue‑700** | `--color-blue-700` | `rgb(0, 70, 153)`    |             |
| **Blue‑900** | `--color-blue-900` | `rgb(47, 53, 80)`    |             |

---

## Semantic Colors

These colors are not part of the blue ramp but are used to communicate purpose in the UI.

| Token         | Variable            | Value (RGB / RGBA)       | Usage Notes                   |
| ------------- | ------------------- | ------------------------ | ----------------------------- |
| **Text**      | `--color-text`      | `rgb(50, 57, 85)`        | Default UI text color         |
| **Selection** | `--color-selection` | `rgba(0, 120, 250, 0.2)` | Highlighted selections        |
| **Link Text** | `--color-link-text` | `rgb(51, 102, 204)`      | Hyperlinks, reference actions |
| **Warning**   | `--color-warning`   | `rgb(227, 86, 86)`       | Errors, destructive actions   |

---

## How to Use These Tokens

### Background Colors

```css
.panel {
    background-color: var(--color-blue-50);
}
```

### Text Colors

```css
.label {
    color: var(--color-text);
}
```


### Error / Warning Styling

```css
.error-message {
    color: var(--color-warning);
}
```
