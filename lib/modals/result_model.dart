class Result {
  final String name;
  final String image;
  final String symptoms;
  final String recommendations;
  final String organiccontrol;
  final String chemicalcontrol;
  Result(
    this.name,
    this.image,
    this.symptoms,
    this.recommendations,
    this.organiccontrol,
    this.chemicalcontrol,
  );

  factory Result.fromJson(dynamic json) {
    return Result(
        json['name'],
        json['image'],
        json['symptoms'],
        json['recommendations'],
        json['organiccontrol'],
        json['chemicalcontrol']);
  }

  @override
  String toString() {
    return 'Result(name: $name, image: $image, symptoms: $symptoms, recommendations: $recommendations, organiccontrol: $organiccontrol, chemicalcontrol: $chemicalcontrol)';
  }
}
