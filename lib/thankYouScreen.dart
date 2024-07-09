import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:parking/models/reserve_api_model.dart';
import 'package:parking/thankYouView.dart';

class ThankYouView extends StatefulWidget {
  final double price;
  final bool paymentSuccessful;

  const ThankYouView(
      {super.key, required this.price, required this.paymentSuccessful});

  @override
  State<ThankYouView> createState() => _ThankYouViewState();
}

class _ThankYouViewState extends State<ThankYouView> {
  @override
  void initState() {
    super.initState();
    if (widget.paymentSuccessful && widget.price < 10) {
      _notifyBackend();
    }
  }

  Future<void> _notifyBackend() async {
    String? reservationCode = await ReservationApiModel.getReservationCode();
    if (reservationCode == null) {
      print('Reservation code not found. Please reserve a slot first.');
      return;
    }

    Dio dio = Dio();
    final data = {'reservation_code': reservationCode};
    print('Sending data to backend: $data');
    try {
      final response = await dio.post(
        'https://cse-parking.up.railway.app/api/receive-reservation-code/', // ضع عنوان الـ API الفعلي الخاص بك هنا
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
          validateStatus: (status) {
            return true; // قبول كافة رموز الحالة
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Backend notified successfully: ${response.data}');
      } else {
        print('Failed to notify backend: ${response.data}');
      }
    } catch (e) {
      print('Failed to notify backend: $e');
      if (e is DioError) {
        print('Dio Error: ${e.response?.data}');
        print('Dio Headers: ${e.response?.headers}');
        print('Dio Request: ${e.requestOptions}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf6f6f6),
      body: Transform.translate(
        offset: const Offset(0, -16),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              ThankYouCard(price: widget.price),
              Positioned(
                bottom: MediaQuery.sizeOf(context).height * .2 + 20,
                left: 20 + 8,
                right: 20 + 8,
                child: Row(
                  children: List.generate(
                    30,
                    (index) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Container(
                          color: Color(0xFF8c8caa),
                          height: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  left: -20,
                  bottom: MediaQuery.sizeOf(context).height * .2,
                  child: CircleAvatar(
                    backgroundColor: Color(0xFFf6f6f6),
                  )),
              Positioned(
                  right: -20,
                  bottom: MediaQuery.sizeOf(context).height * .2,
                  child: CircleAvatar(
                    backgroundColor: Color(0xFFf6f6f6),
                  )),
              Positioned(
                top: -50 + 70,
                left: 0,
                right: 0,
                child: const CircleAvatar(
                  radius: 50,
                  backgroundColor: const Color(0xFFEDEDED),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: const Color(0xFF58508d),
                    child: Icon(
                      Icons.check,
                      size: 50,
                      color: const Color(0xFFEDEDED),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
