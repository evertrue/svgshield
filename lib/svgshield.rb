require 'rasem'
require 'color'
require "svgshield/version"

class Svgshield
  def initialize(subject, status, color = '#aaa')
    color = Color::CSS[color] if color[0] == '#'

    Rasem::SVGImage.new(width: 90, height: 20) do
      linearGradient('a', x2: 0, y2: '100%') do
        stop 0, '#bbb', '.1'
        stop 1, nil, '.1'
      end

      rect nil, nil, '90', '20', '3', fill: '#555', stroke_width: 0
      rect '37', nil, '53', '20', '3', fill: color, stroke_width: 0
      path fill: color, d: 'M37 0h4v20h-4z'
      rect nil, nil, '90', '20', '3', fill: 'url(#a)', stroke_width: 0

      group(
        fill: '#fff',
        'text-anchor' => 'middle',
        'font-family' => 'DejaVu Sans,Verdana,Geneva,sans-serif',
        'font-size' => 11
      ) do
        text(19.5, 15, fill: '#010101', 'fill-opacity' => '.3') { raw subject }
        text(19.5, 14, fill: '#fff') { raw subject }
        text(62.5, 15, fill: '#010101', 'fill-opacity' => '.3') { raw status }
        text(62.5, 14, fill: '#fff') { raw status }
      end
    end
  end
end
