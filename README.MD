STEP1: install library
sudo apt-get install wiringpi mpd mpc libmpdclient2 libfreetype6 libasound2-plugin-equal

STEP2: preconfig
sudo nano /etc/mpd.conf
change audio_output to these lines:

audio_output {
                 type           "alsa"
                 name           "Output"
                 device         "plug:plugequal"
}

sudo nano /etc/asound.conf

ctl.equal {
        type equal;
}

pcm.plugequal {
        type equal;
        slave.pcm "plughw:0,0"; #card1 would be plughw:1,0
}

pcm.!default{
        type plug;
        slave.pcm plugequal;
}

STEP3: run program
cd ~
git clone https://github.com/FishTest/kazoo --depth 1
cd kazoo
sudo ./aoide

STEP4: autostart while pi start
sudo nano /etc/rc.local
add these lines before "exit 0;"
cd /home/pi/aoide
./aoide &

Others:
1/Update program:
cd kazoo
git pull

_2016_03_07_
