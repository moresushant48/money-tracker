import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:money_tracker/screens/phone_auth/cubit/phone_auth_cubit.dart';
import 'package:money_tracker/utilities/widgets.dart';
import 'package:pinput/pinput.dart';

class PhoneAuthPage extends StatelessWidget {
  static const route = "/auth";
  PhoneAuthPage({Key? key}) : super(key: key);

  String verificationId = "";
  PageController pageController = PageController();
  TextEditingController phoneController = TextEditingController();
  var mobileFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: double.infinity,
                    height: constraints.maxHeight,
                    color: Theme.of(context).primaryColor,
                    child: Column(
                      children: [
                        Lottie.network(
                            'https://assets9.lottiefiles.com/packages/lf20_2rhnd8qq.json',
                            height: 250),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      height: constraints.maxHeight * 0.67,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(42.0),
                          topRight: Radius.circular(42.0),
                        ),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
                        listener: (context, state) {
                          if (state is PhoneAuthSendOtpSuccess) {
                            pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.decelerate);
                          } else if (state is PhoneAuthSendOtpFailure) {
                          } else if (state is PhoneAuthOtpVerifySuccess) {
                            Future.delayed(Duration(seconds: 3), () {
                              Navigator.pushReplacementNamed(context, "/");
                            });
                          }
                        },
                        builder: (context, state) {
                          if (state is PhoneAuthOtpVerifySuccess) {
                            return Lottie.network(
                                'https://assets8.lottiefiles.com/packages/lf20_9ljdzxac.json');
                          } else
                            return PageView(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              controller: pageController,
                              allowImplicitScrolling: false,
                              children: [
                                Form(
                                  key: mobileFormKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      //
                                      Text(
                                        "Mobile Number",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(
                                        "We need to send OTP to authenticate you number",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 32.0,
                                      ),
                                      UtilityWidgets().textFormField(
                                        context,
                                        controller: phoneController,
                                        hintText: "Enter Mobile Number",
                                        textInputType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        validators: (String? str) {
                                          if (str!.isEmpty)
                                            return "Mobile Number can't be empty.";
                                          else if (str.length != 10) {
                                            return "Please enter 10 digit mobile number.";
                                          }
                                          return null;
                                        },
                                      ),
                                      SizedBox(
                                        height: 32.0,
                                      ),

                                      UtilityWidgets().button(
                                        context,
                                        text: "SEND OTP",
                                        filled: true,
                                        width: 200,
                                        onPressed: () {
                                          sendOtp(context);
                                        },
                                      )
                                      //
                                    ],
                                  ),
                                ),

                                // 2nd element
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //
                                    Text(
                                      "OTP",
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Text(
                                      "Please enter the OTP sent to you mobile",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 32.0,
                                    ),
                                    Pinput(
                                      length: 6,
                                      onCompleted: (pin) {
                                        BlocProvider.of<PhoneAuthCubit>(context)
                                            .verifyOtp(verificationId, pin);
                                      },
                                    ),

                                    SizedBox(
                                      height: 32.0,
                                    ),
                                    UtilityWidgets().button(
                                      context,
                                      text: "Verify OTP",
                                      filled: true,
                                      width: 200,
                                    )
                                    //
                                  ],
                                ),
                              ],
                            );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  sendOtp(BuildContext context) {
    if (mobileFormKey.currentState!.validate()) {
      BlocProvider.of<PhoneAuthCubit>(context)
          .sendOtp(phoneController.text.trim(),
              (String verificationId, int? forceResendCode) {
        this.verificationId = verificationId;
      });
    }
  }
}
