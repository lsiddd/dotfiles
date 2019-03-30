id=$(xinput list | grep Touchpad | awk '{print $6}' | cut -b 4-)
prop=$(xinput list-props $id | grep "Tapping Enabled" | head -n 1 | awk '{print $4}' | cut -b 2- | cut -b -3)

xinput set-prop $id $prop 1
