import 'package:flutter/material.dart';
import '../../resources/r.dart';
import '../../utils/widgets/common_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.homeBgColor,
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(
                height: 66,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 40,
                  ),
                  Container(
                    width: 146,
                    height: 44,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xff00000005),
                              blurRadius: 10,
                              spreadRadius: 0)
                        ],
                        color: R.color.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Select PG",
                          style: R.styles.fontPoppins
                              .merge(R.styles.fz16Fw500)
                              .copyWith(color: R.color.black),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.expand_circle_down_sharp)),
                      ],
                    ),
                  ),
                  Container(
                    width: 42,
                    height: 38,
                    decoration: BoxDecoration(
                        color: R.color.primaryColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30))),
                    child: Image.asset("assets/images/icon _bell.png"),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                        height: 214,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 0,
                                color: Color(0xff0000001a),
                                blurRadius: 10,
                              )
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 16),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Breakfast",
                                    style: R.styles.fontPoppins
                                        .merge(R.styles.fz14Fw500)
                                        .copyWith(color: R.color.black),
                                  ),
                                  Text(
                                    "Lunch",
                                    style: R.styles.fontPoppins
                                        .merge(R.styles.fz14Fw500)
                                        .copyWith(color: R.color.black),
                                  ),
                                  Text(
                                    "Dinner",
                                    style: R.styles.fontPoppins
                                        .merge(R.styles.fz14Fw500)
                                        .copyWith(color: R.color.black),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 11,
                              ),
                              Container(
                                height: 1,
                                width: MediaQuery.of(context).size.width,
                                color: const Color(0xffD9D9D9),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const DosaWidget(),
                              const SizedBox(
                                height: 6,
                              ),
                              const DosaWidget(),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "9Am to 11Am",
                                    style: R.styles.fontPoppins
                                        .merge(R.styles.fz10Fw400)
                                        .copyWith(
                                            color: R.color.secondaryTextColor),
                                  ),
                                  Text(
                                    "12Am to 2Am",
                                    style: R.styles.fontPoppins
                                        .merge(R.styles.fz10Fw400)
                                        .copyWith(
                                            color: R.color.secondaryTextColor),
                                  ),
                                  Text(
                                    "8Am to 10Am",
                                    style: R.styles.fontPoppins
                                        .merge(R.styles.fz10Fw400)
                                        .copyWith(
                                            color: R.color.secondaryTextColor),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 26,
                                    width: 58,
                                    decoration: BoxDecoration(
                                        color: R.color.primaryColor,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Center(
                                        child: Text(
                                      "Update",
                                      style: R.styles.fontPoppins
                                          .merge(R.styles.fz10Fw500)
                                          .copyWith(color: R.color.white),
                                    )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 28,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "My PG",
                          style: R.styles.fontPoppins
                              .merge(R.styles.fz22Fw500)
                              .copyWith(color: R.color.primaryColor),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Container(
                      height: 99,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: R.color.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 22,
                          ),
                          Container(
                            height: 57,
                            width: 57,
                            decoration: BoxDecoration(
                                color: R.color.lightPrimaryColor,
                                borderRadius: BorderRadius.circular(6)),
                            child: Image.asset("assets/images/room.png"),
                          ),
                          const SizedBox(
                            width: 22,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "All Rooms: 20",
                                style: R.styles.fontPoppins
                                    .merge(R.styles.fz16Fw500)
                                    .copyWith(color: R.color.black),
                              ),
                              Text(
                                "All floors: 04",
                                style: R.styles.fontPoppins
                                    .merge(R.styles.fz16Fw500)
                                    .copyWith(color: R.color.black),
                              )
                            ],
                          ),
                          const SizedBox(width: 43),
                          Align(
                              alignment: Alignment.topRight,
                              child: Image.asset("assets/images/abstract.png"))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "My Rents",
                          style: R.styles.fontPoppins
                              .merge(R.styles.fz22Fw500)
                              .copyWith(color: R.color.primaryColor),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Container(
                      height: 99,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: R.color.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 57,
                            width: 57,
                            decoration: BoxDecoration(
                                color: R.color.lightPrimaryColor,
                                borderRadius: BorderRadius.circular(6)),
                            child: Image.asset("assets/images/room.png"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Members paid: 20(32)",
                                style: R.styles.fontPoppins
                                    .merge(R.styles.fz16Fw500)
                                    .copyWith(color: R.color.black),
                              ),
                              Text(
                                "Members unpaid: 12",
                                style: R.styles.fontPoppins
                                    .merge(R.styles.fz16Fw500)
                                    .copyWith(color: R.color.black),
                              )
                            ],
                          ),
                          Align(
                              alignment: Alignment.topRight,
                              child: Image.asset("assets/images/abstract.png"))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
