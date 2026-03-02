# Font Family

Netherlands3D’s UI Toolkit theme defines a font family stack based on the **Inter** typeface.  
To ensure consistency across all UI components, the theme exposes a set of font variables for regular, semibold, and bold weights. These are loaded directly from project assets and can be referenced anywhere in USS.

The default font for most UI elements is **Inter Regular**, while headings and inspector titles use heavier styles for hierarchy and readability.

---

## Default Font Families

Below is the full set of font family variables as defined in the USS theme.

| Token        | Variable                        | File Reference                            | Weight / Usage                                                        |
| ------------ | ------------------------------- | ----------------------------------------- | --------------------------------------------------------------------- |
| **Default**  | `--nl3d-default-font`           | `Inter-Regular.ttf`                       | Regular (400). Used for body text and general UI elements.            |
| **Semibold** | `--nl3d-default-font-semi-bold` | `Inter-SemiBold.ttf`                      | Semibold (600). Used for headers and emphasized UI components.        |
| **Bold**     | `--nl3d-default-font-bold`      | `Inter-Bold.ttf`                          | Bold (700). Used for strong emphasis, titles, and inspector sections. |
| **Header**   | `--nl3d-header-font`            | Alias for `--nl3d-default-font-semi-bold` | Default font for headers in the theme.                                |

---

## File Locations

These font files are loaded from the Unity project using the `project://database` paths:

```css
--nl3d-default-font: url("project://database/Assets/Fonts/Inter-Regular.ttf?fileID=12800000&guid=37ff50315a0d57a48a81f6f17f30a981&type=3#Inter-Regular");

--nl3d-default-font-semi-bold: url("project://database/Assets/Fonts/Inter-SemiBold.ttf?fileID=12800000&guid=7a0c5ca272b294044a6d4d543221d076&type=3#Inter-SemiBold");

--nl3d-default-font-bold: url("project://database/Assets/Fonts/Inter-Bold.ttf?fileID=12800000&guid=746cabee1610bda42b4d03f49eeb6e09&type=3#Inter-Bold");

--nl3d-header-font: var(--nl3d-default-font-semi-bold);
```

---

## How to Use These variables

### Body Text

```css
.body-text {
    -unity-font-definition: var(--nl3d-default-font);
}
```

### Semibold Headings

```css
.section-title {
    -unity-font-definition: var(--nl3d-default-font-semi-bold);
}
```

### Bold Labels or Emphasis

```css
.important-label {
    -unity-font-definition: var(--nl3d-default-font-bold);
}
```

### Theme Default Heading Behavior

```css
.header {
    -unity-font-definition: var(--nl3d-header-font); /* Semibold */
}
```
