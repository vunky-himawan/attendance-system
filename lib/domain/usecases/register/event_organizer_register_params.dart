class EventOrganizerRegisterParams {
  final String organizationName;
  final String organizationDescription;
  final String organizationAddress;
  final String organizationEmail;
  final String organizationPhone;

  EventOrganizerRegisterParams(
      {required this.organizationName,
      required this.organizationDescription,
      required this.organizationAddress,
      required this.organizationEmail,
      required this.organizationPhone});

  Map<String, dynamic> toMap() {
    return {
      'organization_name': organizationName,
      'description': organizationDescription,
      'address': organizationAddress,
      'email': organizationEmail,
      'phone_number': organizationPhone,
    };
  }
}
