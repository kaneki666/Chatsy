class User {
  String? username;
  String? message;
  String? timesent;
  bool? icon;
  bool? messagesent;
  String? image;

  User(
      {required this.username,
      required this.message,
      required this.timesent,
      required this.icon,
      required this.messagesent,
      required this.image});
}

List<User> usersData = [
  User(
      username: "Tanin Rahman",
      message: "discord ay",
      timesent: "10 mint ago",
      icon: true,
      image: "assets/images/1.jpg",
      messagesent: true),
  User(
      username: "Elman khan Shezan",
      message: "ok",
      timesent: "15 mint ago",
      icon: false,
      image: "assets/images/2.jpg",
      messagesent: false),
  User(
      username: "Mehrar iqbal",
      message: "De",
      timesent: "20 mint ago",
      icon: false,
      image: "assets/images/3.jpg",
      messagesent: false),
  User(
      username: "Nafis Muntasir Zami",
      message: "Drum e bhorbo!",
      timesent: "40 mint ago",
      image: "assets/images/4.jpg",
      icon: false,
      messagesent: false),
  User(
      username: "Saiful Islam Khan",
      message: "discord ay",
      timesent: "10 mint ago",
      image: "assets/images/5.jpg",
      icon: false,
      messagesent: false),
  User(
      username: "Elman khan Shezan",
      message: "ok",
      timesent: "15 mint ago",
      icon: false,
      image: "assets/images/2.jpg",
      messagesent: false),
  User(
      username: "Mehrar iqbal",
      message: "De",
      timesent: "20 mint ago",
      icon: false,
      image: "assets/images/3.jpg",
      messagesent: false),
  User(
      username: "Nafis Muntasir Zami",
      message: "Drum e bhorbo!",
      timesent: "40 mint ago",
      image: "assets/images/4.jpg",
      icon: false,
      messagesent: false),
  User(
      username: "Saiful Islam Khan",
      message: "discord ay",
      timesent: "10 mint ago",
      image: "assets/images/5.jpg",
      icon: false,
      messagesent: false),
];
