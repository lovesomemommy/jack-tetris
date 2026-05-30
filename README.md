# Jack Tetris

Классический **Тетрис** на языке Jack (курс [Nand2Tetris](https://www.nand2tetris.org/)).

**Репозиторий:** https://github.com/lovesomemommy/jack-tetris-game

## Запуск

1. Установите [nand2tetris](https://www.nand2tetris.org/software.php) (нужны `tools/JackCompiler.sh` и `tools/VMEmulator.sh`).
2. Из корня репозитория:

```bash
./run.sh
```

Или вручную:

1. **VM Emulator** → File → Open Directory → папка `vm/`
2. **Run → Reset Program**, затем **Run → Go** (F5)
3. **Animate → None** (иначе игра тормозит)
4. Если клавиши не работают — нажмите иконку клавиатуры в эмуляторе

## Управление

| Клавиша | Действие |
|---------|----------|
| ← → | двигать фигуру |
| ↑ | поворот |
| ↓ | мягкое падение |
| Пробел | мгновенный сброс |
| Q | выход / перезапуск после Game Over |

## Сборка из исходников

```bash
export NAND2TETRIS="$HOME/Desktop/nand2tetris"
"$NAND2TETRIS/tools/JackCompiler.sh" src
cp src/*.vm vm/
cp "$NAND2TETRIS/tools/OS"/*.vm vm/
```

Переменная `NAND2TETRIS` может указывать на другой путь к nand2tetris.

## Структура проекта

```
jack-tetris/
├── README.md
├── run.sh          # компиляция + запуск эмулятора
├── src/            # исходники Jack (.jack)
└── vm/             # скомпилированный код + OS (готово к запуску)
```

## Архитектура

| Файл | Назначение |
|------|------------|
| `Main.jack` | точка входа |
| `TetrisGame.jack` | игровой цикл, ввод, счёт, уровни |
| `Board.jack` | поле 10×20, блокировка фигур, очистка линий |
| `Piece.jack` | позиция, поворот, координаты блоков |
| `TetrominoData.jack` | 7 фигур × 4 поворота |
| `Random.jack` | генератор случайных чисел (LCG) |
| `Renderer.jack` | экран, HUD, заголовок, подпись |

## Особенности Jack / OS

- **Screen** — отрисовка поля и фигур (чёрно-белая графика)
- **Output** — текст: счёт, линии, уровень, подсказки
- **Keyboard** — управление
- **Array**, **Memory**, **Math**, **Sys.wait** — данные и игровой цикл
