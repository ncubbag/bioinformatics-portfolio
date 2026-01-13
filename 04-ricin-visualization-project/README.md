# Ricin Protein Timeline Visualization (Group Project)

This project models a biological timeline of Ricin protein trafficking and relationships using a SQLite-backed dataset and a Plotly-based visualization approach.

## What it does
- Loads entities and relationships from a SQLite database
- Assigns vertical “lane” positions for entities based on size and containment
- Builds Plotly scatter traces that render entities as rectangles over time
- Supports moving entities (trafficking across vertical positions) and nonmoving entities

## Core components
### 1) Containment-aware sizing
Calculates a recommended vertical height for entities that *contain* other entities using counts of `Relationship = 'Contains'` across relationship tables.

### 2) Initial vertical positions
Assigns vertical coordinates based on entity heights, stacking them from top to bottom of the y-axis.

### 3) Plotly rectangle traces
Entities are drawn as rectangle-like paths in Plotly using scatter line traces:
- Moving entities bend vertically during trafficking events
- Nonmoving entities remain horizontal rectangles across their lifespan

### 4) Filtering (draft)
Includes a basic filtering idea for “Relevant vs Irrelevant” views (GUI draft not fully integrated).

## Repository layout
- `src/visualization/containment_height.py` – containment count + recommended height logic  
- `src/visualization/vertical_positions.py` – y-axis coordinate assignment  
- `src/visualization/plotly_entities.py` – coordinate generation + Plotly rendering  
- `src/visualization/filters.py` – filtering logic (draft)  
- `docs/` – documentation, symbol-language notes  

## How to run
1. Install dependencies:
   ```bash
   pip install -r requirements.txt
