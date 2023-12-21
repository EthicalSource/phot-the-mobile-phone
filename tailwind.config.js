/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './src/**/*.{html,md,liquid,erb,serb,rb}',
    './frontend/javascript/**/*.js',
  ],
  theme: {
    extend: {
      colors: {
        'solid-black': '#000000',
        'very-black': '#101012',
        'medium-black': '#1A1A1A',
        'dark-grey': '#383838',
        'medium-grey': '#A3A2A2',
        'off-white': '#F2F2F2',
        'lime-green': '#2EF853',
        'fuchsia': '#F20DAF',
        'blue': '#08C9f4',
        'white': '#FFFFFF',
      },
      screens: {
        'sm': '640px',
        // => @media (min-width: 640px) { ... }
  
        'md': '768px',
        // => @media (min-width: 768px) { ... }
  
        'lg': '1024px',
        // => @media (min-width: 1024px) { ... }
  
        'xl': '1280px',
        // => @media (min-width: 1280px) { ... }
  
        '2xl': '1536px',
        // => @media (min-width: 1536px) { ... }
      },
      fontSize: {
        'meta': '16px',
        'base': '16px',
        'body': '17px',
        'heading-xxs': '20px',
        'heading-xs-alt': '24px',
        'heading-xs': '24px',
        'heading-sm-alt': '36px',
        'heading-sm': '36px',
        'heading-md': '36px',
        'heading-lg': '56px',
        'heading-xl': '72px',
        'heading-xxl': '90px',
        'heading-xxxl': '170px',
      },
    },
  },
  plugins: [],
}