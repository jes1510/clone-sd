#!/bin/bash
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.

#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.

#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# Requires 'dialog', 'pv', and 'guage' to be installed

if [ $UID -ne 0 ]; then
    echo "$0 requires root privileges" 1>&2
    exit 1
  fi


if [ -f $1 ] ; then	
	(pv -n $1 | sudo dd of=/dev/mmcblk0 bs=16M) \
		2>&1 | dialog --gauge "Copying image to card..." 10 70 0
	echo "Done!"
	exit 0
	
else
	echo "Unable to find $1" 1>&2
	exit 1
fi