import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eventpass_app/domain/entities/event_organizer/event_organizer.dart';
import 'package:eventpass_app/domain/entities/participant/participant.dart';
import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/entities/user/user/user.dart';
import 'package:eventpass_app/domain/repositories/user/user_repository.dart';
import 'package:eventpass_app/infrastructure/config/api_client.dart';
import 'package:eventpass_app/infrastructure/config/app_config.dart';

class UserRepositoryImplementation implements UserRepository {
  final ApiClient _apiClient;

  UserRepositoryImplementation({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();

  @override
  Future<Result<User>> createUser(
      {required String userId,
      required String username,
      required String email,
      required String role,
      String? photo_url}) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<Result<Map<String, dynamic>>> getUserByUserId(
      {required String userId}) async {
    try {
      final response = await _apiClient.dio
          .get('${AppConfig.apiBaseUrl}/user?user_id=$userId');

      if (response.data['status'] == 'error') {
        return Result.failed(response.data['detail']);
      }

      final responseData = response.data['data'];

      if (responseData == null) {
        return Result.failed('User data not found');
      }

      return Result.success(responseData);
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<User>> updateUser({required User user}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> uploadProfilePicture(
      {required User user, required File imageFile}) {
    // TODO: implement uploadProfilePicture
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> getUserDetails({required String userId}) async {
    try {
      final response = await _apiClient.dio.get(
        '${AppConfig.apiBaseUrl}/user?user_id=$userId',
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      if (response.data['status'] != 'success') {
        return Result.failed(
            response.data['message'] ?? 'Unknown error occurred');
      }

      final responseData = response.data['data'];

      if (responseData == null) {
        return Result.failed('User data not found');
      }

      print("INI RESPONSE ${response}");

      // Parsing User
      var user = User(
        userId: responseData['user_id'],
        username: responseData['username'],
        email: responseData['email'],
        role: responseData['role'],
        photoUrl: responseData['profile_photo'],
      );

      // Parsing UserDetails berdasarkan role
      switch (responseData['role']) {
        case 'PARTICIPANT':
          if (responseData['details'] != null) {
            final participant = Participant(
                participantName: responseData['details']['participant_name'],
                age: responseData['details']['age'],
                gender: responseData['details']['gender'],
                birthDate: responseData['details']['birth_date'],
                participantId: responseData['details']['participant_id'],
                amount: responseData['details']['amount']);
            user = user.copyWith(
              details: UserDetails.participant(participant: participant),
            );
          }
          break;

        case 'EVENT_ORGANIZER':
          if (responseData['details'] != null) {
            final eventOrganizer = EventOrganizer(
              eventOrganizerId: responseData['details']['event_organizer_id'],
              address: responseData['details']['address'],
              email: responseData['details']['email'],
              description: responseData['details']['description'],
              organizationName: responseData['details']['organization_name'],
              phoneNumber: responseData['details']['phone_number'],
              amount: responseData['details']['amount'],
            );
            user = user.copyWith(
              details:
                  UserDetails.eventOrganizer(eventOrganizer: eventOrganizer),
            );
          }
          break;

        case 'RECEPTIONIST':
          if (responseData['details'] != null) {
            user = user.copyWith(
              details: UserDetails.organizationMember(
                organizationMemberId: responseData['details']
                    ['organization_member_id'],
                userId: responseData['details']['user_id'],
                eventOrganizerId: responseData['details']['event_organizer_id'],
              ),
            );
          }
          break;

        default:
          break;
      }

      return Result.success(user);
    } catch (e) {
      return Result.failed('Failed to get user details: ${e.toString()}');
    }
  }
}
