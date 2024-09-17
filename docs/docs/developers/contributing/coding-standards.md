# Coding Standards

This document outlines the coding standards for our Unity project. Adhering to consistent coding styles helps maintain
the readability, maintainability, and collaboration ease of our codebase. These standards are in alignment with Unity’s
C# scripting practices and incorporate additional guidelines specific to our project.

## 1. Naming and Code Style

We follow the [naming and code style tips provided by Unity](https://unity.com/how-to/naming-and-code-style-tips-c-scripting-unity) 
to ensure consistency and familiarity for all developers working in our Unity project. Key aspects of this style 
include:

- PascalCasing for public properties, class names, and methods.
- camelCasing for private fields and local variables.
- Suffix boolean variables with Is, Has, or Can (e.g., isReady, hasAccess, canShoot).
- Avoid abbreviations unless they are well-known (e.g., maxHealth is preferable over mH).

We also emphasize clarity and meaningful names over brevity, ensuring that variable and function names communicate their
intent effectively.

It is important to read the full guide at https://unity.com/how-to/naming-and-code-style-tips-c-scripting-unity for a 
more complete picture of the coding guidelines followed in this project.

## 2. Bracing Style

We use the **Allman** style for braces, which is standard in most C# coding conventions. This style places opening 
braces on a new line:

```csharp
public class Player
{
    public void Jump()
    {
        // Code here
    }
}
```

This ensures clear structure and improves readability, especially in nested code blocks.

## 3. Indentation

Indentation is essential for making code readable and understandable at a glance. We use **4 spaces** for indentation
rather than tabs. This ensures consistent formatting across different environments and prevents issues with mixed tab
and space usage.

Ensure the indentation is correct, especially when working with nested blocks of code.

### Nesting Levels

To maintain clarity and readability, the number of nesting levels within any method or function should be limited to 2
at most. If a deeper level of nesting is required, consider refactoring the code into supporting methods or even
supporting services. This helps in avoiding overly complex methods and improves the maintainability of the code.

**Example**

Instead of having deeply nested if-statements or loops:

```csharp
public void ProcessPlayerInput(Player player)
{
    if (player != null)
    {
        if (player.HasControl())
        {
            if (player.IsAlive)
            {
                if (player.HasWeapon())
                {
                    if (player.CanShoot())
                    {
                        ShootWeapon(player);
                    }
                }
            }
        }
    }
}
```

This code is difficult to read due to the excessive nesting. To improve readability, we can refactor the logic into
separate methods:

```csharp
public void ProcessPlayerInput(Player player)
{
    if (!IsValidPlayer(player)) return;

    if (CanPlayerShoot(player))
    {
        ShootWeapon(player);
    }
}

private bool IsValidPlayer(Player player)
{
    return player != null && player.HasControl() && player.IsAlive;
}

private bool CanPlayerShoot(Player player)
{
    return player.HasWeapon() && player.CanShoot();
}
```

In this refactored example, the nesting is limited to 2 levels, and the logic has been broken down into meaningful,
self-explanatory methods, making the code easier to understand and maintain. Each method handles a specific
responsibility, which also helps with unit testing and debugging.

## 4. Git Branching Strategy

When creating branches for new features or bug fixes, follow the naming conventions outlined below. These conventions
make it clear what type of change is being worked on and make branches easier to track and manage.

* **Branch Prefixes**:

  * `feature/` for new features.
  * `fix/` for bug fixes or adjustments.

* **Branch Name Format**: Use kebab-case for branch names, which involves using hyphens (-) to separate words.

Examples:

* **feature/implement-player-movement**
* **fix/camera-rotation-bug**

Following this strategy keeps the Git history clean and makes collaboration smoother, as everyone can quickly understand
the purpose of each branch.
