class Laws {
  final int id;
  final String category;
  final String titleEn;
  final String titleMl;
  final String lawReference;
  final String descriptionEn;
  final String descriptionMl;
  final String penaltyEn;
  final String penaltyMl;

  Laws({
    required this.id,
    required this.category,
    required this.descriptionEn,
    required this.descriptionMl,
    required this.lawReference,
    required this.penaltyEn,
    required this.penaltyMl,
    required this.titleEn,
    required this.titleMl,
  });

  factory Laws.fromJson(Map<String, dynamic> json) {
    return Laws(
      id: json['id'],
      category: json['category'],
      descriptionEn: json['descriptionEn'],
      descriptionMl: json['descriptionMl'],
      lawReference: json['lawReference'],
      penaltyEn: json['penaltyEn'],
      penaltyMl: json['penaltyMl'],
      titleEn: json['titleEn'],
      titleMl: json['titleMl'],
    );
  }
}
