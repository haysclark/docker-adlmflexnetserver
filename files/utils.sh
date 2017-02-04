#!/bin/bash
#
# ADLMFlexNetServer Entrypoint Utils, 2017
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy of 
# this software and associated documentation files (the "Software"), to deal in 
# the Software without restriction, including without limitation the rights to 
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
# of the Software, and to permit persons to whom the Software is furnished to do 
# so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all 
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
# SOFTWARE.
#
# Hays Clark (c) 2017
#

PRINT_LOGO() {
	echo "                                                                    "
	echo "                                ##        .                         "
	echo "                          ## ## ##       ==                         "
	echo "                       ## ## ## ##      ===                         "
	echo '                   /""""""""""""""""\\\___/ ===                     '
	echo "              ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~                "
	echo "                   \\\______ o          __/                         "
	echo "                     \\\    \\\        __/                          "
	echo "                      \\\____\\\______/                             "
	echo "                                                                    "
	echo "  _   _           __  __ _    _      _    ___ _    _____  ___       "
	echo " | | | |_ _  ___ / _|/ _(_)__(_)__ _| |  | __| |  | __\ \/ / |_ __  "
	echo " | |_| | ' \/ _ \  _|  _| / _| / _\` | |  | _|| |__| _| >  <| | '  \ "
	echo "  \___/|_||_\___/_| |_| |_\__|_\__,_|_|  |_| |____|___/_/\_\_|_|_|_|"
	echo "    _  _     _                  _      ___                          "
	echo "   | \| |___| |___ __ _____ _ _| |__  / __| ___ _ ___ _____ _ _     "
	echo "   | .\` / -_)  _\ V  V / _ \ '_| / /  \__ \/ -_) '_\ V / -_) '_|    "
	echo "   |_|\_\___|\__|\_/\_/\___/_| |_\_\  |___/\___|_|  \_/\___|_|      "
	echo "                                                                    "
}

PRINT_LINEBREAK() {
	echo "---------------------------------------------------------------------------"
}
