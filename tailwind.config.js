/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./assets/js/**/*.js",
    "./lib/*_web.ex",
    "./lib/*_web/**/*.*ex",
    "./node_modules/flowbite/**/*.js",
    "./node_modules/preline/preline.js"
  ],
  theme: {
    extend: {},
  },
  plugins: [
    require('flowbite/plugin'),
    require('preline/plugin'),
  ],
}