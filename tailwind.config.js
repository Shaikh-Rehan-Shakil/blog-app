/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    'app/templates/**/*.html',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter', 'sans-serif'],  
      },
    },
  },
  plugins: [],
}

