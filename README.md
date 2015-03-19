Customization engine
====================

Theme customization engine demo built with Rails.


### Understand

Most of the heavy lifting is done in [app/classes/theme_css_renderer.rb](https://github.com/Darep/customization-engine/blob/master/app/classes/theme_css_renderer.rb), check that file out. It utilises the files of a simple demo theme in [app/themes](https://github.com/Darep/customization-engine/tree/master/app/themes). The actual customization settings are stored in the database as [Customization models](https://github.com/Darep/customization-engine/blob/master/app/models/customization.rb).


### Usage

Start the Rails server with:

    rails s

Open up a rails console session:

    rails c

Create an empty, dummy Customization with some settings:

    Customization.create(settings: { :'color-brand' => '#0076A0', :'color-text' => '#232326', :'header-title-color' => '#FFFFFF' })

Open [http://localhost:3000/](http://localhost:3000/) and witness the customization working! Yay!
