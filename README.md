[![Build Status](https://travis-ci.org/frolmr/potok_calc.svg?branch=master)](https://travis-ci.org/frolmr/potok_calc)

# Репозиторий тестового задания

Используемая версия ruby: 2.4.0
Используемая версия rails: 5.1.1
База данных: Postgresql

Приложение работает по адресу: https://ancient-island-91794.herokuapp.com/

Для расчета предполагаемого дохода необходимо внести в поле предполагаемую сумму инвестиций и нажать кноку "Рассчитать".

### Задача: реализовать калькулятор доходности на основания оптимистичного прогноза по ставке, а так же на основе имеющихся истоических данных по закрытым ранее займам

Входная информация:

* Оптимистичная ставка доходности
* Закрытые ранее займы

Закрытый ранее займ представляет из себя совокупность следующих данных:
* Сумма займа
* Срок кредитования
* Ставка по кредиту
* Ставка по кредиту при несвоевременном погашении задолженности
* Платежи в счет погашения по месяцам

### Комментарии к реализация

Калькулятор реализован следующим образом:
Добавлена модель для хранения информации по закрытым займам. Модель содержит следующие поля:
* Тело(body): сумма займа (вводимое поле, тип float)
* Срок(term): срок займа в месяцах (вводимое поле, тип integer)
* Платжи(payments): все платежи по займу (вводимое поле, массив чисел типа float)
* Доход(profit): сумма дохода по займу (вычисляемое поле, тип float) - вычисляется как разница между суммой всех элементов масива платежей и тела займа
* Доходность(profit_rate): годовая доходность по займу в процентах (вычисляемое поле, тип float) - вычисляется как частное дохода и тела займа с учетом 12 месяцев в году

Для минификации обращений к базе данных так же добавлена модель, хранящая в себе данные по текущим ставкам: оптимистичной и реалистичной. Оптимистичная ставка вводится вручную, в то в время как реалистичная рассчитывается автоматически как среднее доходностей ранних займов. При добавлении информации о закрытом займе, реалистичная ставка пересчитывается.