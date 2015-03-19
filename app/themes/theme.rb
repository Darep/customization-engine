class Theme
  def customization_file
    theme_file 'customization.scss'
  end

  def name
    self.class.to_s.demodulize
  end

  def settings_file
    theme_file 'settings.yml'
  end

  def theme_file(file)
    Rails.root.join('app', 'themes', name.underscore, file)
  end
end
