layout 'layout.html.slim'

# don't try to turn partials into real paths
ignore /\/_.*/
ignore /\.sass-cache/
ignore /Gemfile.*/
ignore /.ruby-version/
ignore /.gitignore/

helpers do
  def price(item)
    output = sprintf("$%0.02f", item[:cost])
    output += '/each' if item[:multiple]
    output
  end

  def total(items)
    total_cost = items.collect { |item| item[:cost] * (item[:multiple] || 1) }.sum
    sprintf("$%0.02f", total_cost)
  end
end

before /consolebox\/.*/ do
  @page_title = 'Console Box : CameronTech.io'
  @tabs = {
    :index => 'Introduction',
    :bom => 'Bill of Materials',
    :design => 'Design & Files',
    :construction => 'Construction'
  }
end

before 'consolebox/bom.html.slim' do
  @bom = {
    :electrical => [
      {
        :link => 'http://amzn.to/2EDdUBJ',
        :title => 'Raspberry Pi 3, Model B',
        :description => 'The brains of the whole operation. The Raspberry Pi 3 is a 1.2GHz quad-core computer with 1GB of RAM. This board is sufficient to run everything up to and including a Nintendo 64 and Playstation 1, although performance may vary between ROMs.',
        :cost => 37.93
      },
      {
        :link => 'http://amzn.to/2qeC1mZ',
        :title => '128GB SD Card',
        :description => 'This should give you plenty of storage for your ROMs including those bigger Sega CD images (600MB+ each!). If you don\'t plan on needing this much room you can save some money with <a href="http://amzn.to/2ECZlOF">16GB</a>, <a href="http://amzn.to/2Cu4RFZ">32GB</a> or <a href="http://amzn.to/2EDxD46">64GB</a> cards. Or, if you plan on storing every game ever made, these are currently available up to <a href="http://amzn.to/2lLPfSG">400GB</a>(!)',
        :cost => 44.62
      },
      {
        :link => 'http://amzn.to/2CeBjaU',
        :title => '10.1" HDMI Screen',
        :description => 'There are tons of HDMI screens available for the Pi. This just happens to be one that I\'ve found that has a higher resolution (1280x800) and will run on 5V (which is what our battery likes to output). You\'ll find the same controller board available on tons of different screens so they should all run on 5V, even if the description says 12V. You can save some money here by going with a lower resolution or smaller screen (7" is another popular size).',
        :cost => 79.99
      },
      {
        :link => 'http://amzn.to/2CGV9Na',
        :title => 'Anker 13000mAh Battery',
        :description => 'This rechargeable battery pack should provide about 8 hours of play time with the recommended components. This version includes a micro USB input for power, but a <a href="">USB-C version</a> is available as well. The only difference would be the cable you\'d use to connect the front power input connection to the battery. If you want even more play time between charges check out the <a href="http://amzn.to/2CxISgw">20100mAh</a> or <a href="http://amzn.to/2CbEIaB">26800mAh</a> which is the largest lithium ion battery you\'re legally allowed to travel on an airplane with!',
        :cost => 31.99
      },
      {
        :link => 'http://amzn.to/2CddJvm',
        :title => 'DROK 3W Audio Amplifier',
        :description => 'This unit powers your speakers and provides volume control. With the recommended speakers below 3W is more than enough (turning the volume up half way is louder than I\'d ever need them to play) but there are <a href="http://amzn.to/2CejvNg">5W</a> and <a href="http://amzn.to/2CgkBIw">15W</a> versions available as well (just make sure your speakers can handle the additional power at higher volumes). You  also need to double check that the board still fits in the provided space in the design.',
        :cost => 8.55
      },
      {
        :link => 'http://amzn.to/2CsZo1h',
        :title => '2" Aluminum Full-Range Speaker (x2)',
        :description => 'A great sounding speaker that even has a little bass. You can find cheaper speakers at similar sizes, but you\'ll probably need to update the mounting holes in the faceplate to match. Make sure you get two of these!',
        :cost => 11.52,
        :multiple => 2
      },
      {
        :link => 'http://amzn.to/2CePLQh',
        :title => '8bitdo SF30 Pro Controller (x2)',
        :description => 'Quite possiblity the most important part of your system! These controllers have the great Super Famicom/SNES layout plus analog sticks and a second pair of L and R buttons, making them compatible with every system up to and including the latest Playstation and Xbox conrollers. Also available with the <a href="http://amzn.to/2Cy381u">SNES color scheme</a> (and concave X/Y buttons) I can\'t say enough about how much I love these things, even if they are pricey. If you don\'t need the analog sticks take a look at the less expensive <a href="http://amzn.to/2EE5FoW">SNES30</a> or <a href="http://amzn.to/2CdPL2Y">NES30</a> for even retro-er styling but still with 4 main buttons + L and R.',
        :cost => 49.99,
        :multiple => 2
      },
      {
        :link => 'http://amzn.to/2Cxi9jS',
        :title => 'Sound Blaster PLAY! 3',
        :description => 'Unfortunately the audio output on the Raspberry Pi is absolute garbage. I\'m talking about the headphone jack, not the HDMI audio out (which sounds great). This USB soundcard plugs into the Pi and gives you great sound again. You could leave this out altogether and plug directly into the Pi, but if you care about sound at all you\'ll regret it.',
        :cost => 24.99
      },
      {
        :link => 'http://amzn.to/2CkFaDm',
        :title => 'USB-C Connector',
        :description => 'We need a way to charge the battery once it\'s hidden away inside the box so we\'ll need a connector to the outside world. The controllers have USB-C connectors and come with cables so I figured to keep things simple I\'d use USB-C for the charing port as well. If you go with a different 8bitdo controller you\'ll get <a href="http://amzn.to/2CjqrsB">micro-USB connectors</a> so you might one one for the charging port as well.',
        :cost => 5.88
      },
      {
        :link => 'http://amzn.to/2CAS4Sb',
        :title => '5v Relay',
        :description => 'When the Pi turns on it should turn on the screen and audio amplifier at the same time. We do that with a relay. The battery has 2 USB connectors. One goes to the Pi, the other goes to this relay and will feed the screen and amplifier once the relay gets the 5v turn on signal from the Pi\'s GPIO pins.',
        :cost => 5.80
      },
      {
        :link => 'http://amzn.to/2qiBm4b',
        :title => 'Power Switch',
        :description => 'We need a way to turn everything on and off. I like a nice quality button so I went with this one, but this is one place where you could save money. You can find much more inexpensive switches that will do the job, but other than the controllers this is just about the only other thing you\'ll interact with on your box so why not make it a quality component? If you go with something else, make sure it\'s a "momentary" switch (meaning it\'s only ON while pushed).',
        :cost => 9.60
      },
      {
        :link => 'http://amzn.to/2qlxLlE',
        :title => 'USB Hub',
        :description => 'If you don\'t want to rely on only the bluetooth connection on your controllers for input to the Pi you\'ll want to provide a way for the user to attach other devices. Maybe you want to hook up <a href="http://amzn.to/2qgLYR9">6-button Mega Drive/Genesis controllers</a>, or a <a href="https://www.amazon.com/Logitech-920-007119-Wireless-Keyboard-Connected/dp/B014EUQOGK">keyboard</a>, or anything else you can connect via USB!',
        :cost => 6.99
      },
      {
        :link => 'http://amzn.to/2Cynp6R',
        :title => 'Volume Knob',
        :description => 'This is probably the most extravagant purchase in the whole build. I like a nice knob and finally found this one. It\'s heavy and looks amazing. The amplifier board comes with a little black knob which works fine but in my opinion doesn\'t match the rest of the components surrounding the screen (stainless steel and aluminum). This knob helps tie everything together, but there are <a href="https://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=potentiometer+knob&rh=i%3Aaps%2Ck%3Apotentiometer+knob">plenty of other options</a>.',
        :cost => 13.63
      },
      {
        :link => 'http://amzn.to/2CxjgA9',
        :title => 'Wire',
        :description => 'We\'ll need some random wire lengths to hook up various components. 22ga is good size for what we\'ll be hooking up&mdash;power between the relay and amplifier, the speakers, etc.',
        :cost => 6.99
      }
    ],

    :construction => [
      {
        :link => 'http://amzn.to/2CjTjRi',
        :title => 'Solid Wood',
        :description => 'This can be pretty much anything you want. You can get it locally at a <a href="https://www.homedepot.com/b/Lumber-Composites-Appearance-Boards-Planks-Softwood-Hardwood-Boards/Unfinished/N-5yc1vZchznZ1z0sfpa">home center</a>, or if you\'re lucky you\'ll have a real <a href="https://www.google.com/maps/search/hardwood+lumber">hardwood lumberyard nearby</a>. You can also buy it <a href="https://www.cookwoods.com">online</a> and will probably be your only option if you\'re looking for <a href="https://www.cookwoods.com/wood-by-species/purpleheart">something</a> <a href="https://www.cookwoods.com/wood-by-species/zebra">really</a> <a href="https://www.cookwoods.com/wood-by-species/ebony">exotic</a>. If you build your box just like mine you\'ll need about 3 board feet of wood (1 board foot is 12" x 12" x 1" thick). 3 board feet assumes no waste and you really know what you\'re doing. See the <a href="design.html">Designs</a> and <a href="construction.html">Construction</a> sections for how the box is built and you\'ll get an idea of how much to buy.'
      },
      {
        :link => 'http://amzn.to/2EROosv',
        :title => 'Plywood',
        :description => 'Because of how wood moves, you can\'t build a largish box completely out of solid wood&mdash;it will expand and contract as the seasons change and destroy itself before too long. To combat this tedency we only build the sides out of solid wood and make the top and bottom out of plywood. This means that technically the box will get taller and shorter throughout the seasons, but probably not enough that you\'ll notice. Since the top and bottom are plywood it will stay the same length and width. You\'ll need 2 square feet for the top and bottom and another 2 for the base that holds the controllers and pocket on the side. You can get plywood at your local home center, although this design calls for 1/2" thick which may not be available (3/4" is the default thickness for cabinets, which is what the home center lumber is meant for). You can buy it online but will be much cheaper at a local store (that link above is $25 per sheet, but I can get it locally for $9). And the bigger the sheet is, the cheaper it will be per square foot.'
      },
      {
        :link => 'http://amzn.to/2CN39fr',
        :title => 'Hinges (x2)',
        :description => 'The lid to the box will be relatively heavy when open. Quadrant hinges are perfect for this as they have a stop built in that will prevent the lid from opening any further and the solid brass looks amazing. There are <a href="http://amzn.to/2CMkvsU">other versions</a> available, but aren\'s nearly as good looking (in my opinion). You could also go with a <a href="http://amzn.to/2EQQA3k">basic hinge</a> and use a chain or piece of leather to keep the lid from opening too far.'
      },
      {
        :link => 'http://amzn.to/2qhilPo',
        :title => 'Box Catch/Lock',
        :description => 'A nice catch to keep the lid from opening. Again, another place where you could save money by going with something like <a href="http://amzn.to/2CMUeLg">this</a> or even a <a href="http://amzn.to/2CAifaI">lock</a>. Maybe something a little more <a href="http://amzn.to/2ENJiNX">steampunk</a>? There are <a href="https://www.amazon.com/s/ref=nb_sb_noss_1?url=search-alias%3Daps&field-keywords=box+latch">lots of options</a>.'
      },
      {
        :link => 'http://amzn.to/2Cj3TrY',
        :title => '#10-24, 3/4" screws (x4)',
        :description => 'The screws for attaching the front panel to the box. I like these socket head screws but they\'re pricey. This is another place where you can save money by picking up some plain screws for $0.15 a piece at Home Depot. Just make sure they\'re the same thread size: #10-24 and 3/4" long.'
      },
      {
        :link => 'http://amzn.to/2EMyVtT',
        :title => '#6-32, 3/4" screws (x8)',
        :description => 'These are the screws needed to attach the speakers to the front panel. The same advice applies as above. Again, 3/4" long.'
      }
    ]
  }
end
