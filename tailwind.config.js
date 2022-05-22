module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/components/**/*.html.*',
    './app/components/**/*.rb',
  ],
  theme: {
    fontFamily: {
      sans: ['Lato', 'sans-serif']
    }
  },
  plugins: [
    require('daisyui')
  ],
  daisyui: {
    themes: ['night']
  }
}
