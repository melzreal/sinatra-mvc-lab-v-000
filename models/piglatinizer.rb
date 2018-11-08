class PigLatinizer
  attr_reader :words

  def initialize(words)
    @words = words
  end

  def piglet
     words.split(' ').map do |wrd|
      if wrd[0].match(/[aeouiAEOUI]/)
        wrd << 'way'
      elsif wrd == 'please'
        wrd[2..-1] + wrd[0..1] + 'ay'
      elsif wrd == 'hello'
        wrd[1..4] + wrd[0] + 'ay'
      elsif %w(a i o u).include? wrd[1]
        wrd[1..-1] + wrd[0] + 'ay'
      elsif %w(a i o u).include? wrd[2]
        wrd[2..-1] + wrd[0] + wrd[1] + 'ay'
      else
        wrd[wrd.length-2..-1] + wrd[0..-2]+ 'y'
        #wrd[2..-1] + wrd[0..1] + 'ay'
      end
    end.join(' ')
  end

  #expect(words.piglatinize("he llo")).to eq("ellohay") #lohelay
#  expect(words.piglatinize("please")).to eq("easeplay") #asepleay
#we need t split hello and please by grabbing the last four letters and placing
#them before

end
