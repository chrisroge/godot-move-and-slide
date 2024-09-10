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

## License

This project is open-source and available under the MIT License.

