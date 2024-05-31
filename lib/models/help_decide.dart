class HelpDecide {
  HelpDecide({required this.item, required this.option});

  String item;
  final List<dynamic> option;

  factory HelpDecide.fromJson(Map<String, dynamic> jsonData) {
    return HelpDecide(
      item: jsonData['item'],
      option: List<String>.from(jsonData['option']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'item': item,
      'option': option,
    };
  }
}
