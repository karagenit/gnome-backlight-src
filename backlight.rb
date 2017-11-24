#!/usr/bin/env ruby

# All backlight.rb code is Copyright 2011 by Pascal Ryckmans <firestarter87@users.sf.net>.
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 2 of the License.
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
# You can find a copy of the GNU General Public License on <http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt>.

# I wanted to change my screen brightness on Debian Wheezy with Gnome3, trough the normal menu.
# This didn't seem to work after some searching I found the file I needed to change in order to change the brightness.
# This script gives me easy access to the file to change my backlight fast and easy.
# This script is tested on a Acer Aspire 7750 with Debian GNU/Linux 'Wheezy'.

# Make this script executable to make it it work!
# Also add a line to your .bashrc file for easy access: alias backlight="sudo /DESTINATION_OF_RUBY_SCRIPT.rb"

def is_numeric?(s)
    !!Float(s) rescue false
end

$info = ARGV[0]

if (($info != nil) && (is_numeric?($info)))
	puts "Your backlight value is now set to #{$info}."
	$path = File.expand_path("/sys/class/backlight/intel_backlight/brightness")
	open( $path, "w" ) do |brightness|
	brightness.puts "#{$info}"
	end
	
else
	puts "Your backlight value is"
	exec ('cat /sys/class/backlight/intel_backlight/brightness')
	end
