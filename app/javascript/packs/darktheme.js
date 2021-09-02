const switchTheme = (x) => {
    if (x.target.checked) {
      document.documentElement.setAttribute('data-theme', 'dark');
      localStorage.setItem('theme', 'dark')
    } else {
      document.documentElement.setAttribute('data-theme', 'light');
      localStorage.setItem('theme', 'light')
    }
    toggleSwitch.addEventListener('change', switchFunction, false)
  }

export { initAutocomplete }
