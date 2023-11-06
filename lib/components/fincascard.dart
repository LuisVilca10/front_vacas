import 'package:flutter/material.dart';
import 'package:vacas_front/animation/FadeAnimation.dart';

class FincasCard extends StatelessWidget {
  const FincasCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            FadeAnimation(
              0.5,
              Container(
                height: 130,
                padding: EdgeInsets.all(8),
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://cdnx.jumpseller.com/3841/image/34731799/WhatsApp_Image_2023-02-16_at_12.55.44.jpeg?1683039580")),
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(217, 217, 217, 217),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Finca de prueba",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Juan calla",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
