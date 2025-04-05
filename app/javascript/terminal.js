// Terminal Theme Javascript

document.addEventListener('DOMContentLoaded', function() {
    // Initialize terminal effects
    initTerminalEffects();
    
    // Apply typewriter effect to elements with class "typewriter-text"
    applyTypewriterEffect();
    
    // Simulate terminal command execution
    simulateCommandExecution();
    
    // Add blinking cursor effect
    addBlinkingCursor();

    // Add loading effect for product images
    addProductImageEffects();
  });
  
  // Initialize terminal effects
  function initTerminalEffects() {
    // Add a startup sequence
    const terminalContainer = document.querySelector('.terminal-container');
    if (terminalContainer) {
      terminalContainer.style.opacity = '0';
      
      // Simulate terminal startup
      setTimeout(() => {
        terminalContainer.style.transition = 'opacity 0.5s ease-in-out';
        terminalContainer.style.opacity = '1';
      }, 300);
    }
    
    // Add an event listener to create the terminal typing sound effect
    // document.addEventListener('keydown', function() {
    //   const audio = new Audio('/assets/key-press.mp3');
    //   audio.volume = 0.1;
    //   audio.play();
    // });
  }
  
  // Apply typewriter effect
  function applyTypewriterEffect() {
    document.querySelectorAll('.typewriter-text').forEach(element => {
      const text = element.textContent;
      element.innerHTML = '';
      let i = 0;
      const speed = 50; // typing speed in milliseconds
      
      function typeWriter() {
        if (i < text.length) {
          element.innerHTML += text.charAt(i);
          i++;
          setTimeout(typeWriter, speed);
        }
      }
      
      typeWriter();
    });
  }
  
  // Simulate command execution
  function simulateCommandExecution() {
    const commandElements = document.querySelectorAll('.terminal-command');
    
    commandElements.forEach((element, index) => {
      const commandText = element.querySelector('.terminal-command-text');
      if (!commandText || commandText.classList.contains('simulated')) return;
      
      const originalText = commandText.textContent;
      commandText.textContent = '';
      commandText.classList.add('simulated');
      
      // Delay each command execution by its position in the DOM
      setTimeout(() => {
        let i = 0;
        const speed = 20; // typing speed in milliseconds
        
        function typeCommand() {
          if (i < originalText.length) {
            commandText.textContent += originalText.charAt(i);
            i++;
            setTimeout(typeCommand, speed);
          }
        }
        
        typeCommand();
      }, index * 500); // Stagger the execution of each command
    });
  }
  
  // Add blinking cursor effect
  function addBlinkingCursor() {
    const cursor = document.querySelector('.terminal-command-cursor');
    if (cursor) {
      setInterval(() => {
        cursor.style.opacity = cursor.style.opacity === '0' ? '1' : '0';
      }, 500);
    }
  }

    // Add product image loading effects
    function addProductImageEffects() {
        // Add loading animation for images
        const productImages = document.querySelectorAll('.terminal-product-image img');
        
        productImages.forEach(img => {
          // Add loading class
          img.classList.add('loading');
          
          // Add loading overlay
          const overlay = document.createElement('div');
          overlay.classList.add('terminal-image-loading');
          overlay.innerHTML = '<div class="terminal-loading-text">Loading image...</div>';
          img.parentNode.appendChild(overlay);
          
          // Remove loading class and overlay when image loads
          img.onload = function() {
            img.classList.remove('loading');
            if (overlay.parentNode) {
              overlay.parentNode.removeChild(overlay);
            }
            
            // Add a subtle fade-in effect
            img.style.opacity = 0;
            setTimeout(() => {
              img.style.transition = 'opacity 0.5s ease';
              img.style.opacity = 1;
            }, 50);
          };
          
          // Handle image load errors
          img.onerror = function() {
            img.style.display = 'none';
            const errorDiv = document.createElement('div');
            errorDiv.classList.add('terminal-image-error');
            errorDiv.innerHTML = '<i class="fas fa-exclamation-triangle"></i><br>Image not found';
            img.parentNode.appendChild(errorDiv);
            
            if (overlay.parentNode) {
              overlay.parentNode.removeChild(overlay);
            }
          };
        });
        
        // Add hover effects for product cards
        const productCards = document.querySelectorAll('.terminal-product');
        
        productCards.forEach(card => {
          card.addEventListener('mouseenter', () => {
            const image = card.querySelector('.terminal-product-image img');
            if (image) {
              image.style.transform = 'scale(1.05)';
            }
          });
          
          card.addEventListener('mouseleave', () => {
            const image = card.querySelector('.terminal-product-image img');
            if (image) {
              image.style.transform = 'scale(1)';
            }
          });
        });
      }
  
  // Matrix rain effect (optional - can be added to specific pages)
  function matrixRain() {
    const canvas = document.getElementById('matrix-canvas');
    if (!canvas) return;
    
    const ctx = canvas.getContext('2d');
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
    
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789$+-*/=%"\'#&_(),.;:?!\\|{}<>[]^~';
    const columns = canvas.width / 20;
    const drops = [];
    
    for (let i = 0; i < columns; i++) {
      drops[i] = 1;
    }
    
    function draw() {
      ctx.fillStyle = 'rgba(0, 0, 0, 0.05)';
      ctx.fillRect(0, 0, canvas.width, canvas.height);
      
      ctx.fillStyle = '#00FF00';
      ctx.font = '15px monospace';
      
      for (let i = 0; i < drops.length; i++) {
        const text = characters.charAt(Math.floor(Math.random() * characters.length));
        ctx.fillText(text, i * 20, drops[i] * 20);
        
        if (drops[i] * 20 > canvas.height && Math.random() > 0.975) {
          drops[i] = 0;
        }
        
        drops[i]++;
      }
    }
    
    setInterval(draw, 33);
  }
  
  // Terminal commands registry
  const terminalCommands = {
    help: function() {
      return `
        Available commands:
        - help: Show this help message
        - ls: List files in current directory
        - cd [directory]: Change directory
        - cat [file]: Display file contents
        - clear: Clear the terminal
        - about: Show information about Hardcopy
      `;
    },
    
    ls: function() {
      return `
        drwxr-xr-x  2 visitor hardcopy  4096 Mar 24 10:00 about/
        drwxr-xr-x  2 visitor hardcopy  4096 Mar 24 10:00 store/
        drwxr-xr-x  2 visitor hardcopy  4096 Mar 24 10:00 weekly_fix/
        drwxr-xr-x  2 visitor hardcopy  4096 Mar 24 10:00 cart/
        -rw-r--r--  1 visitor hardcopy   256 Mar 24 10:00 README.md
      `;
    },
    
    cd: function(args) {
      const destination = args[0] || '';
      if (destination === 'store') {
        window.location.href = '/products';
        return 'Navigating to store...';
      } else if (destination === 'weekly_fix') {
        window.location.href = '/weekly-fix';
        return 'Navigating to weekly fix...';
      } else if (destination === 'about') {
        window.location.href = '/about';
        return 'Navigating to about...';
      } else if (destination === 'cart') {
        window.location.href = '/cart';
        return 'Navigating to cart...';
      } else if (destination === '..' || destination === '/') {
        window.location.href = '/';
        return 'Navigating to home...';
      } else {
        return `cd: ${destination}: No such directory`;
      }
    },
    
    cat: function(args) {
      const file = args[0] || '';
      if (file === 'README.md') {
        return `
          # Hardcopy
  
          Welcome to Hardcopy - a sustainable technology initiative.
          Our mission:
          1. Rescue technology from landfill
          2. Empower people with knowledge
          3. Give electronics a second life
  
          Visit our store and join our mission!
        `;
      } else {
        return `cat: ${file}: No such file`;
      }
    },
    
    clear: function() {
      const terminalOutput = document.getElementById('terminal-output');
      if (terminalOutput) terminalOutput.innerHTML = '';
      return '';
    },
    
    about: function() {
      return `
        Hardcopy v1.0.0
        A sustainable technology initiative
        Copyright (c) 2025 Hardcopy
        
        Our mission is to rescue technology from landfill,
        empower people with knowledge, and give electronics a second life.
      `;
    }
  };
  
  // Interactive terminal input
  function setupInteractiveTerminal() {
    const terminalInput = document.getElementById('terminal-input');
    const terminalOutput = document.getElementById('terminal-output');
    
    if (!terminalInput || !terminalOutput) return;
    
    terminalInput.addEventListener('keydown', function(e) {
      if (e.key === 'Enter') {
        e.preventDefault();
        
        const command = terminalInput.value.trim();
        const commandParts = command.split(' ');
        const commandName = commandParts[0];
        const commandArgs = commandParts.slice(1);
        
        // Add command to output
        const commandElement = document.createElement('div');
        commandElement.className = 'terminal-command';
        commandElement.innerHTML = `
          <span class="terminal-command-prompt">visitor@hardcopy:~$</span>
          <span class="terminal-command-text">${command}</span>
        `;
        terminalOutput.appendChild(commandElement);
        
        // Process command
        let output = '';
        if (commandName && terminalCommands[commandName]) {
          output = terminalCommands[commandName](commandArgs);
        } else if (command !== '') {
          output = `Command not found: ${commandName}`;
        }
        
        // Add output to terminal
        if (output !== '') {
          const outputElement = document.createElement('div');
          outputElement.className = 'terminal-output-text';
          outputElement.innerHTML = output;
          terminalOutput.appendChild(outputElement);
        }
        
        // Clear input
        terminalInput.value = '';
        
        // Scroll to bottom
        terminalOutput.scrollTop = terminalOutput.scrollHeight;
      }
    });
  }