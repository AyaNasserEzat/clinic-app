import 'package:clinic/core/commons/commons.dart';
import 'package:clinic/core/database/cache/cach_helper.dart';
import 'package:clinic/core/services/service_lcator.dart';
import 'package:clinic/core/utiles/app_color.dart';
import 'package:clinic/core/widgets/ElvatedButtonIcon.dart';
import 'package:clinic/feature/auth/data/model/onBording_model.dart';
import 'package:clinic/feature/auth/presentation/screens/pre_signUp_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBordingSreens extends StatelessWidget {
  onBordingSreens({super.key});
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primary,
        body: PageView.builder(
            controller: controller,
            itemCount: 3,
            itemBuilder: (context, indx) {
              return Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "AR",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        Spacer(),
                        indx != 2
                            ? TextButton(
                                onPressed: () {
                                  controller.jumpToPage(2);
                                },
                                child: Text(
                                  "Skip",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    SizedBox(
                        height: 310,
                        child: Image.asset(
                            OnBoedingModel.onBordingSreens[indx].imagpath)),
                    const SizedBox(
                      height: 40,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 330,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                            bottomLeft: Radius.circular(19),
                            bottomRight: Radius.circular(19),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                OnBoedingModel.onBordingSreens[indx].title,
                                style: GoogleFonts.poppins(
                                  color: AppColor.primary,
                                  fontSize: 24,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                OnBoedingModel.onBordingSreens[indx].subTitle,
                                style: GoogleFonts.poppins(
                                  color: AppColor.primary,
                                  fontSize: 17,
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: SmoothPageIndicator(
                                        controller:
                                            controller, // PageController
                                        count: 3,
                                        effect: const SlideEffect(
                                            dotHeight: 11,
                                            dotWidth:
                                                40), // your preferred effect
                                        onDotClicked: (index) {}),
                                  ),
                                  Expanded(
                                    child: ElevatedButtonIcon(
                                        label: indx != 2 ? 'Next' : 'Start',
                                        onPressed: () async {
                                          if (indx != 2) {
                                            controller.nextPage(
                                                duration: const Duration(
                                                    milliseconds: 1000),
                                                curve: Curves
                                                    .fastLinearToSlowEaseIn);
                                          } else {
                                            await sl<CacheHelper>()
                                                .saveData(
                                                    key: 'onBoardingKey',
                                                    value: true)
                                                .then((value) {
                                              print('onBoarding is Visited');
                                              navigate(
                                                  context: context,
                                                  screen: PreSignUpScren());
                                            }).catchError((e) {
                                              print(e.toString());
                                            });
                                          }
                                        }),
                                    //  Directionality(
                                    //   textDirection: TextDirection.rtl,
                                    //   child: ElevatedButton.icon(
                                    //     style: ElevatedButton.styleFrom(
                                    //         backgroundColor: Colors.white,
                                    //         elevation: 0),
                                    //     onPressed: () {},
                                    //     icon: const Icon(
                                    //       Icons.arrow_back,
                                    //       color: AppColor.primary,
                                    //     ),
                                    //     label: indx != 2
                                    //         ? TextButton(
                                    //             onPressed: () {
                                    //               controller.nextPage(
                                    //                   duration: const Duration(
                                    //                       milliseconds: 1000),
                                    //                   curve: Curves
                                    //                       .fastLinearToSlowEaseIn);
                                    //             },
                                    //             child: Text(
                                    //               'Next',
                                    //               style: GoogleFonts.poppins(
                                    //                 color: AppColor.primary,
                                    //                 fontSize: 18,
                                    //               ),
                                    //             ),
                                    //           )
                                    //         : TextButton(
                                    //             onPressed: () async {
                                    //               await sl<CacheHelper>()
                                    //                   .saveData(
                                    //                       key: 'onBoardingKey',
                                    //                       value: true)
                                    //                   .then((value) {
                                    //                 print(
                                    //                     'onBoarding is Visited');
                                    //                 navigate(
                                    //                     context: context,
                                    //                     screen:
                                    //                         PreSignUpScren());
                                    //               }).catchError((e) {
                                    //                 print(e.toString());
                                    //               });
                                    //             },
                                    //             child: Text(
                                    //               'Start',
                                    //               style: GoogleFonts.poppins(
                                    //                 color: AppColor.primary,
                                    //                 fontSize: 18,
                                    //               ),
                                    //             ),
                                    //           ),
                                    //   ),
                                    // ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
