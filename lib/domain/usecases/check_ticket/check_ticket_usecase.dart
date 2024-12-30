import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/repositories/ticket/ticket_repository.dart';
import 'package:eventpass_app/domain/usecases/check_ticket/check_ticket_params.dart';
import 'package:eventpass_app/domain/usecases/usecase.dart';

class CheckTicketUsecase
    implements Usecase<Result<Map<String, dynamic>>, CheckTicketParams> {
      final TicketRepository ticketRepository;

  CheckTicketUsecase({required this.ticketRepository});

  @override
  Future<Result<Map<String, dynamic>>> call(CheckTicketParams params) async {
    try {

      final result = await ticketRepository.getTicket(params.token, params.eventId);

      if (result.isFailed) {
        return Result.failed(result.errorMessage!);
      }

      return Result.success(result.resultValue!);

    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}
