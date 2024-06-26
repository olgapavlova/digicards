![digital-flashcards](https://github.com/olgapavlova/digicards/assets/5625988/8b62311f-87ab-4d36-aa01-1496301118e7)
# Цифровые карточки для изучения иврита • Digital Flashcards to Study Hebrew
## Что это и зачем
Генератор цифровых карточек с глаголами иврита. Можно поставить в цифровую фоторамку или на скринсейвер компьютера — и в фоновом режиме заучивать глаголы.

## Что нужно, чтобы заработало
* среда разработки [Processing 4](https://processing.org)
* TSV-файл со словами и переводом
* (не обязательно) квадратные иллюстрации в формате PNG

На выходе — **набор PNG-файлов** с карточками глаголов. Их можно загружать в цифровую фоторамку.

https://github.com/olgapavlova/digicards/assets/5625988/9cfb25ad-8ccb-4642-9ecb-8e3c00c92b10

## Откуда взять словарь? А картинки?
Минимальный сет — 66 первых глаголов — можно взять из папки min.

Теперь если вы хотите свой набор. Возможно, таблица слов у вас уже есть. Перегоняйте её в TSV (это вариация на тему CSV) — и всё.

И словарь, и картинки можно попросить у меня. [Напишите мне](mailto:olgapavlova@gmail.com?subject=digicard), а там посмотрим.

## Как настроить
* переменные SCREEN_WIDTH и SCREEN_HEIGHT — размеры экрана вашей цифровой фоторамки
* файл DICTIONARY_FILE с расширением .tsv кладите в подкаталог data целевого скрипта
* в переменных группы Table column configuration придётся разобраться самостоятельно (комменты есть) — они зависят от того, как организована ваша таблица слов
* переменные группы Style можно не трогать
* переменная PATH_DATA — это каталог, в котором будет создан подкаталог с картинками; название целевого каталога — [ширина рамки]x[высота рамки]

## Не хочу настраивать!
Ну ещё бы. [Напишите мне](mailto:olgapavlova@gmail.com?subject=digicard), а там посмотрим. Сейчас нужны бета-тестеры.

## А вот я хочу…
Сейчас нужны бета-тестеры. Не любые, но всё-таки. [Напишите мне](mailto:olgapavlova@gmail.com?subject=digicard), а там посмотрим.
