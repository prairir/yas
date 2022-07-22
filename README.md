# yas

Like `yes` but in zig and I made it

## Usage

It takes an optional positional arguement.
If optional arguement is given, it prints arguement+'\n' forever.

Else prints "y\n" forever.

## Benchmarking

Its not as fast as `gnu yes` but its no slouch.

Running `yas | pv -r > /dev/null`, I get 6.35GiB/s.

My computer has i5-1135G7 CPU and 16GiB RAM.
