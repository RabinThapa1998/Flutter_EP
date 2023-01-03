class Category {
  String name;
  String thumbnail;
  int noOfCourses;

  Category({
    required this.name,
    required this.thumbnail,
    required this.noOfCourses,
  });
}

List<Category> categoryList = [
  Category(
    name: 'MBBS',
    noOfCourses: 20,
    thumbnail: 'assets/icons/mbbs1.svg',
  ),
  Category(
    name: 'IOE',
    noOfCourses: 55,
    thumbnail: 'assets/icons/engineer1.svg',
  ),
  // Category(
  //   name: 'BSC-Nursing',
  //   noOfCourses: 16,
  //   thumbnail: 'assets/icons/photography.jpg',
  // ),
  // Category(
  //   name: 'BBA',
  //   noOfCourses: 25,
  //   thumbnail: 'assets/icons/design.jpg',
  // ),
];
