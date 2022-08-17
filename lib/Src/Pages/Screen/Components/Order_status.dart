import 'package:flutter/material.dart';

class OrderStatus extends StatefulWidget {
  OrderStatus({
    Key? key,
    required this.status,
    required this.isOverdie,
  }) : super(key: key);
  final String status;
  final bool isOverdie;
  final Map<String, int> allStatus = <String, int>{
    'pending payment': 0,
    'refund': 1,
    'paid': 2,
    'Prepare to buy': 3,
    'shipping': 4,
    'delivered': 5
  };

  int get currentStatus => allStatus[status]!;

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StatusDot(
          title: 'Xác nhận đặt hàng',
          isActive: true,
        ),
        const _CustomDivider(),
        if (widget.currentStatus == 1) ...[
          _StatusDot(
            title: 'trả hàng',
            isActive: true,
            refundColor: const Color.fromARGB(255, 236, 87, 32),
          ),
        ] else if (widget.isOverdie) ...[
          _StatusDot(
            title: 'Hết time',
            isActive: true,
            refundColor: const Color.fromARGB(255, 211, 12, 12),
          ),
        ] else ...[
          _StatusDot(
            title: 'Thanh toán',
            isActive: widget.currentStatus >= 2,
          ),
          const _CustomDivider(),
          _StatusDot(
            title: 'Chuẩn bị giao hàng',
            isActive: widget.currentStatus >= 3,
          ),
          const _CustomDivider(),
          _StatusDot(
            title: 'Đang chuyển hàng',
            isActive: widget.currentStatus >= 4,
          ),
          const _CustomDivider(),
          _StatusDot(
            title: 'Giao hàng thành công',
            isActive: widget.currentStatus == 5,
          ),
        ]
      ],
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 10,
      width: 1,
      color: Colors.grey.shade600,
    );
  }
}

class _StatusDot extends StatelessWidget {
  const _StatusDot(
      {Key? key, this.isActive = false, required this.title, this.refundColor})
      : super(key: key);
  final bool isActive;
  final String title;
  final Color? refundColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Dot
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade500),
              color: isActive
                  ? refundColor ?? const Color.fromARGB(255, 63, 226, 69)
                  : Colors.transparent),
          child: isActive
              ? const Icon(
                  Icons.check_outlined,
                  size: 15,
                  color: Colors.white,
                )
              : const SizedBox.shrink(),
        ),
        const SizedBox(
          width: 5,
        ),
        //Text
        Expanded(
          child: Text(title, style: const TextStyle(fontSize: 12.5)),
        ),
      ],
    );
  }
}
