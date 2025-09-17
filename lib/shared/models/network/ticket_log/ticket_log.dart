import 'package:freezed_annotation/freezed_annotation.dart';
import '../ticket/ticket.dart';

part 'ticket_log.freezed.dart';
part 'ticket_log.g.dart';

/// 票据日志数据模型
///
/// 用于票据使用记录和历史管理
@freezed
class TicketLog with _$TicketLog {
  const factory TicketLog({
    String? canReserveToTime,
    String? createdTime,
    @Default(0) int id,
    String? studentId,
    @Default(0) int usedTotal,
    Ticket? ticket,
    @Default(false) bool isShow,
  }) = _TicketLog;

  /// 从 JSON 创建 TicketLog 实例
  factory TicketLog.fromJson(Map<String, dynamic> json) => _$TicketLogFromJson(json);
}
