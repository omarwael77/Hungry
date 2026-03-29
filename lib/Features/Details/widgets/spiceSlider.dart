import 'package:flutter/material.dart';


class SpicySlider extends StatefulWidget {
  final ValueChanged<double> onChanged; // هيرجع القيمة للـ parent

  const SpicySlider({super.key, required this.onChanged});

  @override
  State<SpicySlider> createState() => _SpicySliderState();
}

class _SpicySliderState extends State<SpicySlider> {
  double value = 0.4;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "🥶",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 14,
                ),
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 4,
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 0),
                    activeTrackColor: Colors.red,
                    inactiveTrackColor: Colors.grey.shade300,
                    thumbColor: Colors.black12,
                  ),
                  child: Slider(
                    value: value,
                    min: 0,
                    max: 1,
                    onChanged: (v) {
                      setState(() => value = v);
                      widget.onChanged(value); // نرسل القيمة للخارج
                    },
                  ),
                ),
              ),
              Text(
                "🌶",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}