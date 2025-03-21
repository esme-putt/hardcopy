# Hardcopy Style Guide

This style guide provides guidelines for implementing the new design system across the Hardcopy application. The design uses the Atkinson Hyperlegible font and a streamlined color scheme to create a consistent user experience.

## Color Palette

Our color palette consists of five main colors:

- **Black (#020202)**: Used for text and dark backgrounds
- **Pink (#f2545b)**: Primary color for buttons, links, and highlights
- **Blue (#2d82b7)**: Used as a danger/accent color
- **Olivine (#9eb25d)**: Success/secondary color for elements like buttons and status indicators
- **White (#ffffff)**: Used for backgrounds and text on dark backgrounds

### Semantic Usage

- **Primary Actions**: Pink
- **Secondary/Success Actions**: Olivine  
- **Danger/Warning**: Blue
- **Dark UI Elements**: Black
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

- **Primary Button**: Steel Blue background (`btn btn-primary`)
- **Secondary Button**: Olivine background (`btn btn-secondary` or `btn btn-success`)
- **Danger Button**: Indian Red background (`btn btn-danger`)
- **Outline Buttons**: Transparent with colored border (`btn btn-outline-primary`, etc.)

Example:
```html
<button class="btn btn-primary">Primary Action</button>
<button class="btn btn-success">Secondary Action</button>
<button class="btn btn-outline-primary">Alternative Action</button>
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

The main navigation uses a dark background with white text:

```html
<nav class="navbar navbar-dark navbar-expand-lg">
  <!-- Navigation content -->
</nav>
```

### Alerts

Alerts use color-coded backgrounds based on their purpose:

```html
<div class="alert alert-success">Success message</div>
<div class="alert alert-danger">Error message</div>
<div class="alert alert-info">Information message</div>
```

## Page Layouts

### Hero Sections

Hero sections feature the primary Steel Blue background with white text:

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

## Accessibility Considerations

- Maintain adequate contrast ratios between text and backgrounds
- Use the Atkinson Hyperlegible font consistently throughout the application
- Ensure interactive elements have clear focus states
- Provide text alternatives for non-text content
- Use semantic HTML elements

## Implementation Guide

1. Import the Atkinson Hyperlegible font in the application layout
2. Apply the custom CSS variables for the color scheme
3. Override Bootstrap's default styling as needed
4. Update all button styles to use the new color scheme
5. Apply the new navigation and footer styles consistently across pages

## Component Examples

### Product Card

```html
<div class="card h-100 border-0 shadow-sm product-card">
  <img src="product-image.jpg" class="card-img-top" alt="Product Name">
  <div class="card-body">
    <h5 class="card-title">Product Name</h5>
    <p class="card-text">
      <span class="text-primary fw-bold">$99.99</span>
      <span class="text-muted ms-2"><s>$129.99</s></span>
    </p>
  </div>
  <div class="card-footer bg-white border-top-0">
    <div class="d-flex justify-content-between">
      <a href="#" class="btn btn-outline-primary btn-sm">View Details</a>
      <button class="btn btn-primary btn-sm">
        <i class="fas fa-cart-plus"></i>
      </button>
    </div>
  </div>
</div>
```