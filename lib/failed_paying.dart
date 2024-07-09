import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FailYouView extends StatelessWidget {
  const FailYouView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf6f6f6),
      body: Transform.translate(
        offset: const Offset(0, -16),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 130, bottom: 130),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              FailureScreen(),
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
                      FontAwesomeIcons.times,
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

class FailureScreen extends StatelessWidget {
  const FailureScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  'Transaction Failed!',
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
                'Please try again',
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
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    FontAwesomeIcons.barcode,
                    size: 70,
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
                        'FAILED',
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
                    ((MediaQuery.sizeOf(context).height * .2 + 30) / 2) - 29,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
