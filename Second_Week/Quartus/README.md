Файлы 16-ти разрядного счетчика на основе стандартного модуля с настраиваемым параметром и ядром ALTPLL с помощью quartus 
Для запуска проекта используйте файл cnt_pll.qpf
Для того что бы посмотреть коды счетчика используйте файлы с расширение .sv

counter_enb1.sv - Модуль N разрядного счетчика.
По переднему фронту тактового импульса, если reset = 1, обнуляем счетчик, иначе если enable = 1, увеличиваем значение счетчика на 1.   

trigger_x.sv - Вспомогательный модуль.
Это триггер активного состояния, который устанавливает на выходе значение set =1 и сбрасывает его в ноль при reset=1 (некая разновидность D - триггера).

cnt_en_testbanch.sv - Программа тестирования двоичного счетчика с разрешением счета и изменяемой разрядностью на примере 5-разрядного экземпляра.

cnt_pll.sv -  экземпляр 16-разрядного счетчика.
