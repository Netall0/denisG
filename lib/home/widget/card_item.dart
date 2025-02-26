import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Верхняя часть карточки с лейблом и иконкой сердечка
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // BEST SELLER метка - исправлена в соответствии со скриншотом

                // Иконка сердечка (избранное)
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.grey[400],
                    size: 22,
                  ),
                ),
              ],
            ),

            // Изображение кроссовка
            const SizedBox(height: 10),
            Center(
              child: Container(
                height: 90,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Image.asset(
                  'assets/blue_shoe.png',
                  fit: BoxFit.contain,
                  // Fallback для случая отсутствия изображения
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 90,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.directions_run,
                      size: 40,
                      color: Colors.blue[800],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFFDEF1FF), // Более точный цвет фона
                borderRadius: BorderRadius.circular(3),
              ),
              child: const Text(
                'BEST SELLER',
                style: TextStyle(
                  color: Color(0xFF50B4E5), // Точный голубой цвет
                  fontSize: 8, // Уменьшен размер шрифта
                  fontWeight: FontWeight.w600,
                  letterSpacing:
                      0.3, // Добавлен небольшой межбуквенный интервал
                ),
              ),
            ),

            // Название товара
            const SizedBox(height: 10),
            const Text(
              'Nike Air Max',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),

            // Цена и кнопка добавления
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Цена
                const Text(
                  '₽752.00',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                // Кнопка добавления
                Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    color: Color(0xFF50B4E5),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
