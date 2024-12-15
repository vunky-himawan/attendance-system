import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/entities/ticket/ticket.dart';
import 'package:eventpass_app/domain/repositories/events/events_repository.dart';
import 'package:eventpass_app/domain/usecases/registration_event/registration_event_params.dart';
import 'package:eventpass_app/domain/usecases/usecase.dart';

class RegistrationEventUsecase
    implements Usecase<Result<Ticket>, RegistrationEventParams> {
  final EventsRepository eventsRepository;

  RegistrationEventUsecase({required this.eventsRepository});

  @override
  Future<Result<Ticket>> call(RegistrationEventParams params) async {
    try {
      final ticket = await eventsRepository.registrationEvent(
          params.eventId, params.participantId);

      if (ticket.isFailed) {
        return const Result.success(Ticket(
          ticketId: '',
          eventId: '',
          transactionId: '',
          pin: '',
        ));
      }

      return Result.success(ticket.resultValue!);
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}
