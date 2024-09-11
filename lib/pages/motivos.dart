import 'package:flutter/material.dart';

class Motivos extends StatelessWidget {
  const Motivos({super.key, required this.validez, required this.motivo});
  final bool validez;
  final String motivo;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: validez,
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          children: [
            Container(
              width: 5,
              height: 5,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    100,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                motivo,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
