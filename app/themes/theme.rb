class Theme
  def self.create(name)
    if name.present? and names.include? name
      "#{name.camelize}".safe_constantize.new
    end
  end

  def self.names
    themes = Dir.glob(Rails.root.join('app', 'themes', '*.rb'))
    themes.map { |f| File.basename(f, '.rb') }.select { |n| n != 'theme' }
  end

  def customization_file
    theme_file 'customization.scss'
  end

  def name
    self.class.to_s.demodulize
  end

  def settings
    YAML.load_file(self.settings_file)
  rescue Errno::ENOENT
    return []
  end

  def settings_file
    theme_file 'settings.yml'
  end

  def theme_file(file)
    Rails.root.join('app', 'themes', name.underscore, file)
  end
end
