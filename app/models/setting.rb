class Setting < ApplicationRecord
  belongs_to :church

  enum navbar_dark_skins: {
    "Primaire": "navbar-primary",
    "Secondaire": "navbar-secondary",
    "Vert": "navbar-success",
    "Information": "navbar-info",
    "Erreur": "navbar-danger",
    "Indigo": "navbar-indigo",
    "Purplue": "navbar-purple",
    "Pink": "navbar-pink",
    "Navy": "navbar-navy",
    "Bleu clair": "navbar-lightblue",
    "Teal": "navbar-teal",
    "Cyan": "navbar-cyan",
    "Foncé": "navbar-dark",
    "Grie foncé": "navbar-gray-dark",
    "Gris": "navbar-gray"
  }

  enum accent_colors: {
    'Primary Accent': 'accent-primary',
    'Warning Accent': 'accent-warning',
    'info Accent': 'accent-info',
    'Danger Accent': 'accent-danger',
    'Success Accent': 'accent-success',
    'Indigo Accent': 'accent-indigo',
    'Light Blue Accent': 'accent-lightblue',
    'Navy Accent': 'accent-navy',
    'Purple Accent': 'accent-purple',
    'fuchsia Accent': 'accent-fuchsia',
    'Pink Accent': 'accent-pink',
    'Maroon Accent': 'accent-maroon',
    'Orange Accent': 'accent-orange',
    'Lime Accent': 'accent-lime',
    'Teal Accent': 'accent-teal',
    'Olive Accent': 'accent-olive'
  }
  
end