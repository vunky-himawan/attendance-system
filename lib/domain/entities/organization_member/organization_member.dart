class OrganizationMember {
  final String organizationMemberId;
  final String userId;
  final String eventOrganizerId;
  String? currentEventId;

  OrganizationMember({
    required this.organizationMemberId,
    required this.userId,
    required this.eventOrganizerId,
    this.currentEventId,
  });
}
