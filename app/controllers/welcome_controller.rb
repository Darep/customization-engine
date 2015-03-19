class WelcomeController < ApplicationController
  def index
    @css = css
  end

  private

    def css
      if customization.present?
        ThemeCssRenderer.new(customization, theme).render
      else
        ""
      end
    end

    def customization
      if params[:preview]
        Customization.where(id: params[:preview]).first
      else
        Customization.last
      end
    end

    def theme
      Simple.new
    end

end
