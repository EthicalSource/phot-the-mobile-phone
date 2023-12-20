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
        'meta': '20px',
        'base': '24px',
        'body': '26px',
        'heading-xxs': '24px',
        'heading-xs-alt': '28px',
        'heading-xs': '28px',
        'heading-sm-alt': '40px',
        'heading-sm': '40px',
        'heading-md': '40px',
        'heading-lg': '56px',
        'heading-xl': '72px',
        'heading-xxl': '90px',
        'heading-xxxl': '170px',
      },
    },
  },
  plugins: [],
}