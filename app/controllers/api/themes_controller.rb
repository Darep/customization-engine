class Api::ThemesController < Api::ApiController
  def index
    themes = Theme.names.map { |n| theme_view_model(Theme.create(n)) }
    render json: { themes: themes }
  end

  def show
    theme = Theme.create(params[:id])
    render json: { theme: theme_view_model(theme) }
  end

  private

    def theme_view_model(t)
      { name: t.name, settings: t.settings }
    end

end
