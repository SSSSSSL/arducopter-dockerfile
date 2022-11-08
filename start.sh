#! /bin/bash

#docker run -it -d -p 5763:5763 --rm --name sitl-4.0.7 -v $(pwd)/locations.txt:/ardupilot/Tools/autotest/locations.txt ardupilot:Copter-4.0.7

# custom Location
#docker run -it -d -p 5763:5763 --rm --name sitl-4.0.7 -v $(pwd)/locations.txt:/ardupilot/Tools/autotest/locations.txt ardupilot:Copter-4.0.7 /ardupilot/Tools/autotest/sim_vehicle.py -v ArduCopter -L RGBLAB




docker run -it -d -p 5763:5763 --rm --name sitl-4.0.7_0 -v $(pwd)/locations.txt:/ardupilot/Tools/autotest/locations.txt ardupilot:Copter-4.0.7 /ardupilot/Tools/autotest/sim_vehicle.py -v ArduCopter -L RGBLAB
docker run -it -d -p 5764:5763 --rm --name sitl-4.0.7_1 -v $(pwd)/locations.txt:/ardupilot/Tools/autotest/locations.txt ardupilot:Copter-4.0.7 /ardupilot/Tools/autotest/sim_vehicle.py -v ArduCopter -L Pyramid
docker run -it -d -p 5765:5763 --rm --name sitl-4.0.7_2 -v $(pwd)/locations.txt:/ardupilot/Tools/autotest/locations.txt ardupilot:Copter-4.0.7 /ardupilot/Tools/autotest/sim_vehicle.py -v ArduCopter -L SKT
docker run -it -d -p 5766:5763 --rm --name sitl-4.0.7_3 -v $(pwd)/locations.txt:/ardupilot/Tools/autotest/locations.txt ardupilot:Copter-4.0.7 /ardupilot/Tools/autotest/sim_vehicle.py -v ArduCopter -L SpringValley
