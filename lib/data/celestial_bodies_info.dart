import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

final Box _mybox = Hive.box('db');
loadData() {
  if (_mybox.isEmpty) {
    return _mybox.put('HeavenlyBodies', [
      sun,
      mercury,
      venus,
      earth,
      mars,
      jupiter,
      saturn,
      uranus,
      neptune,
      pluto,
    ]);
  } else {
    return _mybox.get('HeavenlyBodies');
  } // Add this line
}

final List _celestialBodies = loadData();
List<Map<dynamic, dynamic>> convertedList =
    _celestialBodies.map((body) => body as Map<dynamic, dynamic>).toList();

class CelestialBodiesProvider with ChangeNotifier {
  List<Map<dynamic, dynamic>> get celestialBodies => convertedList;

  List<Map<dynamic, dynamic>> getFavorites() {
    List<Map<dynamic, dynamic>> favorites = [];
    for (var body in celestialBodies) {
      if (body['isFavorited'] == true) {
        favorites.add(body);
      }
    }
    return favorites;
  }

  void addFavourites(index) {
    celestialBodies[index]['isFavorited'] = true;
    _mybox.put('HeavenlyBodies', celestialBodies);
    notifyListeners();
  }

  void removeFavourites(index) {
    celestialBodies[index]['isFavorited'] = false;
    _mybox.put('HeavenlyBodies', celestialBodies);
    notifyListeners();
  }
}

Random random = Random();

// Get a random index within the range of the celestialBodies list
int randomIndex = random.nextInt(10);

// Get the random celestial body using the random index
CelestialBodiesProvider cele = CelestialBodiesProvider();
int randomID = cele.celestialBodies[randomIndex]['id'];
Map randomCelestialBody = cele.celestialBodies[randomID];

String solarSystemInfo = """
The solar system consists of the Sun and everything that orbits around it, including planets, dwarf planets, moons, asteroids, comets and meteoroids. At the center lies the Sun, a yellow main-sequence star that provides light, heat and energy to the rest of the solar system. Orbiting at an average distance of 150 million kilometers is the planet Mercury, the smallest and fastest planet, completing three rotations around the Sun every two years. Venus is the second planet and the hottest in the solar system due to its dense carbon dioxide atmosphere trapping heat. Earth, the third planet, is unique in harbouring life and liquid water on its surface. The Red Planet Mars has a thin atmosphere and two small moons - Phobos and Deimos. In the outer solar system lie the four gas and ice giants - Jupiter, Saturn, Uranus and Neptune. Jupiter is the largest planet, containing two and a half times the matter of all other planets combined. Its four largest moons Io, Europa, Ganymede and Callisto were discovered by Galileo Galilei in 1610. 

Beyond Neptune is the Kuiper Belt containing Pluto and other dwarf planets like Haumea, Makemake and Eris. This disk-shaped region also contains smaller objects composed mostly of ice. Even farther out lies the spherical Oort Cloud containing trillions of icy objects surrounding the solar system. Periodically, comets get knocked inwards towards the Sun from this cloud. Comets develop a visible coma and sometimes a tail when they approach the inner solar system. Asteroids are rocky remnants that mostly reside between the orbits of Mars and Jupiter in the Asteroid Belt. The largest, Ceres, is around 950 km in diameter and considered a dwarf planet itself. Interestingly, asteroid Psyche may be the exposed core of a destroyed protoplanet. Meteoroids that get pulled into Earth's atmosphere are called meteors. If they reach the ground intact, these chunks of comet and asteroid material are called meteorites.

The solar system likely formed about 4.6 billion years ago from a giant rotating cloud of gas and dust known as the solar nebula. Gravity caused the nebula to collapse and matter to condense at the center forming the Sun. Conservation of angular momentum caused the flattened spinning disk of leftover material which eventually formed the orbiting planets. The solar system remains gravitationally bound to the Sun and continues to evolve over astronomically long timescales.
""";

String aboutTheApp =
    '''Cosmic is an educational app focused on teaching users about the Sun and planets in our solar system. The app includes detailed information on the 10 main celestial bodies - the Sun, Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune, and Pluto.
The Sun section provides an overview of the Sun including details on its size,temperature and role as the center of the solar system, and how it produces energy through nuclear fusion. 
Each planet section covers the planet's vital statistics like , size, distance from the sun, length of year, number of moons,mass,gravity and temperature. High-quality images showcase details like Jupiter's Great Red Spot, Saturn's rings, ice volcanoes on Pluto.
  Overall, Cosmic provides an immersive and interactive way for users to explore and learn about the Sun, planets and other objects in our solar system. ''';

// Sun
Map sun = {
  "id": 0,
  "name": "Sun",
  "moons": "0",
  "mass": "1988500",
  "distanceFromSun": "0",
  "diameter": "1392700",
  "gravity": "28",
  "lengthOfDay": "607.76",
  "avgTemperature": "5505",
  "image": "lib/assets/planets/sun.png",
  "isFavorited": false,
  "shortDescription": "The star at the center of our Solar System",
  "longDescription":
      "The Sun is a G-type main-sequence star and the star at the center of our solar system. The Sun provides energy to Earth through solar radiation and is by far the largest object in the solar system. The Sun contains 99.8% of the total mass of the entire solar system. The Sun is composed primarily of hydrogen and helium gas. The Sun formed about 4.6 billion years ago and will continue to fuse hydrogen into helium for another 5 billion years. The Sun's core region converts hydrogen to helium and reaches temperatures of 15 million degrees celsius producing energy through nuclear fusion. Energy radiates out through the increasing cooler outer layers before escaping into space as heat and light."
};

// Mercury
Map mercury = {
  "id": 1,
  "name": "Mercury",
  "moons": "0",
  "mass": "0.330",
  "distanceFromSun": "57.9",
  "diameter": "4879",
  "gravity": "0.38",
  "lengthOfDay": "4222.6",
  "avgTemperature": "167",
  "image": "lib/assets/planets/mercury.png",
  "isFavorited": false,
  "shortDescription": "The smallest and fastest planet, nearest the Sun",
  "longDescription":
      "Mercury is the smallest planet in the solar system and the closest to the Sun. It has no moons and is a terrestrial planet with a rocky surface. Mercury is only slightly larger than Earth's moon. It was named after the Roman god Mercury, the messenger of the gods. Mercury orbits the Sun every 88 Earth days and has a rotation period of 59 Earth days, so a solar day on Mercury lasts 176 Earth days. Mercury has essentially no atmosphere to help retain heat, so its surface experiences extreme temperatures ranging from 100°C during the day to -173°C at night. Mercury has a very thin atmosphere of oxygen, sodium, hydrogen, helium and potassium. It has a large iron core equal to 60% of its planetary mass. Mercury's surface is covered in craters like other terrestrial planets. It has no signs of plate tectonics or volcanoes. Scientists think Mercury shrank slightly as its core cooled and solidified over billions of years."
};

// Venus
Map venus = {
  "id": 2,
  "name": "Venus",
  "moons": "0",
  "mass": "4.87",
  "distanceFromSun": "108.2",
  "diameter": "12104",
  "gravity": "0.91",
  "lengthOfDay": "2802",
  "avgTemperature": "464",
  "image": "lib/assets/planets/venus.png",
  "isFavorited": false,
  "shortDescription":
      "Hottest planet due to the greenhouse effect of its dense atmosphere",
  "longDescription":
      "Venus is the second planet from the Sun and is the hottest planet in the solar system with an average surface temperature of 464°C. Venus is a terrestrial planet with a rocky surface covered in craters, volcanoes and lava plains. It is often described as Earth's twin because they are similar in size, mass and density but Venus has evolved to become an extremely hot world with a dense, toxic atmosphere. It has no moons and orbits the Sun every 225 Earth days. Venus spins backwards very slowly with its day lasting longer than its year. Its atmosphere consists mainly of carbon dioxide and nitrogen with clouds of sulfuric acid. These thick clouds completely envelop Venus, producing a runaway greenhouse effect on its surface. Venus has no magnetic field and its surface pressure is 92 times greater than Earth's. It is believed Venus may have had oceans and a more Earth-like environment in the distant past before a runaway greenhouse effect transformed it."
};

// Earth
Map earth = {
  "id": 3,
  "name": "Earth",
  "moons": "1",
  "mass": "5.97",
  "distanceFromSun": "149.6",
  "diameter": "12756",
  "gravity": "1",
  "lengthOfDay": "24",
  "avgTemperature": "15",
  "image": "lib/assets/planets/earth.png",
  "isFavorited": false,
  "shortDescription": "Our home planet, the only known planet to harbour life",
  "longDescription":
      "Earth is the third planet from the Sun and the only astronomical object known to harbour life. Earth is the densest planet in the solar system and the largest terrestrial planet. Earth's surface is 70% water and divided into several continents and oceans. Earth has one natural satellite, the Moon. Earth has an atmosphere comprised mainly of nitrogen and oxygen that supports life. Earth orbits the Sun at an average distance of 149.6 million km with one orbit taking 365.256 days. Earth's axis of rotation is tilted 23.5 degrees producing seasons. The gravitational interaction between Earth and the Moon causes tides. Earth formed over 4.5 billion years ago and life emerged around 3.5 billion years ago. Humans have lived on Earth for at least 200,000 years."
};

// Mars
Map mars = {
  "id": 4,
  "name": "Mars",
  "moons": "2",
  "mass": "0.642",
  "distanceFromSun": "227.9",
  "diameter": "6792",
  "gravity": "0.38",
  "lengthOfDay": "24.7",
  "avgTemperature": "-65",
  "image": "lib/assets/planets/mars.png",
  "isFavorited": false,
  "shortDescription":
      "The red planet, site of many robotic exploration missions paving the way for human exploration",
  "longDescription":
      "Mars is the fourth planet from the Sun and the second smallest after Mercury. Mars is a terrestrial planet with a thin atmosphere composed primarily of carbon dioxide. Mars has two small moons, Phobos and Deimos. Mars takes 687 Earth days to orbit the Sun. Mars rotation period and seasonal cycles are similar to those on Earth. Mars has a dusty red appearance from abundant iron oxide on its surface. Mars polar ice caps grow and shrink following its seasons. Mars surface features include impact craters like the Hellas basin, volcanic regions like Tharsis and Olympus Mons the highest mountain in the solar system, deep canyon systems like Valles Marineris and residual water ice. Several robotic missions by NASA have explored Mars to help determine if Mars ever supported life and pave the way for future human exploration."
};

// Jupiter
Map jupiter = {
  "id": 5,
  "name": "Jupiter",
  "moons": "79",
  "mass": "1898",
  "distanceFromSun": "778.6",
  "diameter": "142984",
  "gravity": "2.54",
  "lengthOfDay": "9.9",
  "avgTemperature": "-110",
  "image": "lib/assets/planets/juipter.png",
  "isFavorited": false,
  "shortDescription":
      "The largest planet, dominated by colorful cloud bands and the Great Red Spot",
  "longDescription":
      "Jupiter is the fifth planet from the Sun and the largest in the solar system. Jupiter is one of the four gas giant planets along with Saturn, Uranus and Neptune. Jupiter has a mass two and a half times larger than all the other planets combined. Jupiter has 79 known moons including Io, Europa, Ganymede and Callisto, the four largest in the solar system. Ganymede is the largest moon in the solar system. Jupiter is composed mainly of hydrogen and helium. Its atmosphere features cloud bands of ammonia, water and ammonia hydrosulfide as well as powerful storms like the Great Red Spot. Jupiter has a powerful magnetic field 14 times stronger than Earth's. Jupiter orbits the Sun once every 11.9 Earth years. Jupiter may have a rocky core of heavier elements amounting to between 3 and 15 times the mass of Earth."
};

// Saturn
Map saturn = {
  "id": 6,
  "name": "Saturn",
  "moons": "82",
  "mass": "568",
  "distanceFromSun": "1433.5",
  "diameter": "120536",
  "gravity": "1.06",
  "lengthOfDay": "10.7",
  "avgTemperature": "-140",
  "image": "lib/assets/planets/saturn.png",
  "isFavorited": false,
  "shortDescription":
      "Adorned with thousands of beautiful rings mainly composed of ice particles",
  "longDescription":
      "Saturn is the sixth planet from the Sun and the second largest planet after Jupiter. Saturn is classified as a gas giant planet and is composed mainly of hydrogen and helium. Saturn has 62 confirmed moons not including hundreds of moonlets within its rings. Titan is Saturn's largest moon and the second largest in the solar system. Saturn is best known for its spectacular ring system which is mostly made of ice particles with some rocky debris and dust. The rings extend hundreds of thousands of miles from the planet. Saturn takes 29 Earth years to orbit the Sun. Saturn is the flattest planet which rotates very fast causing it to bulge at its equator and flatten at the poles. Like Jupiter, Saturn is mostly fluid with no solid surface under the atmosphere."
};

// Uranus
Map uranus = {
  "id": 7,
  "name": "Uranus",
  "moons": "27",
  "mass": "86.8",
  "distanceFromSun": "2872.5",
  "diameter": "51118",
  "gravity": "0.92",
  "lengthOfDay": "17.2",
  "avgTemperature": "-195",
  "image": "lib/assets/planets/uranus.png",
  "isFavorited": false,
  "shortDescription":
      "An ice giant planet tilted on its side orbiting the Sun once every 84 years",
  "longDescription":
      "Uranus is the seventh planet from the Sun and the first to be discovered by telescope. Uranus is classified as an ice giant, a subclass of gas giant. Nearly all of Uranus's mass is made up of a hot dense fluid of icy materials – water, methane and ammonia – above a small rocky core. Uranus has an atmosphere of hydrogen and helium similar to the gas giants. The most distinctive feature of Uranus is that it rotates on its side, nearly in the plane of its solar orbit. This unique tilt makes Uranus appear to orbit the Sun on its side, unlike the other planets. Uranus has 27 known moons which are named after characters from the works of William Shakespeare and Alexander Pope. Uranus takes 84 years to orbit the Sun and has an extreme seasonal cycle because of its tilt."
};

// Neptune
Map neptune = {
  "id": 8,
  "name": "Neptune",
  "moons": "14",
  "mass": "102",
  "distanceFromSun": "4495.1",
  "diameter": "49528",
  "gravity": "1.14",
  "lengthOfDay": "16.1",
  "avgTemperature": "-200",
  "image": "lib/assets/planets/neptune.png",
  "isFavorited": false,
  "shortDescription":
      "A frigid gas giant with a dark blue atmosphere streaked by white clouds",
  "longDescription":
      "Neptune is the eighth and farthest known planet from the Sun. Neptune is the fourth largest and fourth most massive planet, though slightly smaller and less massive than Uranus. Neptune is classified as an ice giant, a subclass of gas giant. Nearly all of Neptune's mass is made up of a hot dense fluid of icy materials – water, methane and ammonia – above a small rocky core. Neptune has a thick atmosphere of hydrogen and helium which gives it a deep blue color with rapidly changing white clouds. Neptune has 14 known moons including Triton, notable for its retrograde orbit and evidence of geological activity. Neptune orbits the Sun once every 165 years and was the first planet discovered by mathematical prediction in 1846."
};

// Pluto
Map pluto = {
  "id": 9,
  "name": "Pluto",
  "moons": "5",
  "mass": "0.0146",
  "distanceFromSun": "5906.4",
  "diameter": "2370",
  "gravity": "0.06",
  "lengthOfDay": "153.3",
  "avgTemperature": "-225",
  "image": "lib/assets/planets/pluto.png",
  "isFavorited": false,
  "shortDescription":
      "A dwarf planet with mountain ranges, valleys, craters and possibly an underground ocean",
  "longDescription":
      "Pluto is a dwarf planet that lies in the Kuiper Belt, a region beyond Neptune. Pluto was discovered in 1930 by Clyde Tombaugh at the Lowell Observatory in Arizona. Pluto was considered the ninth planet until 2006 when it was reclassified as a dwarf planet. Pluto has five known moons including its largest moon Charon, with which it forms a binary system. Pluto has a thin atmosphere of nitrogen, methane and hydrocarbons that freeze and fall to the surface when Pluto moves farther from the Sun. Pluto's surface features polarized sections of frozen nitrogen and methane with water ice caps and mountain peaks and valleys. Pluto may have an internal liquid water ocean. Its composition is rocky with around 70% rock mixed with water ice."
};
