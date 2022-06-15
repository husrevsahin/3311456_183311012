class User {
  final int id;
  final String name;
  final String imageUrl;
  final bool isOnline;

  User({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isOnline,
  });
}

List<User> persons = [
  User(
    id: 1,
    name: 'Ahmet Cevahir Çınar',
    imageUrl: 'assets/images/indir.jpg',
    isOnline: true,
  ),
  User(
    id: 2,
    name: 'Hüsrev Şahin',
    imageUrl: 'assets/images/profil.jpg',
    isOnline: true,
  ),
  User(
    id: 4,
    name: 'Ömer Orhan',
    imageUrl: 'assets/images/profil.jpg',
    isOnline: false,
  ),
  User(
    id: 5,
    name: 'Samet Kara',
    imageUrl: 'assets/images/profil.jpg',
    isOnline: true,
  ),
  User(
    id: 3,
    name: 'Muaz Okur',
    imageUrl: 'assets/images/profil.jpg',
    isOnline: false,
  ),
  User(
    id: 7,
    name: 'Hakan Öz',
    imageUrl: 'assets/images/profil.jpg',
    isOnline: false,
  ),
  User(
    id: 6,
    name: 'kullanici 1',
    imageUrl: 'assets/images/profil.jpg',
    isOnline: false,
  ),
  User(
    id: 8,
    name: 'kullanici 2',
    imageUrl: 'assets/images/profil.jpg',
    isOnline: false,
  ),
];
// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'kullanici 2',
  imageUrl: 'assets/images/profil.jpg',
  isOnline: true,
);
// USERS
final User ironMan = User(
  id: 1,
  name: 'Ahmet Cevahir Çınar',
  imageUrl: 'assets/images/indir.jpg',
  isOnline: true,
);
final User captainAmerica = User(
  id: 2,
  name: 'Hüsrev Şahin',
  imageUrl: 'assets/images/pp.jpg',
  isOnline: true,
);
final User hulk = User(
  id: 3,
  name: 'Muaz Okur',
  imageUrl: 'assets/images/muaz.jpg',
  isOnline: false,
);
final User scarletWitch = User(
  id: 4,
  name: 'kullanici 1',
  imageUrl: 'assets/images/profil.jpg',
  isOnline: false,
);
final User spiderMan = User(
  id: 5,
  name: 'Samet Kara',
  imageUrl: 'assets/images/samet.jpg',
  isOnline: true,
);
final User blackWindow = User(
  id: 6,
  name: 'Ömer Orhan',
  imageUrl: 'assets/images/omer.jpg',
  isOnline: false,
);
final User thor = User(
  id: 7,
  name: 'Hakan Öz',
  imageUrl: 'assets/images/profil.jpg',
  isOnline: false,
);
final User captainMarvel = User(
  id: 8,
  name: 'kullanici 2',
  imageUrl: 'assets/images/profil.jpg',
  isOnline: false,
);
