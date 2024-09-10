# Grid-Based Movement in Godot

This project implements a grid-based movement system using Godot's `CharacterBody2D`. The player character moves across a 2D grid with a predefined grid size of `150x150`, snapping to grid positions and moving smoothly between them. The movement is controlled by the arrow keys (`ui_up`, `ui_down`, `ui_left`, `ui_right`), and the player moves one grid unit at a time.

## Project Structure

- **World**: The main scene containing the player and other nodes.
- **Player**: A `CharacterBody2D` node representing the player character.
  - **Sprite2D**: Displays the player's texture (`icon.svg`).
  - **CollisionShape2D**: Defines the player's collision area using a `RectangleShape2D`.

## Grid System

The project uses a `grid_size` of `150x150`. The player snaps to the nearest grid position when they move, and their movement is interpolated to create a smooth transition between grid points.

## Movement

The player moves in four directions:
- **Right**: `ui_right` (→)
- **Left**: `ui_left` (←)
- **Down**: `ui_down` (↓)
- **Up**: `ui_up` (↑)

The movement is processed in `_physics_process`:
- When an input is detected, the target position is set using the `set_target_position` function.
- The player smoothly moves to the target using linear interpolation (`lerp`).

## Player Script (`Player.gd`)

### Variables

- `grid_size`: The size of each grid unit (150 by default).
- `move_speed`: The speed at which the player moves between grid points (300 by default).
- `target_position`: The grid position the player is moving to.
- `is_moving`: A flag indicating if the player is currently moving.
- `movement_progress`: Tracks the progress of movement between grid positions.

### Functions

- **_ready**: Snaps the player to the nearest grid point when the game starts.
- **_physics_process**: Handles input and movement processing each frame.
- **handle_input**: Detects user input and sets the target direction for movement.
- **set_target_position**: Determines the next grid position based on input and sets the target position.
- **move_to_target**: Smoothly moves the player to the target grid position.
- **snap_to_grid**: Snaps a given position to the nearest grid point, ensuring the player is always aligned with the grid.

## Icon Label

A `Label` node displays the text:  
> Godot icon is 128 by 128  
> Script expects grid of 150 x 150

This message reminds users about the icon size and the grid configuration used in this project.

## Requirements

- **Godot Engine**: Version 3.x or higher.
- **Player Input**: Arrow keys or directional input configured to `ui_up`, `ui_down`, `ui_left`, and `ui_right` actions.

## How to Run

1. Open the project in Godot.
2. Run the scene `World.tscn`.
3. Use the arrow keys to move the player character across the grid.






It's not strictly necessary for the player to be in a separate scene from the `World`. However, separating the player into its own scene provides several advantages, particularly in terms of modularity and reusability:

### 1. **Modularity and Reusability**
   - By having the player as a separate scene, you can easily reuse the player character across different levels or worlds. If you need to make updates or changes to the player character (such as modifying the sprite, behavior, or collision settings), you can do so in one place, and it will automatically apply to all the scenes where the player is instantiated.
   - You could easily create variations of the player (e.g., different skins, abilities) by modifying the player scene or creating derived scenes.

### 2. **Ease of Management and Maintenance**
   - Separating components into different scenes allows for better organization and reduces the complexity of any single scene. Large scenes can become difficult to manage, especially when you have many objects like enemies, obstacles, and UI elements. Having the player in a separate scene makes it easier to manage its properties and behavior without cluttering the main world scene.
   - Debugging is also easier since you can focus on the player’s scene independently, making it more straightforward to isolate issues related to the player.

### 3. **Encapsulation of Functionality**
   - Encapsulation is a key software development principle. By putting the player in a separate scene, you effectively encapsulate all of the player’s functionality and components (like sprites, physics, input handling, and movement) within a single self-contained unit. This can prevent accidental modification of player logic when you're working on the world scene.
   - It allows you to focus solely on the world scene's design without worrying about the player's internal workings.

### 4. **Potential for Extension and Composition**
   - You can extend the player scene with additional features, such as different animations or mechanics, without affecting the overall structure of the `World`. For example, you might want to add power-ups or abilities that are unique to specific levels, and it's easier to manage this if the player is modular.
   - Similarly, you could add enemies or other characters as separate scenes in the same way, making the game's development more scalable as the complexity grows.

### 5. **Scene Instancing**
   - Using separate scenes allows you to instance the player scene dynamically. For instance, if you have multiple players or need to respawn a player at a different location, you can simply instance the player scene multiple times without duplicating code or setup in the main `World` scene.
  
### When Keeping Everything in One Scene Makes Sense
   - If the project is very small or simple, and you’re certain the player won’t need to be reused or heavily modified, you could keep the player as part of the `World` scene. This can reduce the number of files and might simplify things for very basic games.

In summary, while it is not mandatory to have the player as a separate scene, it is generally good practice to do so for the reasons above. It improves the maintainability, reusability, and scalability of your project, especially as it grows in complexity.

