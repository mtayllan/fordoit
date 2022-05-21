module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/components/**/*.html.*',
    './app/components/**/*.rb',
  ],
  plugins: [
    require('daisyui')
  ]
}
