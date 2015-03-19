Customization engine
====================

Rails-based customization engine.

### Usage

Start the Rails server with:

    $ rails s

Open up a rails console session:

    $ rails c

Create an empty, dummy Customization with some settings:

    > Customization.create(settings: { :'color-brand' => '#0076A0', :'color-text' => '#232326', :'header-title-color' => '#FFFFFF' })

Open http://localhost:3000/ and witness the customization working! Yay!
