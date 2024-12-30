import 'package:eventpass_app/domain/entities/ticket/ticket.dart';
import 'package:eventpass_app/domain/usecases/check_ticket/check_ticket_params.dart';
import 'package:eventpass_app/domain/usecases/check_ticket/check_ticket_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TicketState {
  final Ticket? ticket;
  final bool isPurchased;
  final bool isLoading;
  final String? errorMessage;

  const TicketState({
    this.ticket,
    this.isPurchased = false,
    this.isLoading = false,
    this.errorMessage,
  });

  TicketState copyWith({
    Ticket? ticket,
    bool? isPurchased,
    bool? isLoading,
    String? errorMessage,
  }) {
    return TicketState(
      ticket: ticket ?? this.ticket,
      isPurchased: isPurchased ?? this.isPurchased,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class TicketProviderNotifier extends StateNotifier<TicketState> {
  final CheckTicketUsecase _checkTicketUsecase;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  TicketProviderNotifier({
    required CheckTicketUsecase checkTicketUsecase,
  })  : _checkTicketUsecase = checkTicketUsecase,
        super(const TicketState());

  Future<void> checkTicket({
    required String eventId,
  }) async {
    try {
      state = state.copyWith(isLoading: true);

      final token = await _storage.read(key: 'token');

      final params = CheckTicketParams(
        eventId: eventId,
        token: token.toString(),
      );

      final result = await _checkTicketUsecase.call(params);

      if (result.isSuccess) {
        final value = result.resultValue;

        print(value);

        if (value == null) {
          state = state.copyWith(errorMessage: 'Ticket not found');
          return;
        }

        bool isPurchased = value['isPurchased'];

        if (value['ticket'] != null) {
          final ticket = Ticket(
            ticketId: value['ticket']['ticket_id'],
            pin: value['ticket']['pin'],
            transactionId: value['ticket']['transaction_id'],
            eventId: value['ticket']['event_id'],
            createdAt: DateTime.parse(value['ticket']['created_at']),
            updatedAt: DateTime.parse(value['ticket']['updated_at']),
          );

          state = state.copyWith(
            isPurchased: isPurchased,
            ticket: isPurchased ? ticket : null,
          );
        } else {
          state = state.copyWith(isPurchased: false);
        }
      } else {
        state = state.copyWith(errorMessage: result.errorMessage);
      }
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
      rethrow;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
