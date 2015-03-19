class ThemeCssRenderer
  attr_accessor :customization, :theme

  def initialize(customization, theme)
    @customization = customization
    @theme = theme
  end

  def render
    css = Sass::Engine.new(scss, {
      load_paths: load_paths,
      style: Rails.env.production? ? :compressed : :expanded,
      syntax: :scss
    }).render

    return css
  end

  private

    def load_paths
      [
        "./app/themes/#{theme.name.underscore}/assets/stylesheets",
        './app/assets/stylesheets/',
        './vendor/assets/stylesheets/'
      ]
    end

    def parse_setting_def(field, settings)
      return '' unless field.is_a?(Hash) and field['field'] and field['type']

      key = field['field'].to_s
      type = field['type'].to_sym
      setting = settings[key]

      if setting and (type == :image or type == :string)
        "$#{key}: \"#{setting}\";"
      elsif setting
        "$#{key}: #{setting};"
      end
    end

    def scss
      theme_scss_variables(customization.settings) + theme_customization_css
    end

    def theme_customization_css
      IO.read theme.customization_file
    end

    def theme_scss_variables(settings)
      theme_settings.reduce('') do |memo, (k,fields)|
        memo += fields.map { |f| parse_setting_def(f, settings) }.join("\n")
      end
    end

    def theme_settings
      YAML.load_file(theme.settings_file)
    rescue Errno::ENOENT
      return []
    end

end
