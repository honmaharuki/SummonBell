class ToodoaItemEntry {
  final int id;
  final String title;
  final String content;
  final int? category;

  ToodoaItemEntry(
      {required this.id,
      required this.title,
      required this.content,
      this.category});
}

class Categorya {
  final int id;
  final String name;

  Categorya({required this.id, required this.name});
}
