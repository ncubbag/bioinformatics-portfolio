# Ricin Protein Timeline Visualization (Group Project)

This project aimed to model a biological timeline of ricin protein trafficking and molecular relationships using a SQLite-backed dataset and a Plotly-based visualization approach. It explored how complex, time-dependent biological processes can be rendered as an interactive, interpretable timeline—where entities move, bind, contain, and transform over time.

The design goal was to move beyond static network diagrams by introducing *temporal structure*, *containment*, and *biological semantics* into the visualization itself.

---

## What it does/aimed to do
- Loads entities and relationships from a SQLite database
- Assigns vertical “lane” positions for entities based on size and containment
- Builds Plotly scatter traces that render entities as rectangles over time
- Supports:
  - **Moving entities** (e.g., trafficking across cellular compartments)
  - **Nonmoving entities** (persistent structures over a time span)
  - **Nested containment** (entities within entities)

---

## Core components

### 1) Containment-aware sizing  
Calculates a recommended vertical height for entities that *contain* other entities by aggregating `Relationship = 'Contains'` across multiple relationship tables.  
This enables:
- Nested biological structures
- Multi-level containment
- Visual distinction between simple and composite entities

### 2) Initial vertical positions  
Assigns vertical coordinates based on entity heights, stacking them from top to bottom of the y-axis so that each entity occupies a clear “lane” in time.

### 3) Plotly rectangle traces  
Entities are drawn as rectangle-like paths in Plotly using scatter line traces:

- Moving entities bend vertically during trafficking events
- Nonmoving entities remain horizontal rectangles across their lifespan
- Each entity’s path is constructed from start/end times and vertical coordinates
- Paths are mirrored to form closed rectangles

This approach allows timeline-style visualization while preserving biological structure.

### 4) Filtering (draft)  
Includes an experimental design for “Relevant vs. Irrelevant” views, allowing users to hide entities that fall below a relevance threshold (e.g., based on containment or permanence).  
The concept anticipates a future GUI where users can dynamically control visual complexity.

---

## My Contributions (Nichole Cubbage)

- **Project framing & workflow design**  
  Helped define the end-to-end pipeline: build in SQL/SQLite → import into Python → visualize in Plotly → future GUI layer.

- **Visualization direction**  
  Investigated Plotly-based timeline/Gantt approaches and reached out to the Plotly community to explore how biological timelines could extend beyond standard chart constraints.

- **Biological relationship/action taxonomy**  
  Proposed and structured initial “action verb” groupings (e.g., bind, degrade, activate, modify, unknown), which became the basis for standardized relationship-action tables.

- **Database schema design (initial build)**  
  Authored the first version of the schema supporting:
  - Multiple relationship cardinalities (1:1, 1:2, 1:3, 1:many)
  - Explicit linkage between entities and relationship actions
  - Downstream compatibility with timeline visualization

- **Ricin dataset development**  
  Identified and researched ricin-pathway entities, generated biologically plausible mock data where literature gaps existed, and prepared structured records for insertion.

- **SQL data population**  
  Wrote a substantial portion of the `INSERT` statements for ricin-related entities (e.g., RTA/RTB, ER factors, ribosomal targets, chaperones) including origin, purpose, color, size, and timestamps.

- **Filtering concept (“hide irrelevant”)**  
  Took ownership of the idea and draft implementation for filtering non-relevant entities at a given timepoint to reduce visual overload in dense biological timelines.

