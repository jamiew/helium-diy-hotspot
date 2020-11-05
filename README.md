**DEPRECATED**

**This repository is not actively maintained and is provided as reference only.** For a more active project please try [Wheaties466/helium_miner_scripts](https://github.com/Wheaties466/helium_miner_scripts)


helium-diy-hotspot
==================

Some setup and update scripts for a DIY Helium hotspot based
on the RAK2244 Pilot Gateway -- which uses the sx1301 chip

If you're using a RAK2287 with the sx1302, you'll need to adjust
the gateway/packet_forwarder setup. There are other good guides for that:

* https://github.com/maco2035/DiyHeliumHotspots/blob/master/RAK2287/Raspberry%20Pi%204B/Guide.md

Setup
-----

Follow the usual instructions for setting up rpi4 and 
compiling gateway & lora_packet_forwarder, from [developer.helium.com "How to build a hotspot"](https://developer.helium.com/hotspot/developer-setup)

Then checkout this repository and initialize our submodules:

```
git checkout https://github.com/jamiew/helium-diy-hotspot 
cd helium-diy-hotspot
git submodule init
```


Packet Forwarder
----------------

First, compile the packet_forawrder per Helium "how to build a hotspot" instructions above if you haven't already

Then instead of running directly, setup the systemd script and rsyslog drain for the packet forwarder. The systemd
script will make the packet forwarder run at boot.

```
sudo cp systemd/lora_pkt_fwd.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable lora_pkt_fwd.service

sudo cp rsyslogd/lora_pkt_fwd.conf /etc/rsyslog.d/
sudo systemctl restart rsyslog
```

You should see some logs coming to `/var/log/lora_pkt_fwd.log`, or use:

```
./logs-forwarder.sh
```


Miner
-----

To run miner, use the `./update-miner.sh` script, which is a submodule checkout
of https://github.com/Wheaties466/helium_miner_scripts

This uses docker, which you can install with:

```
sudo ./get-docker.sh
sudo usermod -aG docker pi
```

Then run the docker container:

```
./run-miner.sh
```

(this currently aliases to the very-helpful ./update-miner.sh script, which fetches the latest
miner build automatically)

TODO add a cronjob to run ./update-miner.sh at at least daily! I've started running it hourly, and
arguably could run even more often. Most of the time it does nothing


Logs/Monitoring
---------------

Basic log tailing for now

```
./logs-miner.sh
```

```
./logs-forwarder.sh
````


License
-------

MIT. Pull requests welcome
