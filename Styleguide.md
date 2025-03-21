# Hardcopy Style Guide


## Color Palette

Our color palette consists of four main colors:

- **Black (#020202)**: Used for text, dark backgrounds, footer, and navigation
- **Olivine (#9eb25d)**: Primary color for hero sections and core UI elements
- **Red (#f2545b)**: Accent color for interactive elements and attention points
- **White (#ffffff)**: Used for backgrounds and text on dark backgrounds

### Semantic Usage

- **Primary UI Elements**: Olivine
- **Structural Elements**: Black 
- **Interactive Elements & Accents**: Red
- **Background/Light Elements**: White

## Typography

The application uses **Atkinson Hyperlegible** for all text. This font is designed for maximum legibility and accessibility, especially for users with low vision.

### Type Scale

- **Headings**: Use font weights of 700 (bold)
- **Body Text**: Use font weight of 400 (regular)
- **Buttons and CTAs**: Use font weight of 700 for better visibility
- **Emphasized text**: Use font weight of 700 or italics as appropriate

## Components

### Buttons

Buttons follow a consistent style using our color palette:

- **Primary Button**: Olivine background (`btn btn-primary`)
- **Secondary Button**: Olivine background (`btn btn-secondary` or `btn btn-success`)
- **Accent Button**: Red background (`btn btn-accent` or `btn-primary btn-accent`)
- **Danger Button**: Red background (`btn btn-danger`)
- **Outline Buttons**: Transparent with colored border (`btn btn-outline-primary`, `btn-outline-accent`)

Example:
```html
<button class="btn btn-primary">Primary Action</button>
<button class="btn btn-accent">Accent Action</button>
<button class="btn btn-outline-primary">Alternative Action</button>
<button class="btn btn-outline-accent">Alternative Accent</button>
```

### Cards

Cards have a clean, minimalist design with subtle shadows:

```html
<div class="card border-0 shadow-sm">
  <div class="card-body">
    <h5 class="card-title">Card Title</h5>
    <p class="card-text">Card content goes here.</p>
  </div>
</div>
```

### Navigation

The main navigation uses a dark background with white text and red accents:

```html
<nav class="navbar navbar-dark navbar-expand-lg">
  <!-- Navigation content -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link active" href="#">Active Link</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">Link</a>
    </li>
    <!-- Shopping cart with red badge -->
    <li class="nav-item">
      <a class="nav-link" href="#">
        <i class="fas fa-shopping-cart"></i>
        <span class="badge">3</span>
      </a>
    </li>
  </ul>
</nav>
```

### Alerts

Alerts use color-coded backgrounds based on their purpose:

```html
<div class="alert alert-success">Success message</div>
<div class="alert alert-danger">Error message</div>
<div class="alert alert-info">Information message</div>
```

## Icons and Badges

### Icon Colors

- **Standard Icons**: Inherit from text color
- **"Stop Landfill Waste" Icon**: Black (`fa-recycle`)
- **Accent Icons**: Red (`icon-accent`)

Example:
```html
<i class="fas fa-recycle"></i> <!-- Black icon -->
<i class="fas fa-book-open text-success"></i> <!-- Olivine icon -->
<i class="fas fa-heart icon-accent"></i> <!-- Red accent icon -->
```

### Badges

- **Standard Badge**: Olivine (`badge bg-primary`)
- **Accent Badge**: Red (`badge-accent`)
- **Shopping Cart Badge**: Red (automatically styled)

Example:
```html
<span class="badge bg-primary">Default</span>
<span class="badge-accent">Accent</span>
```

## Page Layouts

### Hero Sections

Hero sections feature the Olivine background with white text:

```html
<div class="hero py-5">
  <div class="container">
    <!-- Hero content -->
  </div>
</div>
```

### Section Alternation

For visual variety, alternate between white and light gray backgrounds:

```html
<section class="py-5"><!-- White background section --></section>
<section class="py-5 bg-light"><!-- Light gray section --></section>
```

### Footer

Footer uses black background with white text:

```html
<footer class="py-5">
  <div class="container">
    <!-- Footer content -->
  </div>
</footer>
```

## Interactive Elements

### Links

- **Standard Links**: Default styling
- **Accent Links**: Red styling with hover effect
- **Navigation Active/Hover**: Red accent color

Example:
```html
<a href="#">Standard Link</a>
<a href="#" class="link-accent">Accent Link</a>
```

### Form Elements

Form elements use accent colors for focus states:

```html
<input type="text" class="form-control" placeholder="Input field">
<select class="form-select">
  <option>Select option</option>
</select>
```

## Mission Section

The mission section should follow these guidelines:

```html
<div class="card h-100 border-0 shadow-sm">
  <div class="card-body">
    <!-- Stop Landfill icon in black -->
    <i class="fas fa-recycle fa-3x text-dark mb-3"></i>
    <h3 class="card-title h4">Stop Landfill Waste</h3>
    <p class="card-text">Description text here.</p>
  </div>
</div>
```

## Utility Classes

### Background Colors

- `.bg-primary` - Olivine background
- `.bg-accent` - Red background (use sparingly)
- `.bg-dark` - Black background
- `.bg-light` - Light background

### Text Colors

- `.text-primary` - Olivine text
- `.text-accent` - Red text
- `.text-dark` - Black text
- `.text-white` - White text
- `.text-muted` - Muted gray text

## Accessibility Considerations

- Maintain adequate contrast ratios between text and backgrounds
- Use the Atkinson Hyperlegible font consistently throughout the application
- Ensure interactive elements have clear focus states
- Provide text alternatives for non-text content
- Use semantic HTML elements