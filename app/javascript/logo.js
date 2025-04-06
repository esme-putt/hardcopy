// ASCII Logo Animation for Hardcopy
document.addEventListener('DOMContentLoaded', function() {
    // Target the ASCII art container on the home page
    const asciiContainer = document.querySelector('.ascii-art');
    
    // Debug: Log if we found the element or not
    console.log('ASCII container found:', asciiContainer !== null);
    
    // Only run on pages with the ASCII art (like home page)
    if (!asciiContainer) return;
    
    // Array of different ASCII art styles for "HARDCOPY"
    const asciiStyles = [
    // Money style
    `
    
 /$$   /$$                           /$$                                        
| $$  | $$                          | $$                                        
| $$  | $$  /$$$$$$   /$$$$$$   /$$$$$$$  /$$$$$$$  /$$$$$$   /$$$$$$  /$$   /$$
| $$$$$$$$ |____  $$ /$$__  $$ /$$__  $$ /$$_____/ /$$__  $$ /$$__  $$| $$  | $$
| $$__  $$  /$$$$$$$| $$  \__/| $$  | $$| $$      | $$  \ $$| $$  \ $$| $$  | $$
| $$  | $$ /$$__  $$| $$      | $$  | $$| $$      | $$  | $$| $$  | $$| $$  | $$
| $$  | $$|  $$$$$$$| $$      |  $$$$$$$|  $$$$$$$|  $$$$$$/| $$$$$$$/|  $$$$$$$
|__/  |__/ \_______/|__/       \_______/ \_______/ \______/ | $$____/  \____  $$
                                                            | $$       /$$  | $$
                                                            | $$      |  $$$$$$/
                                                            |__/       \______/ 
    `,
      
    // Inset style
    `  
                                                                                    
    _/    _/                            _/                                          
   _/    _/    _/_/_/  _/  _/_/    _/_/_/    _/_/_/    _/_/    _/_/_/    _/    _/   
  _/_/_/_/  _/    _/  _/_/      _/    _/  _/        _/    _/  _/    _/  _/    _/    
 _/    _/  _/    _/  _/        _/    _/  _/        _/    _/  _/    _/  _/    _/     
_/    _/    _/_/_/  _/          _/_/_/    _/_/_/    _/_/    _/_/_/      _/_/_/      
                                                           _/              _/       
                                                          _/          _/_/          

    `,
      
    // Chunky style
    `
 __   __  _______  ______    ______   _______  _______  _______  __   __ 
|  | |  ||   _   ||    _ |  |      | |       ||       ||       ||  | |  |
|  |_|  ||  |_|  ||   | ||  |  _    ||       ||   _   ||    _  ||  |_|  |
|       ||       ||   |_||_ | | |   ||       ||  | |  ||   |_| ||       |
|       ||       ||    __  || |_|   ||      _||  |_|  ||    ___||_     _|
|   _   ||   _   ||   |  | ||       ||     |_ |       ||   |      |   |  
|__| |__||__| |__||___|  |_||______| |_______||_______||___|      |___|  
    
    `,
      
    // ANSI style
    ` 
██   ██  █████  ██████  ██████   ██████  ██████  ██████  ██    ██ 
██   ██ ██   ██ ██   ██ ██   ██ ██      ██    ██ ██   ██  ██  ██  
███████ ███████ ██████  ██   ██ ██      ██    ██ ██████    ████   
██   ██ ██   ██ ██   ██ ██   ██ ██      ██    ██ ██         ██    
██   ██ ██   ██ ██   ██ ██████   ██████  ██████  ██         ██    
    `,
      
    // Original style
    `
██╗  ██╗ █████╗ ██████╗ ██████╗  ██████╗ ██████╗ ██████╗ ██╗   ██╗
██║  ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔═══██╗██╔══██╗╚██╗ ██╔╝
███████║███████║██████╔╝██║  ██║██║     ██║   ██║██████╔╝ ╚████╔╝ 
██╔══██║██╔══██║██╔══██╗██║  ██║██║     ██║   ██║██╔═══╝   ╚██╔╝  
██║  ██║██║  ██║██║  ██║██████╔╝╚██████╗╚██████╔╝██║        ██║   
╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚═════╝ ╚═╝        ╚═╝

    `
    ];
    
    console.log('Animation initialized with', asciiStyles.length, 'styles');
    
    // Store the original content and add it as the first style if needed
    const originalAscii = asciiContainer.innerHTML.trim();
    if (!asciiStyles.includes(originalAscii)) {
      // Log the original content for debugging
      console.log('Original ASCII content:', originalAscii);
    }
    
    let currentStyleIndex = 0;
    
    // Function to cycle through ASCII styles
    function cycleAsciiStyle() {
      console.log('Cycling to style #', (currentStyleIndex + 1) % asciiStyles.length);
      
      // Apply fade-out effect
      asciiContainer.style.transition = 'opacity 0.5s ease-out';
      asciiContainer.style.opacity = '0';
      
      // After fade-out, change the content and fade back in
      setTimeout(() => {
        currentStyleIndex = (currentStyleIndex + 1) % asciiStyles.length;
        // Use textContent instead of innerHTML for security and proper whitespace handling
        asciiContainer.textContent = asciiStyles[currentStyleIndex];
        
        // Apply fade-in effect
        setTimeout(() => {
          asciiContainer.style.opacity = '1';
        }, 50);
      }, 500);
    }
    
    // Start the animation cycle every 3 seconds
    const animationInterval = setInterval(cycleAsciiStyle, 3000);
    console.log('Animation started with interval ID:', animationInterval);
  });