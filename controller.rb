layout 'layout.html.slim'

before 'consolebox/index.html.slim' do
  @page_title = 'Console Box : CameronTech.io'
  @bom = [
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
    }
  ]
end
