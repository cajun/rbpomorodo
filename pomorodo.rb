require 'rubygems'
require 'bundler/setup'

require 'eventmachine'


$inbreak = false 
$pomorodo_count = 0.0
$pomorodo_set = 0.0


puts 'start work...'
EM::run do

  EM::add_periodic_timer(5*60) do
    if $inbreak
      puts '...break done'
      $inbreak = false
      play
    elsif $pomorodo_count == 1
      pause
      $inbreak = true
      $pomorodo_count = 0
    else
      $pomorodo_count += 0.25
      puts '...tick'
    end
  end
  
  def play
    puts 'start work...'
    `echo -n 'p' > ~/.config/pianobar/ctl`
  end

  def pause
    puts 'break time...'
    $inbreak = true
    `echo -n 'p' > ~/.config/pianobar/ctl`
  end

end
