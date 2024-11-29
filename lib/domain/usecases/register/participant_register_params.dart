class ParticipantRegisterParams {
  final String fullName;
  final String age;
  final String birthDate;
  final String gender;

  const ParticipantRegisterParams({
    required this.fullName,
    required this.age,
    required this.birthDate,
    required this.gender,
  });

  // Mengonversi data ke dalam map
  Future<Map<String, dynamic>> toMap() async {
    return {
      'participant_name': fullName,
      'age': age,
      'birth_date': birthDate,
      'gender': _convertGender(gender),
    };
  }

  String _convertGender(String gender) {
    if (gender == 'Laki-laki') {
      return 'LAKI_LAKI';
    }

    return 'PEREMPUAN';
  }
}
