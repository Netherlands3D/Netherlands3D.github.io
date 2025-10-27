# Writing How-to Guides

How-to Guides in Netherlands3D describe **practical procedures** that achieve a *specific goal*.
They are for readers who already understand the concepts (from Explanation pages) and now want to **do something
concrete** — like *“color terrain parts,” “add a new layer type,”* or *“connect a catalog service.”*

This guide explains how to structure, write, and review a Netherlands3D **How-to Guide** following the 
[Diátaxis](https://diataxis.fr/) framework.

---

## 1. Purpose of How-to Guides

How-to Guides answer the question:

> “How do I accomplish this task?”

They focus on **getting results**, not on explaining architecture or theory.
Readers expect to follow steps, run examples, and see immediate outcomes.

You should write a How-to Guide when:

* You’re documenting a repeatable process or workflow.
* The reader already understands the *why*, and only needs the *how*.
* The procedure can be completed in a few clear steps, often with code.

---

## 2. Relationship to the Diátaxis Framework

| Diátaxis Category | Focus               | Tone                  | Typical Output                      |
|-------------------|---------------------|-----------------------|-------------------------------------|
| **Tutorials**     | Learn by doing      | Guided, educational   | “Build your first layer project”    |
| **How-to Guides** | Achieve a goal      | Practical, concise    | “How to color parts of the terrain” |
| **Explanations**  | Understand concepts | Reflective, narrative | “How layer styles cascade”          |
| **Reference**     | Look up facts       | Formal, precise       | API and configuration details       |

This page focuses exclusively on **How-to Guides**. For more information, see 
[https://diataxis.fr/](https://diataxis.fr/).

---

## 3. Standard Structure

Each guide follows a predictable structure for clarity and scanning.
Readers should be able to jump to the section they need and copy-paste code safely.

| Section                                | Purpose                                                   | Typical Elements                                        |
|----------------------------------------|-----------------------------------------------------------|---------------------------------------------------------|
| **Title**                              | Clearly describe the goal.                                | “How to color parts of the terrain”                     |
| **Introduction**                       | Explain what the reader will achieve and why it’s useful. | 2-3 lines with context.                                 |
| **Prerequisites**                      | List what’s needed before starting.                       | Layers, components, SDK versions, or project setup.     |
| **Step-by-Step Instructions**          | Core of the guide — numbered steps that lead to success.  | 3-6 sequential sections, each with code or screenshots. |
| **Verification / Testing**             | Show how to confirm the result works.                     | Checklist or run instructions.                          |
| **What’s Next?**                       | Suggest extensions or related improvements.               | Optional, encourages exploration.                       |
| **Performance Tips / Common Pitfalls** | Optimization hints or warnings.                           | Optional, but very useful.                              |
| **Further Reading**                    | Link to explanations, guides, or references.              | Always end with cross-references.                       |

---

## 4. Writing Style Guidelines

### Tone

* Be **direct and task-oriented**: readers are here to *do something*.
* Use **imperative verbs** (“Click,” “Create,” “Call,” “Add”).
* Avoid theoretical detours — link to explanation pages instead.
* Write **one goal per guide**. If a task has branches, make separate guides.

### Code and Formatting

* Use **C#** for Unity examples unless another language is unavoidable.
* Use **fenced code blocks** (` ```csharp `, ` ```jsonc `, etc.) with inline comments for clarity.
* Provide **copy-pasteable** snippets that compile or run as written.
* Separate sections with horizontal rules (`---`) for readability.
* Use MkDocs callouts (`!!! tip`, `!!! warning`, `!!! example`) to emphasize key details.

### Style of Instruction

Each step should:

1. State the goal (“Create a color mapping for terrain features”).
2. Explain the reasoning briefly (“This uses the feature’s material index”).
3. Show the code or action required.
4. Conclude with what the reader should observe (“Footpaths now appear beige.”).

### Visual and Structural Conventions

* Start every code step with a heading like **Step 1: ...**
* Use consistent section titles (`## Step 1`, `## Step 2`, etc.).
* Include at least one example output (screenshot, visual, or JSON result).
* Keep lines under ~100 characters where possible for readability in narrow docs layouts.

---

## 5. Template for a How-to Guide

````markdown
# How to [goal in plain language]

## Introduction

Briefly describe what the guide helps achieve, and why.  
Include one sentence explaining the broader context (e.g. within Netherlands3D or Unity).

---

## Prerequisites

- [Required layer or object]
- [Specific environment or component]
- [Any setup steps completed]

---

## Step 1: [Title of first step]

Explain what this step accomplishes.

```csharp
// Example code snippet
```

!!! tip
Helpful reminder or optional shortcut.

---

## Step 2: [Next step title]

...

---

## Step 3: [Verification or further configuration]

Explain how to confirm it works.

---

## What’s next?

Optional: suggest follow-up tasks or advanced variations.

---

## Performance tips

Optional: share optimizations, caveats, or best practices.

---

## Further Reading

* [Explanation: related concept](../explainers/related-concept.md)
* [Reference: relevant API](../reference/relevant-api.md)

````

---

## 6. Checklist for Authors

Before submitting your guide:

- [ ] The title clearly states a single goal.
- [ ] Steps are numbered and sequential.
- [ ] Each step shows an **action**, **explanation**, and **expected result**.
- [ ] Code compiles and matches current API signatures.
- [ ] Uses proper Markdown formatting and callouts.
- [ ] Ends with at least one link to an **Explanation** and **Reference** page.

---

## 7. Examples to Learn From

- [How to color parts of the terrain](../guides/how-to-color-parts-of-the-terrain.md)
- [How to add styling support to layers](../guides/adding-styling-support-to-layers.md)
- [How to enable functionalities for specific layers](../guides/layers-and-functionalities.md)

---

## 8. Summary

How-to Guides are **hands-on recipes**: short, focused, and reliable.  
They show how to **use** the system, not how it’s built.  
By following this structure, every new guide in Netherlands3D remains clear, repeatable, and consistent with the rest of
the [Diátaxis](https://diataxis.fr/) documentation set.

## 9. Further reading

- [Contributing to the documentation](documentation.md)
