import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class ThankYouCard extends StatelessWidget {
  final double price;

  const ThankYouCard({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final String formattedDate = DateFormat('MM/dd/yyyy').format(now);
    final String formattedTime = DateFormat('hh:mm a').format(now);

    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Container(
        width: double.infinity,
        decoration: ShapeDecoration(
          color: const Color(0xFFEDEDED),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30 + 16, left: 22, right: 22),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 20),
                child: Text(
                  'Thank you!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(88, 80, 141, 1),
                    fontSize: 33,
                    fontFamily: 'Pacifico',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              const Text(
                'Your transaction was successful',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(116, 106, 123, 1),
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 42,
              ),
              Row(
                children: [
                  const Text(
                    'Date',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(88, 80, 141, 1),
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    formattedDate,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    'Time',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(88, 80, 141, 1),
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    formattedTime,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                height: 40,
                thickness: 2,
              ),
              Row(
                children: [
                  const Text(
                    'Total',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Color.fromRGBO(88, 80, 141, 1),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${price.toStringAsFixed(2)} EGP',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 305,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
                decoration: const ShapeDecoration(
                  color: Color.fromRGBO(161, 134, 177, 0.4),
                  shape: RoundedRectangleBorder(),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset('images/new/master_card.svg'),
                    const SizedBox(
                      width: 23,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // تعديل لجعل النصوص تبدأ من اليسار
                      children: [
                        const Text(
                          'Credit Card',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        Text(
                          'Mastercard **46',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    FontAwesomeIcons.barcode,
                    size: 64,
                  ),
                  Container(
                    width: 113,
                    height: 58,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1.50,
                          color: Color.fromRGBO(88, 80, 141, 1),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'PAID',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ).copyWith(
                          color: Color.fromRGBO(88, 80, 141, 1),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height:
                    ((MediaQuery.sizeOf(context).height * .2 + 20) / 2) - 29,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
