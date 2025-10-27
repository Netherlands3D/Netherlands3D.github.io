# Writing Explanation Pages

Explanation pages in Netherlands3D are designed to **teach understanding** — *not* procedures or API details.
They connect architectural reasoning, design principles, and mental models in a way that developers, product managers,
and auditors can follow without needing to read the source code.

This guide describes how to write an **Explanation** page in our documentation using the Netherlands3D narrative
structure.

---

## 1. Purpose of Explanation Pages

Explanation pages answer the question:

> “How does this concept work — and why is it designed this way?”

They are where readers **develop a mental model**.
Unlike tutorials or guides, explanations are not step-by-step or goal-oriented. They focus on **conceptual clarity,
architectural insight, and rationale**.

You should write an Explanation page when you need to:

* Clarify how a core system (e.g., *Layers*, *Styling*, *Catalogs*, *Tiles*) fits into the overall architecture.
* Explain design trade-offs, conceptual patterns, or system lifecycles.
* Provide a shared vocabulary for technical and non-technical stakeholders.
* Help readers reason about code without diving into implementation details.

---

## 2. Relationship to the Diátaxis Framework

| Diátaxis Category | Focus               | Tone                   | Typical Output                   |
|-------------------|---------------------|------------------------|----------------------------------|
| **Tutorials**     | Learn by doing      | Friendly, step-by-step | “Hello World” examples           |
| **How-to Guides** | Achieve a goal      | Practical, direct      | “How to add a new layer type”    |
| **Explanations**  | Understand concepts | Narrative, reflective  | “How layer styles cascade”       |
| **Reference**     | Look up facts       | Precise, formal        | API lists, configuration schemas |

This guide focuses exclusively on **Explanations**. For more information, see
[https://diataxis.fr/](https://diataxis.fr/).

---

## 3. Core Structure for an Explanation Page

We use a consistent nine-part structure inspired by *Layer Styles* and *Layers* explainers.
It balances narrative storytelling with technical clarity.

| Section                                             | Purpose                                                              | Typical Elements                                                       |
|-----------------------------------------------------|----------------------------------------------------------------------|------------------------------------------------------------------------|
| **Title & Hero Image**                              | Introduce the concept visually and narratively.                      | Short metaphorical title, right-aligned image or diagram.              |
| **Intro (analogy)**                                 | Set the scene — connect an everyday metaphor to the technical topic. | A “Imagine you are…” paragraph linking real-world intuition.           |
| **Quick cheat sheet**                               | Establish audience and purpose.                                      | Three bullets: *Purpose*, *Audience*, *Mental shortcut*.               |
| **1. Mental model at a glance**                     | Present the conceptual building blocks.                              | A table mapping terms → metaphors → file locations.                    |
| **2. A day in the life of X**                       | Walk through runtime behavior or flow.                               | 4–6 steps describing lifecycle or data flow.                           |
| **3. What does X look like?**                       | Show how it looks in code or data form.                              | JSON, YAML, or code snippet representing structure.                    |
| **4. Understanding the lifecycle / cascade / flow** | Explain how the system behaves dynamically.                          | Example logic, small code block, and annotated tables.                 |
| **5. Crafting / Defining / Extending X**            | Show how to create or modify it.                                     | Step-by-step or conceptual instructions.                               |
| **6. Where X lives and how it travels**             | Describe how it connects to the rest of the system.                  | Explain persistence, serialization, or interaction with other modules. |
| **7. Tips, gotchas, conventions**                   | Capture practical wisdom and conventions.                            | Bullet list of dos, don’ts, naming, and performance notes.             |
| **8. Recap**                                        | Reinforce main takeaways.                                            | 4–6 concise summary points.                                            |
| **9. Further reading**                              | Link to related guides and references.                               | Crosslinks to guides, references, or ADRs.                             |

This structure helps maintain narrative coherence across all explanation pages.

---

## 4. Writing Style Guidelines

### Tone

* Use **plain language** and **conversational flow** — write as if explaining to a new developer joining the project.
* Prefer **analogies and metaphors** that make abstract systems tangible (“Think of the resolver as a wardrobe
  attendant”).
* Balance metaphor and precision: introduce with metaphor, then map it explicitly to real code.

### Structure and Formatting

* Use **consistent heading numbers** (1–9).
* Always include **Quick cheat sheet** early on for fast scanning.
* Include **tables** for mental models and **code blocks** for structure or examples.
* Separate sections with horizontal rules (`---`) for readability.
* Use **MkDocs callouts** (`!!! note`, `!!! warning`, `!!! example`, `!!! question`) to enrich explanations.
* Use **JSONC** syntax for serialized examples so comments can annotate meaning.

### Visuals

* Include at least one right-aligned or inline image per explainer (e.g., diagram, conceptual illustration).
* Caption images using `/// caption` blocks when relevant.
* Keep visuals conceptual — not UI screenshots — unless they explain the architecture.

### References

* Link directly to relevant `.cs` files in GitHub (preferably with permalink).
* Use relative links for internal docs (`./guides/...`, `../imgs/...`).

---

## 5. Example Skeleton Template

Use this template as a starting point for any new Explanation page:

````markdown
# [Concept Name]

![concept-diagram.png](../imgs/concept-diagram.png){align=right width=300}

Imagine you are [metaphor here].  
This document explains how [concept] works within Netherlands3D, showing its moving parts, data flow, and relationships
with other systems.

## Quick cheat sheet

- **Purpose:** [Short description]
- **Audience:** [Intended readers]
- **Mental shortcut:** [Metaphor summary]

## 1. Mental model at a glance

| Term | Think of it as | Where it lives |
|------|----------------|----------------|
| [Key term] | [Analogy] | `[File.cs]` |
| ... | ... | ... |

## 2. A day in the life of a [concept]

1. [Step 1]
2. [Step 2]
3. [Step 3]
4. ...

## 3. What does it look like?

```jsonc
{ ...example structure... }
```

## 4. Understanding the [flow/lifecycle/cascade]

Explain how this system behaves dynamically, using annotated examples or diagrams.

## 5. Crafting or extending a [concept]

Guidelines for defining or extending the concept, with examples.

## 6. Where it lives and how it travels

Explain how it’s serialized, stored, or passed between systems.

## 7. Tips, gotchas, and conventions

* [Convention 1]
* [Convention 2]
* [Performance tip]

## 8. Recap

1. [Key insight]
2. [Key insight]
3. [Key insight]

## 9. Further reading

* [Guide link]
* [Reference link]
````

---

## 6. Author Checklist

Before submitting a new Explanation page:

- [ ] The document follows the nine-section structure.
- [ ] It uses a clear, relatable metaphor in the introduction.
- [ ] It includes a Quick cheat sheet table.
- [ ] It references real code files where appropriate.
- [ ] JSON or C# snippets match current code.
- [ ] It links to at least one related **Guide** and **Reference** page.
- [ ] It has been proofread for consistent tone and technical accuracy.

---

## 7. Example Pages to Learn From

- [Layers](../../layers)
- [Layer Styles](../../styling)

---

## 8. Summary

Explanation pages form the **conceptual backbone** of the Netherlands3D documentation.  
They connect the *why* behind systems to the *how* found in guides and references, giving readers the mental model to
navigate complex architectures confidently.

By following this structure, every new explainer remains readable, cohesive, and visually aligned with the rest of the
docs — helping both new contributors and long-term maintainers understand the system, not just use it.

## 9. Further reading

- [Contributing to the documentation](documentation.md)
- [Writing guides](writing-guides.md)