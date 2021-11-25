class Contributor {
  Contributor(
      {required this.name,
      required this.id,
      required this.contributionPerMonth,
      required this.deposited,
      required this.withdrawn});
  final String? name;
  final int? contributionPerMonth;
  final int? deposited;
  final int? withdrawn;
  final String id;

  factory Contributor.fromMap(Map<String, dynamic> data, String id) {
    final String? name = data['name'];
    final int? contributionPerMonth = data['contributionPerMonth'];
    final int? deposited = data['deposited'];
    final int? withdrawn = data['withdrawn'];
    if (name == null || contributionPerMonth == null) {
      return Contributor(
          name: '',
          id: '',
          contributionPerMonth: 0,
          deposited: 0,
          withdrawn: 0);
    }
    return Contributor(
        id: id,
        name: name,
        contributionPerMonth: contributionPerMonth,
        deposited: deposited,
        withdrawn: withdrawn);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'contributionPerMonth': contributionPerMonth,
      'deposited': deposited,
      'withdrawn': withdrawn,
    };
  }
}
