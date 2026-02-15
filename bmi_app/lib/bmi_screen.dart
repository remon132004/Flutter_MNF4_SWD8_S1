import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  String selectedGender = "Male";
  int height = 150;
  int weight = 70;
  int age = 23;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd1d9e6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome 😊",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "BMI Calculator",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: genderCard(
                    image: "assets/images/ic_outline-male.svg",
                    text: "Male",
                    isSelected: selectedGender == "Male",
                    onTap: () => setState(() => selectedGender = "Male"),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: genderCard(
                    image: "assets/images/ic_outline-female.svg",
                    text: "Female",
                    isSelected: selectedGender == "Female",
                    onTap: () => setState(() => selectedGender = "Female"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            "Height",
                            style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 15),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RotatedBox(
                                  quarterTurns: -1,
                                  child: SliderTheme(
                                    data: SliderTheme.of(context).copyWith(
                                      trackHeight: 12,
                                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
                                      activeTrackColor: const Color(0xff246AFE),
                                      inactiveTrackColor: const Color(0xffd1d9e6),
                                      thumbColor: const Color(0xff246AFE),
                                    ),
                                    child: Slider(
                                      min: 100,
                                      max: 220,
                                      value: height.toDouble(),
                                      onChanged: (v) => setState(() => height = v.toInt()),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "$height",
                                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      "cm",
                                      style: TextStyle(fontSize: 16, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: counterCard(
                            label: "Weight",
                            value: weight,
                            onAdd: () => setState(() => weight++),
                            onRemove: () => setState(() => weight > 5 ? weight-- : null),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: counterCard(
                            label: "Age",
                            value: age,
                            onAdd: () => setState(() => age++),
                            onRemove: () => setState(() => age > 1 ? age-- : null),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            GestureDetector(
              onTap: () {
                double bmi = weight / ((height / 100) * (height / 100));
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    title: const Text("Your Result", textAlign: TextAlign.center),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("Your BMI is", style: TextStyle(fontSize: 18)),
                        const SizedBox(height: 10),
                        Text(
                          bmi.toStringAsFixed(1),
                          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Color(0xff246AFE)),
                        ),
                      ],
                    ),
                    actions: [
                      Center(
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("OK", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                      )
                    ],
                  ),
                );
              },
              child: Container(
                height: 65,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff246AFE),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff246AFE).withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    )
                  ],
                ),
                child: const Center(
                  child: Text(
                    "CALCULATE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget genderCard({required String image, required String text, required bool isSelected, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff246AFE) : Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            if (!isSelected)
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                isSelected ? Colors.white : const Color(0xff246AFE),
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              text,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : const Color(0xff246AFE),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget counterCard({required String label, required int value, required VoidCallback onAdd, required VoidCallback onRemove}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          Text(
            "$value",
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controlButton(Icons.remove, onRemove),
              const SizedBox(width: 24),
              controlButton(Icons.add, onAdd),
            ],
          ),
        ],
      ),
    );
  }

  Widget controlButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xff246AFE),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff246AFE).withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }
}