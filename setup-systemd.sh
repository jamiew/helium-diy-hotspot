#!/bin/bash
sudo cp lora_pkt_fwd.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl restart lora_pkt_fwd 
