class Customization < ActiveRecord::Base
  def settings
    settings = self[:settings]
    settings.present? ? JSON.parse(settings) : settings
  end

  def settings=(settings)
    self[:settings] = settings.is_a?(String) ? settings : settings.to_json
  end
end
