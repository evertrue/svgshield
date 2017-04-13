require 'rasem'
require 'color'
require 'svgshield/version'

class Svgshield
  attr_reader :shield

  def initialize(subject, status, color = '#aaa')
    color = Color::CSS[color] if color[0] == '#'

    # subject_width = 37
    # status_width = 53
    full_width = 126
    full_height = 20

    @shield = Rasem::SVGImage.new(width: full_width, height: full_height) do
      linearGradient('b', x2: 0, y2: '100%') do
        stop 0, '#bbb', '.1'
        stop 1, nil, '.1'
      end

      clipPath(id: 'a') do
        rect nil, nil, full_width, full_height, rx: 3, stroke_width: 0, fill: '#fff'
      end

      group 'clip-path' => 'url(#a)' do
        path fill: '#555', d: "M0 0h37v#{full_height}H0z"
        path fill: color, d: "M37 0h89v#{full_height}H37z"
        path fill: 'url(#b)', d: "M0 0h#{full_width}v#{full_height}H0z"
      end

      group(
        fill: '#fff',
        'text-anchor' => 'middle',
        'font-family' => 'DejaVu Sans,Verdana,Geneva,sans-serif',
        'font-size' => 11
      ) do
        text(18.5, 15, fill: '#010101', 'fill-opacity' => '.3') { raw subject }
        text(18.5, 14, fill: '#fff') { raw subject }
        text(80.5, 15, fill: '#010101', 'fill-opacity' => '.3') { raw status }
        text(80.5, 14, fill: '#fff') { raw status }
      end
    end
  end

  def to_s
    shield.to_s
  end

  private

  def string_width(string)
    # Output is (theoretically, anyway) in pixels

    string.chars.inject(0) { |a, e| a + char_width(e) }.round 0
  end

  def char_width(char)
    {
      'i' => 8.0,
      'j' => 9.0,
      'l' => 6.0,
      'm' => 11.0,
      'w' => 11.0,
      '1' => 8.5
    }[char] || 9.0
  end
end
